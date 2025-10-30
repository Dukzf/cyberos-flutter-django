"""
URL configuration for cyberOS project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views

from . import views as cyberOS_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('dashboard.urls')),
    path('ordens/', include('ordens.urls')),
    path('clientes/', include('clientes.urls')),
    path('tecnicos/', include('tecnicos.urls')),
    path('login/', auth_views.LoginView.as_view(template_name='login.html'), name='login'),
    path('logout/', cyberOS_views.custom_logout_view, name='logout'),
    path('produtos/', include('produtos.urls')),
    path('relatorios/', include('relatorios.urls')),
    path('equipamentos/', include('equipamentos.urls')),
    path('usuarios/', include('usuarios.urls')),
    path('sair/', cyberOS_views.sair_view, name='sair'),
    
    # API para aplicativo móvel
    path('api/', include('cyberOS.api_urls')),
]

# Servir arquivos de mídia e estáticos em ambiente de desenvolvimento
if settings.DEBUG:
    print(f"Configurando acesso a arquivos estáticos e de mídia em ambiente de desenvolvimento")
    print(f"MEDIA_URL: {settings.MEDIA_URL}, MEDIA_ROOT: {settings.MEDIA_ROOT}")
    print(f"STATIC_URL: {settings.STATIC_URL}, STATIC_ROOT: {settings.STATIC_ROOT}")
    
    # Rota para servir arquivos de mídia em desenvolvimento
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    
    # Rota para servir arquivos estáticos em desenvolvimento
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
