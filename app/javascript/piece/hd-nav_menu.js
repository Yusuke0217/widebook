(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {

    let $nav = document.querySelector('[data-nav]');
    let $trigger = document.querySelector('[data-trg]');
    let $back = document.querySelector('.nav__back');
    let $closeBtn = document.querySelector('.js-nav-close');

    const navOpen = (e) => {
      const $target = e.currentTarget;
      const $content = $target.nextElementSibling;
      $content.style.display = "block";
      $back.style.display = "block";
    };

    const navClose = (e) => {
      $nav.style.display = "none";
      $back.style.display = "none";
    };

    $trigger.addEventListener('click', navOpen);
    $closeBtn.addEventListener('click', navClose);
    $back.addEventListener('click', navClose);
  })
})();