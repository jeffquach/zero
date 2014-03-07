var map;

function initialize(){
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

	var infowindow = new google.maps.InfoWindow({maxWidth:500});

	var marker,i;

	for(i = 0; i < coords.length; i++){
		marker = new google.maps.Marker({
			position: new google.maps.LatLng(coords[i].latitude,coords[i].longitude),  
			map: map,
			icon: image
		});	

		console.log(marker);

		console.log(coords[i].id);
		var urlForMarker = "/users/" + coords[i].id + "/infowindow";
		
	    google.maps.event.addListener(marker, 'click', (function() {
		      $.ajax({
		        url: urlForMarker,
		        method: 'GET',
		        dataType: 'html'
		      }).done(function(data){
		      	infowindow.close(map,marker);
		      	infowindow.setOptions({maxWidth:400});
		        infowindow.setContent(data);
		        infowindow.open(map,marker);
		      });       
	    }));
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
		initialize();
		if(coords.length > 0) addMarkers(coords);
	}

});

