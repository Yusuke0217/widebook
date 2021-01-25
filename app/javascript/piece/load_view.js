(() => {
  // document.addEventListener('turbolinks:load', () => {
  // });
  window.addEventListener('load', () => {
    'use strict';
    let spin = document.getElementById('js-loading');
    spin.classList.remove('load__wrapper');
    spin.classList.add('loaded');
  });
  
})();