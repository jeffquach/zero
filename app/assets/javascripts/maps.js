var map;

function initialize(){
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

if ($('#map_canvas').length > 0) initialize();



