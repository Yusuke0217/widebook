(() => {
  'use strict';
  document.addEventListener('DOMContentLoaded', () => {
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
  document.addEventListener('DOMContentLoaded', () => {
    let $shareBtn = document.querySelector('#js-share-btn');
    let $shopName = document.getElementById('js-shop-name');

    const shareData = {
      title: '和歌山のガイドブック Wide',
      text: `お店の詳細ページ: ${$shopName.textContent}`,
      url: decodeURIComponent(location.href),
    };

    $shareBtn.addEventListener('click', shareAction);
  });
})();