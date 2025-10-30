from django.urls import path
from . import views

urlpatterns = [
    path('', views.listar_produtos, name='listar_produtos'),
    path('novo/', views.novo_produto, name='novo_produto'),
    path('detalhe/<slug:slug>/', views.detalhe_produto, name='detalhe_produto'),
    path('editar/<slug:slug>/', views.editar_produto, name='editar_produto'),
    path('movimentar/<slug:slug>/', views.movimentar_estoque, name='movimentar_estoque'),
    path('historico/', views.historico_movimentacoes, name='historico_movimentacoes'),
    path('historico/<slug:slug>/', views.historico_movimentacoes, name='historico_produto'),
    path('exportar/csv/', views.exportar_produtos_csv, name='exportar_produtos_csv'),
    path('categorias/', views.categorias, name='categorias_produtos'),
    path('ajax/categorias/criar/', views.criar_categoria_produto_ajax, name='criar_categoria_produto_ajax'),
    path('ajax/unidades/criar/', views.criar_unidade_ajax, name='criar_unidade_ajax'),
] 