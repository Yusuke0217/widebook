(function() {
  'use strict';
  document.addEventListener('DOMContentLoaded', () => {
    let prev = document.getElementById('js-prev');
    let next = document.getElementById('js-next');
    
    prev.addEventListener('click', () => {
      document.getElementById('js-slide-li').scrollBy(-120, 0);
    });
  
    next.addEventListener('click', () => {
      document.getElementById('js-slide-li').scrollBy(120, 0);
    });
  })
})();