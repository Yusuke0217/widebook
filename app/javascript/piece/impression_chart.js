(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $pvGraph = document.querySelectorAll('[data-pv-graph]');
    let $pvTrg = document.querySelectorAll('[data-impression]');
    const triggerLen = $pvTrg.length;
    const ACTIVE_CLASS = 'is-active'

    const init = () => {
      $pvTrg[0].classList.add(ACTIVE_CLASS);
      $pvGraph[1].style.display = "none";
      $pvGraph[2].style.display = "none";
    };
    init();

    const changeChart = (e) => {
      e.preventDefault();
      const $target = e.currentTarget;
      const targetVal = $target.dataset.impression;
      
      let index = 0;
      while(index < triggerLen) {
        $pvGraph[index].style.display = "none";
        $pvTrg[index].classList.remove(ACTIVE_CLASS);
        index++;
      }
      $pvGraph[targetVal].style.display = "block";
      $target.classList.add(ACTIVE_CLASS);
    };

    let index = 0;
    while (index < triggerLen) {
      $pvTrg[index].addEventListener('click', changeChart);
      index++;
    };

  })

})();