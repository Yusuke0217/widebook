(() => {
  const initMap = () => {
    // InvalidValueError: initMap is not a functionの対応
    window.onload = function () {
      initMap();
    };
    // latitude,longitudeから位置を特定
    let place = { lat: '<%= @shop.latitude %>', lng: '<%= @shop.longitude %>' };
    let map = new google.maps.Map(document.getElementById('js-map'), {
              zoom: 14, 
              center: {lat: 35.18, lng: 136.906}
              // center: place
              });
    let transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);
  
    let contentString = '住所：<%= @shop.address %>';
    let infowindow = new google.maps.InfoWindow({
      content: contentString
    });
  
    // Map上の指定した位置にピンを挿して表示する
    let marker = new google.maps.Marker({
                  position: {lat: 35.18, lng: 136.906},
                  // position: place,
                  map: map,
                  title: contentString
                  });
  
      marker.addListener('click', function() {
        infowindow.open(map, marker);
      });
  };
  initMap();
})();