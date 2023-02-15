<!DOCTYPE html>
<html>
  <head>
    <title>Exemplo de Geolocalização</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=SUA_CHAVE_API&libraries=places"></script>
    <script>
      function initMap() {
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode({
          location: new google.maps.LatLng(0, 0)
        }, function(results, status) {
          if (status === google.maps.GeocoderStatus.OK) {
            if (results[0]) {
              for (var i = 0; i < results[0].address_components.length; i++) {
                var component = results[0].address_components[i];
                if (component.types.indexOf('locality') !== -1) {
                  document.getElementById('city').innerHTML = component.long_name;
                  break;
                }
              }
            }
          }
        });
      }
    </script>
  </head>
  <body onload="initMap()">
    <h1>Sua cidade: <span id="city"></span></h1>
  </body>
</html>
