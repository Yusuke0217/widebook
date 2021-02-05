(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $tab = document.getElementById('js-nav-tab');
    let $menuNav = document.querySelectorAll('[data-menu]');
    let $content = document.querySelectorAll('[data-content]');
    const ACTIVE_CLASS = 'is-active';
    let navlen = $menuNav.length;

    const init = () => {
      $content[0].style.display = 'none';
    };
    init();

    const handleClick = (e) => {
      e.preventDefault();
      const $this = e.target;
      const targetVal = $this.dataset.menu;

      let index = 0;
      while(index < navlen) {
        $content[index].style.display = 'none';
        $menuNav[index].classList.remove(ACTIVE_CLASS);
        index++;
      }

      $tab.querySelectorAll(`[data-content="${targetVal}"]`)[0].style.display = 'block';
      $menuNav[targetVal].classList.add(ACTIVE_CLASS);

    };

    let index = 0;
    while (index < navlen) {
      $menuNav[index].addEventListener('click', handleClick);
      index++;
    };
  });
})();