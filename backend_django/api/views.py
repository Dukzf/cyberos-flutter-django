from rest_framework import viewsets
from .models import Item
from .serializers import ItemSerializer


class ItemViewSet(viewsets.ModelViewSet):
    """ViewSet to list, retrieve, create, update, delete Items"""
    queryset = Item.objects.all().order_by('id')
    serializer_class = ItemSerializer
