$(document).ready(function(){
	$("#search-button, .user-preferences").click(function(){
		$("#search-form, #meetup-info").slideToggle();
	})
	$("#subject_search").change(function(){
		$.ajax({
			method: 'GET',
			url: "/searches/update_topics",
			data: {subject_id: $("#subject_search").val()},
			dataType: "script"
		});
	});
	var cities = new Bloodhound({
	  datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
	  queryTokenizer: Bloodhound.tokenizers.whitespace,
	  limit: 10,
	  prefetch: {
	    // url points to a json file that contains an array of country names, see
	    // https://github.com/twitter/typeahead.js/blob/gh-pages/data/cities.json
	    url: '/searches/load_cities.json',
	    // the json file contains an array of strings, but the Bloodhound
	    // suggestion engine expects JavaScript objects so this converts all of
	    // those strings
	    filter: function(list) {
	      return $.map(list, function(city) { return { name: city }; });
	    }
	  }
	});
	 
	// kicks off the loading/processing of `local` and `prefetch`
	cities.initialize();
	 
	// passing in `null` for the `options` arguments will result in the default
	// options being used
	$('.prefetch .typeahead').typeahead(null, {
	  name: 'cities',
	  displayKey: 'name',
	  // `ttAdapter` wraps the suggestion engine in an adapter that
	  // is compatible with the typeahead jQuery plugin
	  source: cities.ttAdapter()
	});
})
