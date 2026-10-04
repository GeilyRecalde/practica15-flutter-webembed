// Filtrado de habilidades
document.querySelectorAll('.chip').forEach(chip => {
  chip.addEventListener('click', () => {
    document.querySelectorAll('.chip').forEach(c => c.classList.remove('activo'));
    chip.classList.add('activo');
    const f = chip.dataset.f;
    document.querySelectorAll('.skills li').forEach(li => {
      li.hidden = f !== 'todas' && li.dataset.c !== f;
    });
  });
});

// Validación del formulario de contacto
document.getElementById('form').addEventListener('submit', e => {
  e.preventDefault();
  const n = document.getElementById('nombre').value.trim();
  const c = document.getElementById('correo').value.trim();
  const m = document.getElementById('mensaje').value.trim();
  const estado = document.getElementById('estado');
  const okCorreo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(c);
  if (!n || !m || !okCorreo) {
    estado.style.color = '#dc2626';
    estado.textContent = 'Completa todos los campos con un correo válido.';
    return;
  }
  estado.style.color = '#16a34a';
  estado.textContent = '¡Mensaje validado correctamente!';
  e.target.reset();
});

// Cambio de tema (lo invoca Flutter mediante runJavaScript)
function toggleTheme() { document.body.classList.toggle('dark'); }
