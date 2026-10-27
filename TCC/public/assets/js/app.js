(function () {
    'use strict';

    const navigation = [
        { page: 'inicio', label: 'Início', icon: 'fa-house', href: 'inicio.html' },
        { page: 'alunos', label: 'Alunos', icon: 'fa-users', href: 'alunos.html' },
        { page: 'treinos', label: 'Treinos', icon: 'fa-clipboard-list', href: 'treinos.html' },
        { page: 'exercicios', label: 'Exercícios', icon: 'fa-dumbbell', href: 'exercicios.html' },
        { page: 'acompanhamento', label: 'Acompanhamento', icon: 'fa-chart-line', href: 'acompanhamento.html' },
        { page: 'mensagens', label: 'Mensagens', icon: 'fa-comments', href: 'mensagens.html' }
    ];

    const page = document.body.dataset.page;
    const title = navigation.find((item) => item.page === page);

    if (page && title) {
        const sidebar = document.querySelector('[data-app-sidebar]');
        const heading = document.querySelector('[data-page-title]');
        const links = navigation.map((item) => {
            const active = item.page === page ? ' class="active" aria-current="page"' : '';
            return `<a href="${item.href}"${active}><i class="fas ${item.icon}" aria-hidden="true"></i>${item.label}</a>`;
        }).join('');

                if (sidebar) {
            // Monta a estrutura inicial da barra lateral
            sidebar.innerHTML = `
                <a class="app-logo" href="inicio.html" id="dynamic-logo">
                    <i class="fas fa-dumbbell" aria-hidden="true"></i>SAT
                </a>
                <nav class="app-nav" aria-label="Navegação principal">${links}</nav>
                <div class="app-sidebar-footer">Sistema de gestão de treinos<br>Protótipo acadêmico</div>
            `;

            // Busca a sessão do usuário para mudar o logo e o nome
            fetch('/sistema_treinos/backend/sessao.php')
                .then(response => response.json())
                .then(data => {
                    if (data.logado) {
                        // 1. Altera o Logo (SAT Aluno / SAT Professor)
                        const logo = document.getElementById('dynamic-logo');
                        if (logo) {
                            const tipoFormatado = data.tipo.charAt(0).toUpperCase() + data.tipo.slice(1);
                            logo.innerHTML = `<i class="fas fa-dumbbell" aria-hidden="true"></i>SAT <span style="font-size: 0.9rem; background: #eaf6f4; color: #19796f; padding: 4px 8px; border-radius: 6px; margin-left: 8px; font-weight: 600;">${tipoFormatado}</span>`;
                        }

                        // 2. Altera o nome "Visitante" no topo direito
                        // Procura a div com classe 'app-user' (é onde fica o ícone e o texto)
                        const userContainer = document.querySelector('.app-user');
                        if (userContainer) {
                            // Substitui o texto "Visitante" pelo nome do usuário (ou primeiro nome)
                            const primeiroNome = data.nome.split(' ')[0];
                            userContainer.innerHTML = `
                                <span class="app-avatar"><i class="fas fa-user" aria-hidden="true"></i></span>
                                <span>${primeiroNome}</span>
                            `;
                        }
                        
                    } else {
                        window.location.href = '/sistema_treinos/views/login.html';
                    }
                })
                .catch(err => console.error('Erro ao verificar sessão', err));
        }
        
        if (heading) {
            heading.textContent = title.label;
        }
    }

    // Formulários de demonstração (onde não tem backend conectado ainda)
    document.querySelectorAll('[data-demo-form]').forEach((form) => {
        form.addEventListener('submit', (event) => {
            event.preventDefault();
            const message = form.dataset.message || 'Ação registrada apenas nesta demonstração.';
            const status = form.querySelector('[data-form-status]');
            if (status) {
                status.textContent = message;
                status.hidden = false;
            }
            form.reset();
        });
    });

    // Validação do formulário de Cadastro Real
    const registerForm = document.querySelector('#register-form');
    if (registerForm) {
        const password = registerForm.querySelector('[name="senha"]');
        const confirmation = registerForm.querySelector('[name="confirmar-senha"]');
        
        if (password && confirmation) {
            const updateConfirmation = () => {
                confirmation.setCustomValidity(
                    confirmation.value && confirmation.value !== password.value
                        ? 'As senhas não coincidem.'
                        : ''
                );
            };
            password.addEventListener('input', updateConfirmation);
            confirmation.addEventListener('input', updateConfirmation);
        }

        registerForm.addEventListener('submit', async (event) => {
            event.preventDefault(); 

            const status = registerForm.querySelector('[data-form-status]');
            const formData = new FormData(registerForm);

            try {
                const response = await fetch('../../app/backend/cadastro.php', {
                    method: 'POST',
                    body: formData
                });

                if (response.ok) {
                    status.textContent = "✅ Cadastro realizado com sucesso! Redirecionando...";
                    status.className = "mt-3 small text-success";
                    status.hidden = false;
                    
                    setTimeout(() => {
                        window.location.href = 'login.html'; 
                    }, 2000); 
                }
            } catch (error) {
                status.textContent = "❌ Erro ao conectar com o servidor.";
                status.className = "mt-3 small text-danger";
                status.hidden = false;
            }
        });
    }
})();