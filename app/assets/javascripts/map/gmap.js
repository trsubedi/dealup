var sf_lat = 37.683;
var sf_lng = -122.416;

$(document).ready(function(){
	createMap();
	createMarker(sf_lat, sf_lng, map, "San Francisco");
});


function createMap()
{
	map = new google.maps.Map(document.getElementById('map-canvas'),
	{
		center: {lat: 37.8314, lng: -122.2853},
		zoom: 13
	});

	return map;
}

function createMarker(lat, lng, map, title)
{
	marker = new google.maps.Marker({
		position: new google.maps.LatLng(lat,lng),
		map: map,
		title: title
	});




	return marker;
}