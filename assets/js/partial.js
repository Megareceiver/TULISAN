var base_url = window.location.origin + '/TULISAN';
				
// $(function(){
	header();
	footer();
// });

function header(){
	var active_page = "home-route";
	var html = 
	'<div class="row">' +
		'<nav class="navbar navbar-default plain">' +
		    '<!-- Brand and toggle get grouped for better mobile display -->' +
		    '<div class="navbar-header">' +
		    	'<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#syncard-nav" aria-expanded="false">' +
			        '<span class="sr-only">Toggle navigation</span>' +
			        '<span class="icon-bar"></span>' +
			        '<span class="icon-bar"></span>' +
			        '<span class="icon-bar"></span>' +
		    	'</button>' +
		    	'<div class="navbar-brand hidden-lg hidden-md hidden-sm col-xs-10">' +
		    		'<img class="smallImg" src="' + base_url + '/assets/PICS/tulisan.png" />' +
				'</div>' +
		    '</div>' +

		    '<!-- Collect the nav links, forms, and other content for toggling -->' +
		    '<div class="collapse navbar-collapse" id="syncard-nav">' +
		    	'<div class="navbar-shortcut">' +
					'<div class="link">' +
						'<a href="#">FIND A STORE</a> |' +
						'<a href="' + base_url + '/page/media.html">MEDIA</a> |' +
						'<a href="#"><span class="fa fa-shopping-cart"></span></a> |' +
						'<a href="#">LOGIN</a>' +
					'</div>' +
					'<div class="form">' +
				    	'<form class="form-inline">' +
				        	'<div class="form-group">' +
				        		'<input type="text" class="form-control" placeholder="Search">' +
				        	'</div>' +
				        	'<button type="submit" class="btn btn-default">SEARCH</button>' +
				   		'</form>' +
					'</div>' +
				'</div>' +
		    	'<div class="col-md-8 col-md-offset-2 hidden-xs navbar-brand-custom">' +
			    	'<div class="navbar-brand"><img src="' + base_url + '/assets/PICS/tulisan.png" /></div>' +
			    	'<div class="clearfix"></div>' +
				'</div>' +
				'<div class="col-md-8 col-md-offset-2">' +
					'<div id="navbar-custom" class="row">' +
						'<ul class="nav navbar-nav main-menu fontserif">' +
					        '<li><a id="home-route" href="' + base_url + '"><span>HOME</span></a></li>' +
					        '<li><a id="shop-route" href="#"><span>SHOP</span></a></li>' +
					        '<li><a id="story-route" href="' + base_url + '/page/story.html"><span>STORIES</span></a></li>' +
					        '<li><a id="blog-route" href="' + base_url + '/page/blog.html"><span>BLOG</span></a></li>' +
					        '<li><a id="video-route" href="' + base_url + '/page/videos.html"><span>VIDEOS</span></a></li>' +
					        '<li><a id="chatter-route" href="' + base_url + '/page/chatter.html"><span>CHATTER</span></a></li>' +
					        '<li><a id="about-route" href="' + base_url + '/page/about.html"><span>ABOUT</span></a></li>' +
					        '<li><a id="contact-route" href="#"><span>CONTACT</span></a></li>' +
					    '</ul>' +
					'</div>' +
				'</div>' +
		  	'</div>' +
		'</nav>' +
	'</div><!-- /.navbar-collapse -->';

	//breadcrum
	var breadcrumbHtml = "";
	var breadcrumb = "";
	var page = window.location.href; 
		page = page.replace('#', '');
		page = page.split('/');

	if(page != null && page.length > 0){
		switch(page[page.length - 1]){
			case "story.html": 		 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / story"; 
				active_page = "story-route"; 
			break;
			case "storydetail.html": 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/story.html'>story</a> / detail";
				active_page = "story-route"; 
			break;
			case "blog.html": 			
				breadcrumb = "<a href='" + base_url + "'>Home</a> / blog";	
				active_page = "blog-route"; 
			break;
			case "blogDetail.html":  	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/blog.html'>blog</a> / detail";
				active_page = "blog-route"; 
			break;
			case "chatter.html":  	 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / chatter";
				active_page = "chatter-route"; 
			break;
			case "chatterDetail.html":  
				breadcrumb = "<a href='" + base_url + "'>Home</a> / <a href='" + base_url + "/page/chatter.html'>chatter</a> / detail";
				active_page = "chatter-route"; 
			break;
			case "media.html":  	 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / Media";
				active_page = "Media"; 
			break;
			case "privacyPolicy.html":  	 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / Privacy Policy";
				active_page = "Privacy Policy"; 
			break;
			case "about.html":  	 	
				breadcrumb = "<a href='" + base_url + "'>Home</a> / about";
				active_page = "about-route"; 
			break;
		}

		breadcrumbHtml =
		'<div class="row">' +
			'<div class="col-md-8 col-md-offset-2">' +
				'<div class="breadcrumb"><p class="fontserifs">' + breadcrumb + '</p></div>' +
			'</div>' +
		'</div>';
	}

	$("header.parent").html(html);
	$("header.parent").after(breadcrumbHtml);
	$("header.parent .main-menu a").removeClass('active');
	$("header.parent .main-menu a#" + active_page).addClass('active');
}

function footer(){
	var html 	 = "";

	/* CONFIG */
	var shortcut = [
		{ "head": "ABOUT", "head_link": "#", "body": [
			{ "caption": "Shop", 	"link": "#" },
			{ "caption": "Stories", "link": base_url + "/page/story.html" },
			{ "caption": "Blog"	, 	"link": base_url + "/page/blog.html" },
			{ "caption": "About", 	"link": "#" },
			{ "caption": "Store", 	"link": "#" },
			{ "caption": "Media", 	"link": "#" },
		]},
		{ "head": "SUPPORT", "head_link": "#", "body": [
			{ "caption": "Product Care", "link": "#" },
			{ "caption": "Contact Us", 	 "link": "#" },
			{ "caption": "Login"	, 	 "link": "#" },
		]},
		{ "head": "SHOP", "head_link": "#", "body": [
			{ "caption": "By Product", 	"link": "#" },
			{ "caption": "By Color", 	"link": "#" },
			{ "caption": "By Story"	, 	"link": "#" },
		]},
		{ "head": "LEGAL", "head_link": "#", "body": [
			{ "caption": "Store / Privacy Policy", 	"link": base_url + "/page/privacyPolicy.html" },
		]},
	];

	var socmed = [
		{ "icon": "instagram", 	 		"link": "#" },
		{ "icon": "twitter", 	 		"link": "#" },
		{ "icon": "pinterest-p", 		"link": "#" },
		{ "icon": "facebook-official", 	"link": "#" },
		{ "icon": "tumblr", 			"link": "#" },
		{ "icon": "dribbble", 			"link": "#" },
	];

	var license = 'Copyright © 2014 Tulisan LLC. All Rights Reserved';


	/*===========================================================================================*/
	/*===========================================================================================*/
	/* GENERATOR */

	html = '<div class="col-md-8 col-md-offset-2 div-normalize">';

	/* shortcut generator */
	if(shortcut != null && shortcut.length > 0){
		html = html + '<div class="row shortcut">';

		for(var loop=0; loop<shortcut.length; loop++){
			html = html +
			'<div class="col-md-3 col-sm-6 shortcut-box">' +
				'<div class="head"><a href="' + shortcut[loop].head_link + '"><b>' + shortcut[loop].head + '</b></a></div>';

			var body = shortcut[loop].body;
			for(var look=0; look<body.length; look++){
				html = html +'<div class="body"><a href="' + body[look].link + '">' + body[look].caption + '</a></div>';
			}

			html = html + '</div>';
		}

		html = html + 
			'<div class="clearfix"></div>' +
		'</div>';
	}


	/* socmed generator */
	if(socmed != null && socmed.length > 0){
		html = html + 
		'<div class="row socmed">' +
			'<div class="col-md-6 socmed-box">' +
				'<p>' +
					'<b>KEEP UP TO DATE</b> <br>' +
					'Stay up to date with all the latest news and <br>' +
					'specil offers from Tulisan' +
				'</p>' +
			'</div>' +
			'<div class="col-md-6 socmed-box">';

		for(var loop=0; loop<socmed.length; loop++){
			html = html + '<a href="' + socmed[loop].link + '"><span class="fa fa-' + socmed[loop].icon + '"></span></a>';
		}

		html = html + 
			'</div>' +
			'<div class="clearfix"></div>' +
		'</div>';
	}

	html = html + 
			'<div class="license"><p>' + license + '</p></div>' +
		'</div>' +
		'<div class="clearfix"></div>' +
	'</div>';


	$("footer.parent").html(html);

}