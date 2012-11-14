/**
 *  Geous extensions for formtastic
 *  @author RJ Zaworski (https://github.com/rjz)
 */
jQuery(document).ready(function ($) {

  var setMapLocation = function ($fields, geousMap) {

    var locationMarker,
        location = $fields.geousable('geocode', { 
          success: function (location) {

            geousMap.locations.empty();
            locationMarker = geousMap.locations.add(location, { draggable: true });

            // Update location after marker is dragged
            google.maps.event.addListener(locationMarker.marker, 'dragend', function (m) {
                var latLng = locationMarker.marker.getPosition();
                location.setCoordinates({ lat: latLng.lat(), lng: latLng.lng() });
                $fields.geousable('setLocation', location);
            });

            geousMap.centerOnLocation(location);
          },
          error: function () { alert('panic'); }
        });
  };

  $('form.geousable').each(function () {

    var $fields = $(this),
        $map = $('<div class="geous-map" style="width:100%;height:100px;"></div>');

    var gmap = geous.gmap.create({ el: $map });

    // Configure fieldset
    $fields.geousable({ overwrite: true });

    // Inject the map
    $fields.prepend($map);

    // Set the map to the current location
    setMapLocation($fields, gmap);

    $fields.find('input').change(function() {
      setMapLocation($fields, gmap);
    });
  });
});

