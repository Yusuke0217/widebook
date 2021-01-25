(function() {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $prev = document.querySelectorAll('.js-prev');
    let $next = document.querySelectorAll('.js-next');
    let $contents = document.getElementById('js-content-li');
    let $shops = document.getElementById('js-shop-li');
    
    $prev[0].addEventListener('click', () => {
      $contents.scrollBy({top: 0, left: -145, behavior: "smooth"});
    });
    
    $prev[1].addEventListener('click', () => {
      $shops.scrollBy({top: 0, left: -260, behavior: "smooth"});
    });


    $next[0].addEventListener('click', () => {
      $contents.scrollBy({top: 0, left: 145, behavior: "smooth"});

    });

    $next[1].addEventListener('click', () => {
      $shops.scrollBy({top: 0, left: 260, behavior: "smooth"});
    });
    
  });
})();