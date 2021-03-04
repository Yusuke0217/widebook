(() => {
  'use strict';
  document.addEventListener('turbolinks:load', () => {
    let map;
    let LatLng;
    let marker = []; // マーカーを複数表示させたいので、配列化
    let infoWindow = []; // 吹き出しを複数表示させたいので、配列化
    const shops = gon.shops; // コントローラーで定義したインスタンス変数を変数に代入
  
    function getPosition(){
      // 現在位置の特定
      navigator.geolocation.getCurrentPosition(
        function (position) {
        // LatLngに位置座標を代入
          LatLng = new google.maps.LatLng(
            position.coords.latitude,
            position.coords.longitude
          );
  
          // mapの初期位置設定
          map = new google.maps.Map(document.getElementById('js-nav-map'), {
            center: LatLng,
            // 倍率はお好みで
            zoom: 13
          });
          // map.setCenterで地図が初期位置に移動
          map.setCenter(LatLng);
  
        // forは繰り返し処理
        // 変数iを0と定義し、
        // その後gonで定義したshops分繰り返し加える処理を行う
          for (let i = 0; i < shops.length; i++){
            // shops[i]は変数iのユーザーを取得している
            marker[i] = new google.maps.Marker({
              map: map,
              position: {
                // DBに保存してある、緯度・経度を呼び出す
                lat: shops[i].latitude,
                lng: shops[i].longitude
              }
            });
  
            // 変数iを変数idに代入
            let id = shops[i]['id'];
  
            // infoWindowは吹き出し
            infoWindow[i] = new google.maps.InfoWindow({
              // contentで中身を指定
              // 今回は文字にリンクを貼り付けた形で表示
              content: `<a href='/shops/${id}'>${shops[i].name}</a>`
            });
            // markerがクリックされた時、
            marker[i].addListener("click", () => {
              // infoWindowを表示
              infoWindow[i].open(map, marker[i]);
            });
          }
        },
        function (error) {
          alert(`ご使用中のブラウザは現在地検索に対応されておりません。[${error.code}]`)
          console.log("だめ");
        },
        {
          enableHighAccuracy: false, //位置情報の精度を高く
          timeout: 10000, //10秒でタイムアウト
        }
      );
    };
  
    getPosition();
  })
})();