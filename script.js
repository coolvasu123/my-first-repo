const btn = document.getElementById('btn');
const countEl = document.getElementById('count');

let n = 0;

btn.addEventListener('click', () => {
  n += 1;
  countEl.textContent = String(n);
});
