(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $tab = document.getElementById('js-tab');
    let $nav = document.querySelectorAll('[data-nav]');
    let $content = document.querySelectorAll('[data-content]');
    let $tabCon = document.querySelector('.tab__contents');
    let ACTIVE_CLASS = 'is-active';
    let navLen = $nav.length;

    const init = () => {
      $content[0].style.display = 'block';
      $tabCon.style.display = 'none';
    };
    init();

    const handleClick = (e) => {
      e.preventDefault();
      const $this = e.target;
      const targetVal = $this.dataset.nav;
      $tabCon.style.display = 'block';

      let index = 0;
      while(index < navLen) {
        $content[index].style.display = 'none';
        $nav[index].classList.remove(ACTIVE_CLASS);
        index++;
      };

      $tab.querySelectorAll('[data-content="' + targetVal + '"]')[0].style.display = 'block';
      $nav[targetVal].classList.add(ACTIVE_CLASS);
    };

    
    let index = 0;
    while(index < navLen) {
      $nav[index].addEventListener('click', handleClick);
      index++;
    }

  });
})();

//----------------------
(() => {
  'use strict';
  class Accordion {
    constructor(obj) {
      document.addEventListener('turbolinks:load', () => {
        let $elm = document.querySelector(obj.hookName);
        let $trigger = $elm.getElementsByTagName(obj.tagName);
        let triggerLen = $trigger.length;
  
        let index = 0;
        while(index < triggerLen) {
          $trigger[index].addEventListener('click', this.clickHandler);
          index++;
        };
      });
    }

    clickHandler = (e) => {
      e.preventDefault();
      const $target = e.currentTarget;
      const $item = $target.nextElementSibling;
      if($item.style.display === 'block') {
        $item.style.display = 'none';
      } else {
        $item.style.display = 'block';
      };
    };
  }

  const faq = new Accordion({
    hookName: '#js-faq',
    tagName: 'a'
  });
  const ac0 = new Accordion({
    hookName: '#js-ac-0',
    tagName: 'a'
  });
  const ac1 = new Accordion({
    hookName: '#js-ac-1',
    tagName: 'a'
  });
  const ac2 = new Accordion({
    hookName: '#js-ac-2',
    tagName: 'a'
  });
  const ac3 = new Accordion({
    hookName: '#js-ac-3',
    tagName: 'a'
  });
  const ac4 = new Accordion({
    hookName: '#js-ac-4',
    tagName: 'a'
  });
  const ac5 = new Accordion({
    hookName: '#js-ac-5',
    tagName: 'a'
  });

})();