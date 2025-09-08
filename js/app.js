document.addEventListener('DOMContentLoaded', function(){
  // Counter
  let count = 0;
  const counterBtn = document.getElementById('counterBtn');
  const countDisplay = document.getElementById('countDisplay');
  counterBtn.addEventListener('click', function(){
    count++;
    countDisplay.textContent = count;
  });

  // Reset
  const resetBtn = document.getElementById('resetBtn');
  resetBtn.addEventListener('click', function(){
    count = 0;
    countDisplay.textContent = count;
  });

  // Color toggle
  const colorBtn = document.getElementById('colorBtn');
  colorBtn.addEventListener('click', function(){
    document.body.classList.toggle('alt-color');
  });

  // Random number generator (sets count to random 1..100)
  const randBtn = document.getElementById('randBtn');
  randBtn.addEventListener('click', function(){
    const r = Math.floor(Math.random() * 100) + 1;
    count = r;
    countDisplay.textContent = count;
  });

  // Echo input
  const textInput = document.getElementById('textInput');
  const echo = document.getElementById('echo');
  textInput.addEventListener('input', function(e){
    echo.textContent = e.target.value;
  });
});