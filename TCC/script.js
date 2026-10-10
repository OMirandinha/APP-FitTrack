/* ============================================
   SAT - SCRIPT PRINCIPAL
   ============================================ */
(function () {
    'use strict';

    /* --------------------------------------------
       1. ANIMAÇÃO DE FADE-IN AO ROLAR A PÁGINA
       -------------------------------------------- */
    const fadeElements = document.querySelectorAll('.fade-in');

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                // Para de observar após a animação (performance)
                observer.unobserve(entry.target);
            }
        });
    }, {
        threshold: 0.15,
        rootMargin: '0px 0px -50px 0px'
    });

    fadeElements.forEach(el => observer.observe(el));

    /* --------------------------------------------
       2. FECHAR NAVBAR MOBILE AO CLICAR EM UM LINK
       -------------------------------------------- */
    const navLinks = document.querySelectorAll('.navbar-nav .nav-link, .navbar-nav .btn');
    const navbarCollapse = document.getElementById('navbarMain');

    if (navbarCollapse) {
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                if (navbarCollapse.classList.contains('show')) {
                    const bsCollapse = new bootstrap.Collapse(navbarCollapse, {
                        toggle: false
                    });
                    bsCollapse.hide();
                }
            });
        });
    }

    /* --------------------------------------------
       3. EFEITO SUTIL DE SCROLL NA NAVBAR
       -------------------------------------------- */
    const navbar = document.querySelector('.navbar');

    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.style.boxShadow = '0 12px 25px rgba(0, 20, 30, 0.08)';
            navbar.style.backgroundColor = 'rgba(255, 255, 255, 0.95)';
        } else {
            navbar.style.boxShadow = '0 8px 20px rgba(0, 20, 30, 0.04)';
            navbar.style.backgroundColor = 'rgba(255, 255, 255, 0.85)';
        }
    });

    /* --------------------------------------------
       4. LOG DE BOAS-VINDAS (CONSOLE)
       -------------------------------------------- */
    console.log('🚀 SAT | Página de boas-vindas carregada com sucesso!');
    console.log('💪 Organização, acompanhamento e evolução para profissionais e atletas.');
})();