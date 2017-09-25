/*syncard js*/
$(function(){
loadStory();
});
function loadStory(){
	var part = '';

	var data = [{
		image	: "pepe.png",
		title	: "PEPE AND THE FLYING BALLOON",
		page	: "Once upon a time, there were two mice that lived an adventurous life in the heart of Jakarta. Hiro and his wife, Sur, were a hard-working and courageous duo. Even though they were tiny creatures, their hearts were set on rescuing abandoned children who lived on the streets.",
		url		: "#"
		},
		{
		image	: "pepe.png",
		title	: "PEPE AND THE FLYING BALLOON",
		page	: "Once upon a time, there were two mice that lived an adventurous life in the heart of Jakarta. Hiro and his wife, Sur, were a hard-working and courageous duo. Even though they were tiny creatures, their hearts were set on rescuing abandoned children who lived on the streets.",
		url		: "#"
		},
		{
		image	: "pepe.png",
		title	: "PEPE AND THE FLYING BALLOON",
		page	: "Once upon a time, there were two mice that lived an adventurous life in the heart of Jakarta. Hiro and his wife, Sur, were a hard-working and courageous duo. Even though they were tiny creatures, their hearts were set on rescuing abandoned children who lived on the streets.",
		url		: "#"
		},
		{
		image	: "pepe.png",
		title	: "PEPE AND THE FLYING BALLOON",
		page	: "Once upon a time, there were two mice that lived an adventurous life in the heart of Jakarta. Hiro and his wife, Sur, were a hard-working and courageous duo. Even though they were tiny creatures, their hearts were set on rescuing abandoned children who lived on the streets.",
		url		: "#"
		}];
	
	for(var a = 0; a < data.length; a++){
		part = part + 
			"<div class='col-md-6 story-box'>"+
				"<div class='picture-box story' style='background-image: url(../assets/PICS/"+data[a].image+");'></div>"+
				"<div class='title-story'>"+
					"<h3>"+data[a].title+"</h3>"+
				"</div>"+
				"<div class='content-story'>"+
					"<p>"+data[a].page+"<a href="+data[a].url+"><b>MORE</b></a></p>"+
				"</div>"+
			"</div>";
	}
	$("main").html(part);

}