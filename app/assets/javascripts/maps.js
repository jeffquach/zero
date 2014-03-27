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
	    var myMarker = new google.maps.Marker({
	        position: new google.maps.LatLng(latitude, longitude),
	        map: map
	    });
  	}
}

function addMarkers(coords){
	var image = 'http://maps.google.com/mapfiles/ms/icons/yellow-dot.png';

	var i;

	for(i = 0; i < coords.length; i++){
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(coords[i].latitude,coords[i].longitude),  
			map: map,
			icon: image
		});	
		var urlForMarker = coords[i].id;
		addEventToMarker(marker, urlForMarker);
	}
}

function addEventToMarker(marker, user_id) {
    google.maps.event.addListener(marker, 'click', function(e) {
    	var _this = this;
		var infowindow = new google.maps.InfoWindow();

	      $.ajax({
	        url: '/users/' + user_id + '/infowindow',
	        method: 'GET',
	        dataType: 'html'
	      })
	      .done(function(data){
	        infowindow.setContent(data);
	        infowindow.open(map, _this);
	      });       
    });
}


$(document).ready(function(){
	if ($('#map-canvas').length > 0){
		initialize();
		if(coords.length > 0) addMarkers(coords);
	}

});


