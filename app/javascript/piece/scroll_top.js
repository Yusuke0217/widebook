(function() {
  'use strict';
  document.addEventListener('DOMContentLoaded', (e) => {
    e.preventDefault();
    let head = document.getElementById('js-head');
  
    head.addEventListener('click', () => {
      window.scrollTo({top: 0, behavior: 'smooth'});
    });
  });
})();