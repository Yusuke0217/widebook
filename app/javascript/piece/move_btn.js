(function() {
  'use strict';
  document.addEventListener('DOMContentLoaded', () => {
    let $prev = document.querySelector('.js-prev');
    let $next = document.querySelector('.js-next');
    let $ul = document.getElementById('js-slide-li');
    
    $prev.addEventListener('click', () => {
      $ul.scrollBy({top: 0, left: -145, behavior: "smooth"});
    });
  
    $next.addEventListener('click', () => {
      $ul.scrollBy({top: 0, left: 145, behavior: "smooth"});
    });
  });
})();