(function () {
  'use strict';
  document.addEventListener('DOMContentLoaded', (e) => {
    e.preventDefault();
    let search = new URLSearchParams(location.search);
    let url = search.get('search[name]');
    document.getElementById('js-output').innerHTML = `${url}の検索結果`;
  });
})();