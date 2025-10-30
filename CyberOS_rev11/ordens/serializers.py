from rest_framework import serializers
from .models import OrdemServico

class OrdemServicoSerializer(serializers.ModelSerializer):
    class Meta:
        model = OrdemServico
        fields = '__all__'  # or specify the fields you want to include, e.g., ['id', 'numero', 'cliente', 'equipamento', 'status', 'descricao', 'solucao', 'data_agendamento', 'valor_servico', 'valor_pecas', 'valor_deslocamento', 'desconto', 'observacoes']