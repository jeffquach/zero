var map;

function initializeShow(){
	var location = new google.maps.LatLng(latitude,longitude);
	var addMarker = true && showMarker;
	var mapOptions = {
		center: location,
		zoom: 13,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map($('#map-canvas')[0],mapOptions);

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
	for(var i = 0; i < coords.length; i++){
			var marker = new google.maps.Marker({
			position: new google.maps.LatLng(coords[i].latitude,coords[i].longitude),  
			map: map,
			icon: image
		});	
	}
	// coords.forEach(function(coord){
	// 	var marker = new google.maps.Marker({
	// 		position: new google.maps.LatLng(coord.latitude,coord.longitude),  
	// 		map: map,
	// 		icon: image
	// 	});
	// });
}



$(document).ready(function(){
	if ($('#map-canvas').length > 0){
		initializeShow();
		if(coords.length > 0) addMarkers(coords);
	}

});

