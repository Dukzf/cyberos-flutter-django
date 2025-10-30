from django.contrib import admin
from .models import OrdemServico, Cliente, Equipamento, Categoria, Tecnico

@admin.register(OrdemServico)
class OrdemServicoAdmin(admin.ModelAdmin):
    list_display = ('numero', 'cliente', 'status', 'data_criacao')
    search_fields = ('numero', 'cliente__nome')
    list_filter = ('status', 'prioridade')

@admin.register(Cliente)
class ClienteAdmin(admin.ModelAdmin):
    list_display = ('nome', 'cpf', 'cnpj', 'telefone')
    search_fields = ('nome', 'cpf', 'cnpj')

@admin.register(Equipamento)
class EquipamentoAdmin(admin.ModelAdmin):
    list_display = ('codigo', 'nome', 'marca', 'modelo')
    search_fields = ('codigo', 'nome')

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    list_display = ('nome',)
    search_fields = ('nome',)

@admin.register(Tecnico)
class TecnicoAdmin(admin.ModelAdmin):
    list_display = ('nome_completo', 'especialidade')
    search_fields = ('nome_completo',)