(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $nav = document.querySelector('nav.nav--bar');
    let $back = document.querySelector('.nav__back');
    let $openBtn = document.getElementById('js-nav-open');
    let $closeBtn = document.getElementById('js-nav-close');

    const navOpen = () => {
      $nav.style.display = "block";
      $back.style.display = "block";
    };
    
    const navClose = () => {
      $nav.style.display = "none";
      $back.style.display = "none";
    };

    $openBtn.addEventListener('click', navOpen);
    $closeBtn.addEventListener('click', navClose);
    $back.addEventListener('click', navClose);
  })
})();