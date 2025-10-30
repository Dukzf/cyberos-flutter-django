from django.db import models

class Cliente(models.Model):
    nome = models.CharField(max_length=255)
    cpf = models.CharField(max_length=14, blank=True, null=True)
    cnpj = models.CharField(max_length=18, blank=True, null=True)
    telefone = models.CharField(max_length=15, blank=True, null=True)
    endereco = models.CharField(max_length=255, blank=True, null=True)
    numero_endereco = models.CharField(max_length=10, blank=True, null=True)
    complemento = models.CharField(max_length=100, blank=True, null=True)
    bairro = models.CharField(max_length=100, blank=True, null=True)
    cidade = models.CharField(max_length=100, blank=True, null=True)
    estado = models.CharField(max_length=2, blank=True, null=True)
    cep = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return self.nome

class Equipamento(models.Model):
    cliente = models.ForeignKey(Cliente, related_name='equipamentos', on_delete=models.CASCADE)
    codigo = models.CharField(max_length=50, unique=True)
    nome = models.CharField(max_length=255)
    marca = models.CharField(max_length=100, blank=True, null=True)
    modelo = models.CharField(max_length=100, blank=True, null=True)

    def __str__(self):
        return f"{self.codigo} - {self.nome}"

class OrdemServico(models.Model):
    STATUS_CHOICES = [
        ('aberta', 'Aberta'),
        ('em_andamento', 'Em Andamento'),
        ('aguardando_peca', 'Aguardando Peça'),
        ('aguardando_cliente', 'Aguardando Cliente'),
        ('concluida', 'Concluída'),
        ('cancelada', 'Cancelada'),
    ]

    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    equipamento = models.ForeignKey(Equipamento, on_delete=models.CASCADE, blank=True, null=True)
    categoria = models.CharField(max_length=255, blank=True, null=True)
    tecnico = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='aberta')
    prioridade = models.CharField(max_length=20, choices=[
        ('baixa', 'Baixa'),
        ('media', 'Média'),
        ('alta', 'Alta'),
        ('urgente', 'Urgente'),
    ], default='media')
    data_agendamento = models.DateTimeField(blank=True, null=True)
    descricao = models.TextField()
    solucao = models.TextField(blank=True, null=True)
    endereco = models.CharField(max_length=255, blank=True, null=True)
    numero_endereco = models.CharField(max_length=10, blank=True, null=True)
    complemento = models.CharField(max_length=100, blank=True, null=True)
    bairro = models.CharField(max_length=100, blank=True, null=True)
    cidade = models.CharField(max_length=100, blank=True, null=True)
    estado = models.CharField(max_length=2, blank=True, null=True)
    cep = models.CharField(max_length=10, blank=True, null=True)
    valor_servico = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    valor_pecas = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    valor_deslocamento = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    desconto = models.DecimalField(max_digits=10, decimal_places=2, default=0)
    observacoes = models.TextField(blank=True, null=True)
    interno = models.BooleanField(default=False)

    def __str__(self):
        return f"OS {self.id} - {self.cliente.nome}"