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
            sidebar.innerHTML = `<a class="app-logo" href="inicio.html"><i class="fas fa-dumbbell" aria-hidden="true"></i>SAT</a><nav class="app-nav" aria-label="Navegação principal">${links}</nav><div class="app-sidebar-footer">Sistema de gestão de treinos<br>Protótipo acadêmico</div>`;
        }

        if (heading) {
            heading.textContent = title.label;
        }
    }

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

    const registerForm = document.querySelector('#register-form');
    if (registerForm) {
        const password = registerForm.querySelector('[name="senha"]');
        const confirmation = registerForm.querySelector('[name="confirmar-senha"]');
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
})();
