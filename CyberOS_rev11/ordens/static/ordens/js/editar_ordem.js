document.addEventListener('DOMContentLoaded', function() {
    // Auto-fechar alertas após 5 segundos
    const alertas = document.querySelectorAll('.alert-dismissible');
    alertas.forEach(alerta => {
        setTimeout(() => {
            const bsAlert = new bootstrap.Alert(alerta);
            bsAlert.close();
        }, 5000);
    });
    
    // Exibir informações do cliente quando selecionado
    const clienteSelect = document.getElementById('cliente');
    const clienteInfo = document.getElementById('cliente-info');
    
    if (clienteSelect.value) {
        clienteInfo.classList.add('show');
    }
    
    clienteSelect.addEventListener('change', function() {
        if (this.value) {
            clienteInfo.classList.add('show');
        } else {
            clienteInfo.classList.remove('show');
        }
    });
    
    // Seletor de prioridade
    const prioridadeOptions = document.querySelectorAll('.prioridade-option');
    const prioridadeInput = document.getElementById('prioridade');
    
    prioridadeOptions.forEach(option => {
        option.addEventListener('click', function() {
            // Remover a classe 'selected' de todas as opções
            prioridadeOptions.forEach(opt => opt.classList.remove('selected'));
            
            // Adicionar a classe 'selected' à opção clicada
            this.classList.add('selected');
            
            // Atualizar o valor do input hidden
            prioridadeInput.value = this.getAttribute('data-value');
        });
    });
    
    // Atualizar o valor total quando os valores são alterados
    const valorServico = document.getElementById('valor_servico');
    const valorPecas = document.getElementById('valor_pecas');
    const valorDeslocamento = document.getElementById('valor_deslocamento');
    const desconto = document.getElementById('desconto');
    const valorTotal = document.getElementById('valor-total');
    
    const calcularTotal = function() {
        const servico = parseFloat(valorServico.value) || 0;
        const pecas = parseFloat(valorPecas.value) || 0;
        const deslocamento = parseFloat(valorDeslocamento.value) || 0;
        const desc = parseFloat(desconto.value) || 0;
        
        const total = servico + pecas + deslocamento - desc;
        valorTotal.textContent = `R$ ${total.toFixed(2)}`;
    };
    
    valorServico.addEventListener('input', calcularTotal);
    valorPecas.addEventListener('input', calcularTotal);
    valorDeslocamento.addEventListener('input', calcularTotal);
    desconto.addEventListener('input', calcularTotal);
    
    // Usar endereço do cliente
    const usarEnderecoCliente = document.getElementById('usar-endereco-cliente');
    if (usarEnderecoCliente) {
        usarEnderecoCliente.addEventListener('click', function(e) {
            e.preventDefault();
            
            document.getElementById('endereco').value = "{{ ordem.cliente.endereco|default:'' }}";
            document.getElementById('numero_endereco').value = "{{ ordem.cliente.numero_endereco|default:'' }}";
            document.getElementById('complemento').value = "{{ ordem.cliente.complemento|default:'' }}";
            document.getElementById('bairro').value = "{{ ordem.cliente.bairro|default:'' }}";
            document.getElementById('cidade').value = "{{ ordem.cliente.cidade|default:'' }}";
            document.getElementById('estado').value = "{{ ordem.cliente.estado|default:'' }}";
            document.getElementById('cep').value = "{{ ordem.cliente.cep|default:'' }}";
        });
    }

    // Cadastro rápido de categoria
    $('#salvar_categoria').click(function() {
        const nome = $('#nome_categoria').val().trim();
        const descricao = $('#descricao_categoria').val().trim();
        
        // Validação básica
        if (!nome) {
            $('#categoria_alert').removeClass('d-none alert-success').addClass('alert-danger').text('O nome da categoria é obrigatório.');
            return;
        }
        
        // Enviar dados para o servidor via AJAX
        $.ajax({
            url: '{% url "criar_categoria_ajax" %}',
            type: 'POST',
            data: {
                'nome': nome,
                'descricao': descricao,
                'csrfmiddlewaretoken': '{{ csrf_token }}'
            },
            success: function(response) {
                if (response.success) {
                    // Adicionar a nova categoria ao select e selecioná-la
                    $('#categoria').append(`<option value="${response.categoria_id}" selected>${response.categoria_nome}</option>`);
                    
                    // Limpar os campos do modal
                    $('#nome_categoria').val('');
                    $('#descricao_categoria').val('');
                    
                    // Exibir mensagem de sucesso
                    $('#categoria_alert').removeClass('d-none alert-danger').addClass('alert-success').text(response.message);
                    
                    // Fechar o modal após 1 segundo
                    setTimeout(function() {
                        $('#novaCategoriaModal').modal('hide');
                        $('#categoria_alert').addClass('d-none');
                    }, 1000);
                } else {
                    // Exibir mensagem de erro
                    $('#categoria_alert').removeClass('d-none alert-success').addClass('alert-danger').text(response.message);
                }
            },
            error: function() {
                $('#categoria_alert').removeClass('d-none alert-success').addClass('alert-danger').text('Ocorreu um erro ao processar a requisição.');
            }
        });
    });
});