from django.urls import path
from . import views

urlpatterns = [
    path('', views.listar_ordens, name='listar_ordens'),
    path('nova/', views.nova_ordem, name='nova_ordem'),
    path('editar/<slug:slug>/', views.editar_ordem, name='editar_ordem'),
    path('detalhe/<slug:slug>/', views.detalhe_ordem, name='detalhe_ordem'),
]