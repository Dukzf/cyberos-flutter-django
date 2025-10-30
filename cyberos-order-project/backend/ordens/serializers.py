from rest_framework import serializers
from .models import OrdemServico, Cliente, Equipamento, Categoria, Tecnico

class ClienteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cliente
        fields = '__all__'

class EquipamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Equipamento
        fields = '__all__'

class CategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Categoria
        fields = '__all__'

class TecnicoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tecnico
        fields = '__all__'

class OrdemServicoSerializer(serializers.ModelSerializer):
    cliente = ClienteSerializer()
    equipamento = EquipamentoSerializer()
    categoria = CategoriaSerializer()
    tecnico = TecnicoSerializer()

    class Meta:
        model = OrdemServico
        fields = '__all__'

    def create(self, validated_data):
        cliente_data = validated_data.pop('cliente')
        equipamento_data = validated_data.pop('equipamento')
        categoria_data = validated_data.pop('categoria')
        tecnico_data = validated_data.pop('tecnico')

        cliente = Cliente.objects.create(**cliente_data)
        equipamento = Equipamento.objects.create(**equipamento_data)
        categoria = Categoria.objects.create(**categoria_data)
        tecnico = Tecnico.objects.create(**tecnico_data)

        ordem_servico = OrdemServico.objects.create(cliente=cliente, equipamento=equipamento, categoria=categoria, tecnico=tecnico, **validated_data)
        return ordem_servico

    def update(self, instance, validated_data):
        cliente_data = validated_data.pop('cliente', None)
        equipamento_data = validated_data.pop('equipamento', None)
        categoria_data = validated_data.pop('categoria', None)
        tecnico_data = validated_data.pop('tecnico', None)

        if cliente_data:
            for attr, value in cliente_data.items():
                setattr(instance.cliente, attr, value)
            instance.cliente.save()

        if equipamento_data:
            for attr, value in equipamento_data.items():
                setattr(instance.equipamento, attr, value)
            instance.equipamento.save()

        if categoria_data:
            for attr, value in categoria_data.items():
                setattr(instance.categoria, attr, value)
            instance.categoria.save()

        if tecnico_data:
            for attr, value in tecnico_data.items():
                setattr(instance.tecnico, attr, value)
            instance.tecnico.save()

        for attr, value in validated_data.items():
            setattr(instance, attr, value)

        instance.save()
        return instance