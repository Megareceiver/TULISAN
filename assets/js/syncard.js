/*syncard js*/
$(function(){
	headerAdmin();
	menuAdmin();
});


function headerAdmin(){
	var html =
	'<div class="row">'+
		'<div class="col-md-3">'+
			'<img src="../assets/PICS/tulisan.png" />'+
		'</div>'+
		'<div class="col-md-3 title">'+
			'<p><b>Product - Departement</b></p>'+
		'</div>'+
		'<div class="col-md-6 right">'+
			'<p><a href=#>View Store</a> | <img src="../assets/PICS/3.jpg"> Khrisni Swandayani <a href="#"><i class="fa fa-cog fa-2x"></i></a></p>'+
		'</div>'+
	'</div><div class="clearfix"></div>';

	$("header.parent-admin").html(html);
}

function menuAdmin(){
	var html =
	'<div class="row div-normalize">'+
		'<div class="col-md-3 right-menu">'+
			'<p><a href="#">DASHBOARD</a></p>'+
			'<p><a href="#">PRODUCT</a></p>'+
			'<p><a href="#">CMS</a></p>'+
			'<p><a href="#">SYSTEM SETTING</a></p>'+
			'<p><a href="#">USERS BLOG</a></p>'+
			'<p><a href="#">CUSTOMERS</a></p>'+
			'<p><a href="#">VENDORS</a></p>'+
			'<p><a href="#">ORDER</a></p>'+
		'</div>'+
		'<div class="col-md-9 top-menu">'+
			'<a href="#">Departement</a>'+
			'<a href="#">Item</a>'+
			'<a href="#">Customer</a>'+
			'<a href="#">Shipping Option</a>'+
			'<a href="#">Payment Method</a>'+
			'<a href="#">Discounts</a>'+
			'<a href="#">Catalog Price Rule</a>'+
		'</div>'+
		// '</div><div class="clearfix"></div>'+
		'<div class="col-md-9 main-menu row">'+
		'</div>'+
	'</div><div class="clearfix"></div>';

	$("main.parent-admin").html(html);
}