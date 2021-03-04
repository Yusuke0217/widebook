(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let spin = document.getElementById('js-loading');
    spin.classList.remove('load__wrapper');
    spin.classList.add('loaded');
  });  
})();