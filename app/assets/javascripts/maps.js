var map;

function initializeShow(){
	var location = new google.maps.LatLng(latitude,longitude);
	var addMarker = true && showMarker;
	var mapOptions = {
		center: location,
		zoom: 13,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map($('#map_canvas')[0],mapOptions);

	if (addMarker) {
		var marker = new google.maps.Marker({
		position: location,
		title: "Sup haters!",
		map: map
	});
	} 
}

function addMarkers(coords){
	var image = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png';
	console.log(coords);
	coords.forEach(function(coord){
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(coord.latitude,coord.longitude),  
			map: map,
			icon: image
		});
	});
}



$(document).ready(function(){
	if ($('#map_canvas').length > 0){
		initializeShow();
		if(coords.length > 0) addMarkers(coords);
	}

});

