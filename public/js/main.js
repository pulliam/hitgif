jQuery(document).ready(function( ){
 
$button = $('.previous_page');  
$button.on('click', function(){window.history.back();} );

});

arrayOfTags = [
"&tag=science", "&tag=music", "&tag=travel",
"&tag=world", "&tag=politics", "&tag=animals",
"&tag=love", "&tag=beyonce", "&tag=newyork",
"&tag=kardashian", "&tag=mtv", "&tag=meme" ];

var randomIndex = Math.floor(Math.random() * arrayOfTags.length);

var api = "http://api.giphy.com/v1/gifs/random?";
var apiKey = "&api_key=dc6zaTOxFJmzC";
var query = arrayOfTags[randomIndex];
var lala = '';


function emailCurrentPage(){
	window.location.href="mailto:?subject="+"Chek this out from HitGif"+"&body="+"You need to check this article out. I just saw on HitGit and thought you would like it. Here is the link:%20%20"+escape(window.location.href);
}


