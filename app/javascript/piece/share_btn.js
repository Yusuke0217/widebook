(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $shareBtn = document.getElementById('js-share-btn');
    let $shareMenu = document.getElementById('js-share-pop');
    let $backGround = document.getElementById('js-menu-back');
    let $closeBtn = document.getElementById('js-share-close');

    const shareOpen = (e) => {
      e.preventDefault;
      $shareMenu.style.display = 'block';
    };

    const shareClose = () => {
      $shareMenu.style.display = "none";
    }

    $shareBtn.addEventListener('click', shareOpen);
    $backGround.addEventListener('click', shareClose);
    $closeBtn.addEventListener('click', shareClose);
  })
})();

(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let $copyBtn = document.getElementById('js-copy-btn');
    let $copyStatus = document.getElementById('js-copy-status');

    const copyUrl = () => {
      let url = decodeURIComponent(location.href);
      let newEle = document.createElement("div");
      newEle.innerHTML = url;
      document.body.appendChild(newEle);
      let range = document.createRange();

      range.selectNodeContents(newEle);
      window.getSelection().addRange(range);
      document.execCommand('copy');
      $copyStatus.textContent = 'URLをコピーしました！';
      newEle.style.display = "none";
      newEle.remove();
    };

    $copyBtn.addEventListener('click', copyUrl);
  });
})();