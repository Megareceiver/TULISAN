/*syncard js*/
$(function(){
	headerAdmin();
	pageAdmin();
	footerAdmin();
});


function headerAdmin(){
	var html =
	'<div class="content-frame">'+
		'<div class="row">'+
			'<div class="col-md-3">'+
				'<div class="logo"><img class="big-image" src="../assets/PICS/tulisan.png" /></div>'+
			'</div>'+
			'<div class="col-md-9">'+
				'<div class="header-title"><h2>Product - Departement</h2></div>'+
				'<div class="header-menu fontserif">' + 
					'<ul>' + 
						'<li><a href=#>View Store</a> &nbsp; &nbsp;|</li>' + 
						'<li><img src="../assets/PICS/pattern3.jpg"></li>' +
						'<li>Khrisni Swandayani</li>' + 
						'<li><a href="#"><i class="fa fa-cog fa-o"></i></a></li>' + 
					'</ul>'+
				'</div>'+
			'</div>'+
		'</div><div class="clearfix"></div>' +
	'</div>';

	$("header.parent-admin").html(html);
}

function pageAdmin(){
	var html =
	'<div class="content-frame">'+
		'<div class="row">'+
			'<div class="col-md-3 left-nav">'+
				'<div class="list-nav">'+
					'<ul>' +
						'<li><a href="#">DASHBOARD</a></li>'+
						'<li><a href="#">PRODUCT</a></li>'+
						'<li><a href="#">CMS</a></li>'+
						// '<li><a href="#">SYSTEM SETTING</a></li>'+
						// '<li><a href="#">USERS BLOG</a></li>'+
						'<li><a href="#">CUSTOMERS</a></li>'+
						'<li><a href="#">VENDORS</a></li>'+
						'<li><a href="#">ORDER</a></li>'+
					'</ul>' +
				'</div>'+
			'</div>'+
			'<div class="col-md-9 col-md-offset-3">'+
				'<div class="col-md-12 top-nav">'+
					'<ul>' +
						'<li><a href="#">Departement</a></li>'+
						'<li><a href="#">Item</a></li>'+
						'<li><a href="#">Customer</a></li>'+
						'<li><a href="#">Shipping Option</a></li>'+
						'<li><a href="#">Payment Method</a></li>'+
						'<li><a href="#">Discounts</a></li>'+
						'<li><a href="#">Catalog Price Rule</a></li>'+
					'</ul>' +
				'</div>'+
				'<div class="col-md-12 main-content">'+
				'</div>'+
				'<div class="col-md-12 main-footer">'+
				'</div>'+
			'</div>'+
		'</div><div class="clearfix"></div>' +
	'</div>';

	$("main.parent-admin").html(html);
}

function footerAdmin(){
	var html = "Copyright © 2014 Tulisan LLC. All Rights Reserved.";

	$(".main-footer").html(html);
}