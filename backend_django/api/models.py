from django.db import models


class Item(models.Model):
    """Simple Item model

    Fields:
    - nome: short name
    - descricao: longer description
    """
    nome = models.CharField(max_length=200)
    descricao = models.TextField(blank=True)

    def __str__(self):
        return self.nome
