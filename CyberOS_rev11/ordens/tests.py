from django.test import TestCase
from .models import OrdemServico, Cliente, Equipamento

class OrdemServicoModelTest(TestCase):
    def setUp(self):
        self.cliente = Cliente.objects.create(nome='Cliente Teste', cpf='12345678901')
        self.equipamento = Equipamento.objects.create(nome='Equipamento Teste', codigo='EQ123', cliente=self.cliente)
        self.ordem = OrdemServico.objects.create(cliente=self.cliente, equipamento=self.equipamento, descricao='Teste de descrição')

    def test_ordem_servico_creation(self):
        self.assertEqual(self.ordem.cliente.nome, 'Cliente Teste')
        self.assertEqual(self.ordem.equipamento.nome, 'Equipamento Teste')
        self.assertEqual(self.ordem.descricao, 'Teste de descrição')

    def test_ordem_servico_str(self):
        self.assertEqual(str(self.ordem), f'OS {self.ordem.id} - {self.ordem.cliente.nome}')

    def test_ordem_servico_status_default(self):
        self.assertEqual(self.ordem.status, 'aberta')  # Assuming 'aberta' is the default status

    def test_ordem_servico_prioridade_default(self):
        self.assertEqual(self.ordem.prioridade, 'baixa')  # Assuming 'baixa' is the default priority

# Additional tests can be added as needed for views, forms, etc.