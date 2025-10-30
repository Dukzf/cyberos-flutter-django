from django import forms
from .models import OrdemServico

class OrdemServicoForm(forms.ModelForm):
    class Meta:
        model = OrdemServico
        fields = [
            'cliente',
            'equipamento',
            'categoria',
            'tecnico',
            'status',
            'prioridade',
            'data_agendamento',
            'descricao',
            'solucao',
            'endereco',
            'numero_endereco',
            'complemento',
            'bairro',
            'cidade',
            'estado',
            'cep',
            'valor_servico',
            'valor_pecas',
            'valor_deslocamento',
            'desconto',
            'observacoes',
            'interno',
        ]
        widgets = {
            'descricao': forms.Textarea(attrs={'rows': 3}),
            'solucao': forms.Textarea(attrs={'rows': 3}),
            'observacoes': forms.Textarea(attrs={'rows': 3}),
            'data_agendamento': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }