jQuery(document).ready(function( ){
 
$button = $('.previous_page');  
$button.on('click', function(){window.history.back();} );

});

arrayOfTags = [
"&tag=science", "&tag=music", "&tag=travel",
"&tag=world", "&tag=politics", "&tag=animals" ];

var randomIndex = Math.floor(Math.random() * arrayOfTags.length);

var api = "http://api.giphy.com/v1/gifs/random?";
var apiKey = "&api_key=dc6zaTOxFJmzC";
var query = arrayOfTags[randomIndex];
var lala = '';



