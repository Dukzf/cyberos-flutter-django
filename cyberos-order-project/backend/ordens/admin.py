from django.contrib import admin
from .models import OrdemServico

@admin.register(OrdemServico)
class OrdemServicoAdmin(admin.ModelAdmin):
    list_display = ('numero', 'cliente', 'status', 'data_criacao')
    search_fields = ('numero', 'cliente__nome')
    list_filter = ('status', 'prioridade')
    ordering = ('-data_criacao',)