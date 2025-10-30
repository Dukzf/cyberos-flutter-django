from django.shortcuts import render, get_object_or_404, redirect
from .models import OrdemServico
from .forms import OrdemServicoForm
from django.contrib import messages

def editar_ordem(request, slug):
    ordem = get_object_or_404(OrdemServico, slug=slug)
    
    if request.method == 'POST':
        form = OrdemServicoForm(request.POST, instance=ordem)
        if form.is_valid():
            form.save()
            messages.success(request, 'Ordem de serviço atualizada com sucesso!')
            return redirect('detalhe_ordem', slug=ordem.slug)
    else:
        form = OrdemServicoForm(instance=ordem)
    
    context = {
        'ordem': ordem,
        'form': form,
    }
    return render(request, 'ordens/editar_ordem.html', context)

def listar_ordens(request):
    ordens = OrdemServico.objects.all()
    context = {
        'ordens': ordens,
    }
    return render(request, 'ordens/listar_ordens.html', context)

def detalhe_ordem(request, slug):
    ordem = get_object_or_404(OrdemServico, slug=slug)
    context = {
        'ordem': ordem,
    }
    return render(request, 'ordens/detalhe_ordem.html', context)