// お店の住所を表示するgooglemap
(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    const initMap = () => {
      // latitude,longitudeから位置を特定
      let shop = gon.shop;
      let place = { lat: parseFloat(shop.latitude), lng: parseFloat(shop.longitude) };
      let map = new google.maps.Map(document.getElementById('js-map'), {
        zoom: 14, 
        center: place
      });
      let transitLayer = new google.maps.TransitLayer();
      transitLayer.setMap(map);
    
      let contentString = '住所：' + shop.address;
      let infowindow = new google.maps.InfoWindow({
        content: contentString
      });
    
      // Map上の指定した位置にピンを挿して表示する
      let marker = new google.maps.Marker({
        position: place,
        map: map,
        title: contentString
      });
  
      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
    };
    initMap();
  })
})();
