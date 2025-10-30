from django.core.management.base import BaseCommand
from django.utils import timezone
from django.db import models
from tecnicos.models import Tecnico
from utils.geocode import geocode_address_variants

class Command(BaseCommand):
    help = 'Tenta reprocessar geocoding para tecnicos sem coordenadas usando multiplas variantes de endereco'

    def add_arguments(self, parser):
        parser.add_argument('--limit', type=int, default=0, help='Limita o numero de tecnicos processados (0 = todos)')
        parser.add_argument('--dry-run', action='store_true', help='Nao persiste as alteracoes; apenas mostra o que seria feito')

    def handle(self, *args, **options):
        limit = options.get('limit') or 0
        dry_run = options.get('dry_run')

        qs = Tecnico.objects.filter(models.Q(latitude__isnull=True) | models.Q(longitude__isnull=True))
        total = qs.count()
        self.stdout.write(f'Encontrados {total} tecnicos sem coordenadas')

        if limit and limit > 0:
            qs = qs[:limit]

        processed = 0
        updated = 0

        for tecnico in qs:
            endereco = f"{tecnico.endereco} {tecnico.numero or ''} {tecnico.bairro or ''} {tecnico.cidade or ''} {tecnico.estado or ''}"
            try:
                res = geocode_address_variants(address=endereco, cep=tecnico.cep, cidade=tecnico.cidade, estado=tecnico.estado)
                processed += 1
                if res:
                    lat, lng = res
                    self.stdout.write(f"[OK] Tecnico {tecnico.id} {tecnico.nome_completo} -> {lat},{lng}")
                    if not dry_run:
                        tecnico.latitude = lat
                        tecnico.longitude = lng
                        tecnico.ultima_atualizacao_local = timezone.now()
                        tecnico.save(update_fields=['latitude', 'longitude', 'ultima_atualizacao_local'])
                    updated += 1
                else:
                    self.stdout.write(f"[NO] Tecnico {tecnico.id} {tecnico.nome_completo} -> sem resultado")
            except Exception as e:
                self.stdout.write(f"[ERR] Tecnico {tecnico.id} -> erro: {str(e)}")

        self.stdout.write(f'Processados: {processed} — Atualizados: {updated}')
