from django.urls import path
from . import views

urlpatterns = [
    path('', views.list_orders, name='list_orders'),
    path('editar/<slug:slug>/', views.edit_order, name='edit_order'),
    path('detalhe/<slug:slug>/', views.order_detail, name='order_detail'),
    path('novo/', views.create_order, name='create_order'),
]