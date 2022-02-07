
const btn = document.querySelector('.search .btn');
const query = document.querySelector('.search .form-control');

btn.addEventListener('click', () => {
  if (query.value) {
    window.location = `/search?q=${query.value}`
  }
})