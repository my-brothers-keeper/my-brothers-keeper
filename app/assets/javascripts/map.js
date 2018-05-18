function init_map(element_name) {
    mapboxgl.accessToken = 'pk.eyJ1IjoiamhvbGxpbmdlciIsImEiOiJjamdqc2gwemowbW5jMnhxOTM5Zmd0Zml6In0.dZcZikoQoM2lR_YGcxWgrg';
    var map = new mapboxgl.Map({
        container: element_name, // container id
        style: 'mapbox://styles/mapbox/light-v9', // stylesheet location
        center: [-75.153398,39.967893], // starting position [lng, lat]
        zoom: 12 // starting zoom
    });
    // Add zoom and rotation controls to the map.
    map.addControl(new mapboxgl.NavigationControl());
    // Add geolocate control to the map.
    map.addControl(new mapboxgl.GeolocateControl({
        positionOptions: {
            enableHighAccuracy: true
        },
        trackUserLocation: true
    }));
    return map;
}
function load_organization_layer(map, source_url) {
    map.on('load', function () {
        // Add organization geojson as a data source
        map.addSource("organizations", {
            type: "geojson",
            data: source_url + ".geojson"
        });
        map.addLayer({
            "id": "places",
            "type": "symbol",
            "source": "organizations",
            "layout": {
                "icon-image": "circle-15",
                "icon-allow-overlap": true,
                "text-optional": true,
                "text-field": "{name}",
                "text-font": ["Open Sans Bold", "Arial Unicode MS Bold"],
                "text-size": 11,
                "text-letter-spacing": 0.05,
                "text-offset": [0, 0.9],
                "text-anchor": "top",
                "text-justify": "center",
                "text-padding": 0.5
            },
            "paint": {
                "text-color": "#202",
                "text-halo-color": "#fff",
                "text-halo-width": 2
            }
        });
    });
    // When a click event occurs on a feature in the organizations layer,
    // show the sidebar populated with an AJAX call to the show organization view
    map.on('click', 'places', function (e) {
        var feature = e.features[0];
        var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                showDetail(feature.properties.name, this.responseText);
            }
        };
        xhttp.open("GET", source_url + '/' + feature.id, true);
        xhttp.send();
    });

    // Create a popup, but don't add it to the map yet.
    var popup = new mapboxgl.Popup({
        closeButton: false,
        closeOnClick: false
    });

    map.on('mouseenter', 'places', function(e) {
        // Change the cursor style as a UI indicator.
        map.getCanvas().style.cursor = 'pointer';

        var feature = e.features[0];
        var coordinates = feature.geometry.coordinates.slice();

        // Ensure that if the map is zoomed out such that multiple
        // copies of the feature are visible, the popup appears
        // over the copy being pointed to.
        while (Math.abs(e.lngLat.lng - coordinates[0]) > 180) {
            coordinates[0] += e.lngLat.lng > coordinates[0] ? 360 : -360;
        }

        var html = '<div class="popup"><p class="name">' + feature.properties.name + '</p>'
            + '<p class="needs">Needs: ' + feature.properties.need_count + ' item(s)</p>'
            + '<p class="info">Click for more information.</p></div>';

        // Populate the popup and set its coordinates
        // based on the feature found.
        popup.setLngLat(coordinates)
            .setHTML(html)
            .addTo(map);
    });

    map.on('mouseleave', 'places', function() {
        map.getCanvas().style.cursor = '';
        popup.remove();
    });
}

function showDetail(title, content)
{
    document.getElementById("detail-title").innerText = title;
    document.getElementById("detail-content").innerHTML = content;
    var view = document.getElementById("detail-view");
    view.style.left = "0";
    view.style.boxShadow = "0 0 20px rgba(0, 0, 0, 0.3)";
}

function hideDetail()
{
    var view = document.getElementById("detail-view");
    view.style.left = "-450px";
    view.style.boxShadow = "none";
}