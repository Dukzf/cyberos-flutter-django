# tests.py

from django.test import TestCase
from .models import Ordem

class OrdemModelTest(TestCase):
    def setUp(self):
        self.ordem = Ordem.objects.create(
            numero='12345',
            descricao='Teste de ordem',
            status='aberta',
            prioridade='media'
        )

    def test_ordem_creation(self):
        self.assertEqual(self.ordem.numero, '12345')
        self.assertEqual(self.ordem.descricao, 'Teste de ordem')
        self.assertEqual(self.ordem.status, 'aberta')
        self.assertEqual(self.ordem.prioridade, 'media')

    def test_ordem_str(self):
        self.assertEqual(str(self.ordem), 'Ordem 12345')  # Assuming __str__ method returns 'Ordem {numero}'