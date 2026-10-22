'use strict';
const themeButton = document.getElementById('theme');
function applyTheme(dark) {
  document.body.classList.toggle('dark', dark);
  themeButton.setAttribute('aria-label', dark ? 'Ativar tema claro' : 'Ativar tema escuro');
  themeButton.setAttribute('aria-pressed', String(dark));
  document.querySelector('meta[name="theme-color"]').content = dark ? '#0c1422' : '#f5f7fb';
}
let savedTheme = null;
try { savedTheme = localStorage.getItem('dubbox-site-theme'); } catch (_) {}
applyTheme(savedTheme === 'dark');
themeButton.addEventListener('click', () => {
  const dark = !document.body.classList.contains('dark');
  applyTheme(dark);
  try { localStorage.setItem('dubbox-site-theme', dark ? 'dark' : 'light'); } catch (_) {}
});
const menuButton = document.getElementById('menu');
const links = document.getElementById('nav-links');
function closeMenu() { links.classList.remove('open'); menuButton.setAttribute('aria-expanded','false'); menuButton.setAttribute('aria-label','Abrir menu'); }
menuButton.addEventListener('click', () => {
  const open = links.classList.toggle('open');
  menuButton.setAttribute('aria-expanded', String(open));
  menuButton.setAttribute('aria-label', open ? 'Fechar menu' : 'Abrir menu');
});
links.querySelectorAll('a').forEach(link => link.addEventListener('click', closeMenu));
document.addEventListener('keydown', event => { if (event.key === 'Escape') closeMenu(); });
window.addEventListener('resize', () => { if (window.innerWidth > 680) closeMenu(); });
