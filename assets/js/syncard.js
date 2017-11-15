/*syncard js*/
$(function(){
	headerAdmin();
	pageAdmin();
	footerAdmin();
	backToTop();
});

function headerAdmin(){
	var html =
	'<div class="content-frame">'+
		'<div class="row">'+
			'<div class="col-xs-5 col-md-3">'+
				'<div class="logo"><img class="big-image" src="../assets/PICS/tulisan.png" /></div>'+
			'</div>'+
			'<div class="col-xs-7 col-md-9">'+
				'<div class="header-title"><h2><span id="departmentName">Product</span> - Departement</h2></div>'+
				'<div class="header-menu fontserif hidden-sm hidden-xs">' +
					'<ul>' +
						'<li><form id="syncrom_logout" f-group="auth"><button type="submit" class="btn btn-link">View Store &nbsp; &nbsp;|</button></form></li>' +
						'<li><img src="../assets/PICS/pattern3.jpg"></li>' +
						'<li>Khrisni Swandayani</li>' +
						'<li><a href="setting.html"><i class="fa fa-cog fa-o"></i></a></li>' +
					'</ul>'+
				'</div>'+
			'</div>'+
		'</div><div class="clearfix"></div>' +
	'</div>';

	$("header.parent-admin").html(html);

	p_formHandler('syncrom_logout', 'logout', 'view-store', 'yes');
}

function pageAdmin(){
	var html =
	'<div class="content-frame">'+
		'<div class="row">'+
			'<div class="col-md-3 left-nav">'+
				'<div class="list-nav">'+
					'<h3 class="fontserif title hidden-lg hidden-md">MENU <span class="left-nav-toggle syn-fixed-right fa fa-chevron-down"></span></h3>' +
					'<ul class="toggle-target">' +
						'<li class="dashboard-route"><a href="index.html">DASHBOARD</a></li>'+
						'<li class="product-route"><a href="product.html">PRODUCTS</a></li>'+
						'<li class="cms-route"><a href="cms.html">CMS</a></li>'+
						'<li class="setting-route"><a href="setting.html">SYSTEM SETTING</a></li>'+
						'<li class="blog-route"><a href="blog.html">USERS BLOG</a></li>'+
						'<li class="customer-route"><a href="customer.html">CUSTOMERS</a></li>'+
						'<li class="vendor-route"><a href="vendor.html">VENDORS</a></li>'+
						'<li class="order-route"><a href="order.html">ORDERS</a></li>'+
						'<li class="hidden-md hidden-lg"><a href="../page/shop.html">VIEW STORE</a></li>'+
					'</ul>' +
				'</div>'+
			'</div>'+
			'<div class="col-md-9 col-md-offset-3 syn-clear">'+
				'<div class="col-md-12 top-nav">'+
					'<ul>' +
						'<li class="departement-route"><a href="departement.html">Departement</a></li>'+
						'<li class="product-route"><a href="product.html">Item</a></li>'+
						'<li class="customer-route"><a href="customer.html">Customer</a></li>'+
						'<li><a href="#">Shipping Option</a></li>'+
						'<li><a href="#">Payment Method</a></li>'+
						'<li><a href="#">Discounts</a></li>'+
						'<li><a href="#">Catalog Price Rule</a></li>'+
					'</ul>' +
				'</div>'+
				'<div class="col-md-12 main-content syn-clear">'+
				'</div>'+
				'<div class="col-md-12 main-footer">'+
				'</div>'+
			'</div>'+
		'</div><div class="clearfix"></div>' +
	'</div>';

	$("main.parent-admin").html(html);

	$(".left-nav-toggle").on('click', function(){
		if($('.toggle-target').is(":hidden")){
			$(this).switchClass('fa-chevron-down', 'fa-chevron-up');
		}else{
			$(this).switchClass('fa-chevron-up', 'fa-chevron-down');
		}

		$($('.toggle-target')).slideToggle();

	});

	//breadcrum
	var page = window.location.href;
		page = page.substring(page.lastIndexOf("/")+ 1);
		page = (page.match(/[^.]+(\.[^?#]+)?/) || [])[0];

	if(page != null && page.length > 0){
		$(".list-nav li, .top-nav li").removeClass('active');
		switch(page){
			case "product.html":
			case "color.html":
			case "formColor.html":
			case "formProduct.html": $(".product-route").addClass('active'); break;
			case "customer.html":
			case "formCustomer.html": $(".customer-route").addClass('active'); break;
			case "formDepartment.html":
			case "departement.html": $(".departement-route").addClass('active'); break;
			case "cms.html":
			case "home.html":
			case "formHome.html":
			case "story.html":
			case "formStory.html":
			case "videos.html":
			case "formVideo.html":
			case "chatter.html":
			case "formChatter.html": $(".cms-route").addClass('active'); break;
			case "formBlog.html":
			case "blog.html": $(".blog-route").addClass('active'); break;
			case "formUser.html":
			case "setting.html": $(".setting-route").addClass('active'); break;
			case "formVendor.html":
			case "vendor.html": $(".vendor-route").addClass('active'); break;
			case "order.html": $(".order-route").addClass('active'); break;
			default: $(".dashboard-route").addClass('active'); break;
		}
	}
}

function footerAdmin(){
	var html = "Copyright © 2014 Tulisan LLC. All Rights Reserved.";
	html = html + '<a href="#" id="back-to-top" title="Back to top"><span class="fa fa-arrow-up fa-2x"></span></a>';

	$(".main-footer").html(html);
}

function checkboxToggle(source, targetName) {
  checkboxes = document.getElementsByName(targetName);
  for(var i=0, n=checkboxes.length;i<n;i++) {
    checkboxes[i].checked = source.checked;
  }
}

//country list option
function countryListOption(){
	var html =
	// '<option value="AF">Afghanistan</option>' +
	// '<option value="AX">Åland Islands</option>' +
	// '<option value="AL">Albania</option>' +
	// '<option value="DZ">Algeria</option>' +
	// '<option value="AS">American Samoa</option>' +
	// '<option value="AD">Andorra</option>' +
	// '<option value="AO">Angola</option>' +
	// '<option value="AI">Anguilla</option>' +
	// '<option value="AQ">Antarctica</option>' +
	// '<option value="AG">Antigua and Barbuda</option>' +
	// '<option value="AR">Argentina</option>' +
	// '<option value="AM">Armenia</option>' +
	// '<option value="AW">Aruba</option>' +
	// '<option value="AU">Australia</option>' +
	// '<option value="AT">Austria</option>' +
	// '<option value="AZ">Azerbaijan</option>' +
	// '<option value="BS">Bahamas</option>' +
	// '<option value="BH">Bahrain</option>' +
	// '<option value="BD">Bangladesh</option>' +
	// '<option value="BB">Barbados</option>' +
	// '<option value="BY">Belarus</option>' +
	// '<option value="BE">Belgium</option>' +
	// '<option value="BZ">Belize</option>' +
	// '<option value="BJ">Benin</option>' +
	// '<option value="BM">Bermuda</option>' +
	// '<option value="BT">Bhutan</option>' +
	// '<option value="BO">Bolivia, Plurinational State of</option>' +
	// '<option value="BQ">Bonaire, Sint Eustatius and Saba</option>' +
	// '<option value="BA">Bosnia and Herzegovina</option>' +
	// '<option value="BW">Botswana</option>' +
	// '<option value="BV">Bouvet Island</option>' +
	// '<option value="BR">Brazil</option>' +
	// '<option value="IO">British Indian Ocean Territory</option>' +
	// '<option value="BN">Brunei Darussalam</option>' +
	// '<option value="BG">Bulgaria</option>' +
	// '<option value="BF">Burkina Faso</option>' +
	// '<option value="BI">Burundi</option>' +
	// '<option value="KH">Cambodia</option>' +
	// '<option value="CM">Cameroon</option>' +
	// '<option value="CA">Canada</option>' +
	// '<option value="CV">Cape Verde</option>' +
	// '<option value="KY">Cayman Islands</option>' +
	// '<option value="CF">Central African Republic</option>' +
	// '<option value="TD">Chad</option>' +
	// '<option value="CL">Chile</option>' +
	// '<option value="CN">China</option>' +
	// '<option value="CX">Christmas Island</option>' +
	// '<option value="CC">Cocos (Keeling) Islands</option>' +
	// '<option value="CO">Colombia</option>' +
	// '<option value="KM">Comoros</option>' +
	// '<option value="CG">Congo</option>' +
	// '<option value="CD">Congo, the Democratic Republic of the</option>' +
	// '<option value="CK">Cook Islands</option>' +
	// '<option value="CR">Costa Rica</option>' +
	// '<option value="CI">Côte d\'Ivoire</option>' +
	// '<option value="HR">Croatia</option>' +
	// '<option value="CU">Cuba</option>' +
	// '<option value="CW">Curaçao</option>' +
	// '<option value="CY">Cyprus</option>' +
	// '<option value="CZ">Czech Republic</option>' +
	// '<option value="DK">Denmark</option>' +
	// '<option value="DJ">Djibouti</option>' +
	// '<option value="DM">Dominica</option>' +
	// '<option value="DO">Dominican Republic</option>' +
	// '<option value="EC">Ecuador</option>' +
	// '<option value="EG">Egypt</option>' +
	// '<option value="SV">El Salvador</option>' +
	// '<option value="GQ">Equatorial Guinea</option>' +
	// '<option value="ER">Eritrea</option>' +
	// '<option value="EE">Estonia</option>' +
	// '<option value="ET">Ethiopia</option>' +
	// '<option value="FK">Falkland Islands (Malvinas)</option>' +
	// '<option value="FO">Faroe Islands</option>' +
	// '<option value="FJ">Fiji</option>' +
	// '<option value="FI">Finland</option>' +
	// '<option value="FR">France</option>' +
	// '<option value="GF">French Guiana</option>' +
	// '<option value="PF">French Polynesia</option>' +
	// '<option value="TF">French Southern Territories</option>' +
	// '<option value="GA">Gabon</option>' +
	// '<option value="GM">Gambia</option>' +
	// '<option value="GE">Georgia</option>' +
	// '<option value="DE">Germany</option>' +
	// '<option value="GH">Ghana</option>' +
	// '<option value="GI">Gibraltar</option>' +
	// '<option value="GR">Greece</option>' +
	// '<option value="GL">Greenland</option>' +
	// '<option value="GD">Grenada</option>' +
	// '<option value="GP">Guadeloupe</option>' +
	// '<option value="GU">Guam</option>' +
	// '<option value="GT">Guatemala</option>' +
	// '<option value="GG">Guernsey</option>' +
	// '<option value="GN">Guinea</option>' +
	// '<option value="GW">Guinea-Bissau</option>' +
	// '<option value="GY">Guyana</option>' +
	// '<option value="HT">Haiti</option>' +
	// '<option value="HM">Heard Island and McDonald Islands</option>' +
	// '<option value="VA">Holy See (Vatican City State)</option>' +
	// '<option value="HN">Honduras</option>' +
	// '<option value="HK">Hong Kong</option>' +
	// '<option value="HU">Hungary</option>' +
	// '<option value="IS">Iceland</option>' +
	// '<option value="IN">India</option>' +
	'<option value="Indonesia" selected="selected">Indonesia</option>'
	// '<option value="IR">Iran, Islamic Republic of</option>' +
	// '<option value="IQ">Iraq</option>' +
	// '<option value="IE">Ireland</option>' +
	// '<option value="IM">Isle of Man</option>' +
	// '<option value="IL">Israel</option>' +
	// '<option value="IT">Italy</option>' +
	// '<option value="JM">Jamaica</option>' +
	// '<option value="JP">Japan</option>' +
	// '<option value="JE">Jersey</option>' +
	// '<option value="JO">Jordan</option>' +
	// '<option value="KZ">Kazakhstan</option>' +
	// '<option value="KE">Kenya</option>' +
	// '<option value="KI">Kiribati</option>' +
	// '<option value="KP">Korea, Democratic People\'s Republic of</option>' +
	// '<option value="KR">Korea, Republic of</option>' +
	// '<option value="KW">Kuwait</option>' +
	// '<option value="KG">Kyrgyzstan</option>' +
	// '<option value="LA">Lao People\'s Democratic Republic</option>' +
	// '<option value="LV">Latvia</option>' +
	// '<option value="LB">Lebanon</option>' +
	// '<option value="LS">Lesotho</option>' +
	// '<option value="LR">Liberia</option>' +
	// '<option value="LY">Libya</option>' +
	// '<option value="LI">Liechtenstein</option>' +
	// '<option value="LT">Lithuania</option>' +
	// '<option value="LU">Luxembourg</option>' +
	// '<option value="MO">Macao</option>' +
	// '<option value="MK">Macedonia, the former Yugoslav Republic of</option>' +
	// '<option value="MG">Madagascar</option>' +
	// '<option value="MW">Malawi</option>' +
	// '<option value="MY">Malaysia</option>' +
	// '<option value="MV">Maldives</option>' +
	// '<option value="ML">Mali</option>' +
	// '<option value="MT">Malta</option>' +
	// '<option value="MH">Marshall Islands</option>' +
	// '<option value="MQ">Martinique</option>' +
	// '<option value="MR">Mauritania</option>' +
	// '<option value="MU">Mauritius</option>' +
	// '<option value="YT">Mayotte</option>' +
	// '<option value="MX">Mexico</option>' +
	// '<option value="FM">Micronesia, Federated States of</option>' +
	// '<option value="MD">Moldova, Republic of</option>' +
	// '<option value="MC">Monaco</option>' +
	// '<option value="MN">Mongolia</option>' +
	// '<option value="ME">Montenegro</option>' +
	// '<option value="MS">Montserrat</option>' +
	// '<option value="MA">Morocco</option>' +
	// '<option value="MZ">Mozambique</option>' +
	// '<option value="MM">Myanmar</option>' +
	// '<option value="NA">Namibia</option>' +
	// '<option value="NR">Nauru</option>' +
	// '<option value="NP">Nepal</option>' +
	// '<option value="NL">Netherlands</option>' +
	// '<option value="NC">New Caledonia</option>' +
	// '<option value="NZ">New Zealand</option>' +
	// '<option value="NI">Nicaragua</option>' +
	// '<option value="NE">Niger</option>' +
	// '<option value="NG">Nigeria</option>' +
	// '<option value="NU">Niue</option>' +
	// '<option value="NF">Norfolk Island</option>' +
	// '<option value="MP">Northern Mariana Islands</option>' +
	// '<option value="NO">Norway</option>' +
	// '<option value="OM">Oman</option>' +
	// '<option value="PK">Pakistan</option>' +
	// '<option value="PW">Palau</option>' +
	// '<option value="PS">Palestinian Territory, Occupied</option>' +
	// '<option value="PA">Panama</option>' +
	// '<option value="PG">Papua New Guinea</option>' +
	// '<option value="PY">Paraguay</option>' +
	// '<option value="PE">Peru</option>' +
	// '<option value="PH">Philippines</option>' +
	// '<option value="PN">Pitcairn</option>' +
	// '<option value="PL">Poland</option>' +
	// '<option value="PT">Portugal</option>' +
	// '<option value="PR">Puerto Rico</option>' +
	// '<option value="QA">Qatar</option>' +
	// '<option value="RE">Réunion</option>' +
	// '<option value="RO">Romania</option>' +
	// '<option value="RU">Russian Federation</option>' +
	// '<option value="RW">Rwanda</option>' +
	// '<option value="BL">Saint Barthélemy</option>' +
	// '<option value="SH">Saint Helena, Ascension and Tristan da Cunha</option>' +
	// '<option value="KN">Saint Kitts and Nevis</option>' +
	// '<option value="LC">Saint Lucia</option>' +
	// '<option value="MF">Saint Martin (French part)</option>' +
	// '<option value="PM">Saint Pierre and Miquelon</option>' +
	// '<option value="VC">Saint Vincent and the Grenadines</option>' +
	// '<option value="WS">Samoa</option>' +
	// '<option value="SM">San Marino</option>' +
	// '<option value="ST">Sao Tome and Principe</option>' +
	// '<option value="SA">Saudi Arabia</option>' +
	// '<option value="SN">Senegal</option>' +
	// '<option value="RS">Serbia</option>' +
	// '<option value="SC">Seychelles</option>' +
	// '<option value="SL">Sierra Leone</option>' +
	// '<option value="SG">Singapore</option>' +
	// '<option value="SX">Sint Maarten (Dutch part)</option>' +
	// '<option value="SK">Slovakia</option>' +
	// '<option value="SI">Slovenia</option>' +
	// '<option value="SB">Solomon Islands</option>' +
	// '<option value="SO">Somalia</option>' +
	// '<option value="ZA">South Africa</option>' +
	// '<option value="GS">South Georgia and the South Sandwich Islands</option>' +
	// '<option value="SS">South Sudan</option>' +
	// '<option value="ES">Spain</option>' +
	// '<option value="LK">Sri Lanka</option>' +
	// '<option value="SD">Sudan</option>' +
	// '<option value="SR">Suriname</option>' +
	// '<option value="SJ">Svalbard and Jan Mayen</option>' +
	// '<option value="SZ">Swaziland</option>' +
	// '<option value="SE">Sweden</option>' +
	// '<option value="CH">Switzerland</option>' +
	// '<option value="SY">Syrian Arab Republic</option>' +
	// '<option value="TW">Taiwan, Province of China</option>' +
	// '<option value="TJ">Tajikistan</option>' +
	// '<option value="TZ">Tanzania, United Republic of</option>' +
	// '<option value="TH">Thailand</option>' +
	// '<option value="TL">Timor-Leste</option>' +
	// '<option value="TG">Togo</option>' +
	// '<option value="TK">Tokelau</option>' +
	// '<option value="TO">Tonga</option>' +
	// '<option value="TT">Trinidad and Tobago</option>' +
	// '<option value="TN">Tunisia</option>' +
	// '<option value="TR">Turkey</option>' +
	// '<option value="TM">Turkmenistan</option>' +
	// '<option value="TC">Turks and Caicos Islands</option>' +
	// '<option value="TV">Tuvalu</option>' +
	// '<option value="UG">Uganda</option>' +
	// '<option value="UA">Ukraine</option>' +
	// '<option value="AE">United Arab Emirates</option>' +
	// '<option value="GB">United Kingdom</option>' +
	// '<option value="US">United States</option>' +
	// '<option value="UM">United States Minor Outlying Islands</option>' +
	// '<option value="UY">Uruguay</option>' +
	// '<option value="UZ">Uzbekistan</option>' +
	// '<option value="VU">Vanuatu</option>' +
	// '<option value="VE">Venezuela, Bolivarian Republic of</option>' +
	// '<option value="VN">Viet Nam</option>' +
	// '<option value="VG">Virgin Islands, British</option>' +
	// '<option value="VI">Virgin Islands, U.S.</option>' +
	// '<option value="WF">Wallis and Futuna</option>' +
	// '<option value="EH">Western Sahara</option>' +
	// '<option value="YE">Yemen</option>' +
	// '<option value="ZM">Zambia</option>' +
	/*'<option value="ZW">Zimbabwe</option>'*/;

	return html;
}

/* =============================================================================================== */
/* time converter */
function timeSince(date) {
	var seconds = Math.floor((new Date() - date) / 1000);
	var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
	if (seconds < 5){
		return "Just now";
	}else if (seconds < 60){
		return seconds + " seconds ago";
	}
	else if (seconds < 3600) {
		minutes = Math.floor(seconds/60)
		if(minutes > 1)
			return minutes + " minutes ago";
		else
			return "1 minute ago";
	}
	else if (seconds < 86400) {
		hours = Math.floor(seconds/3600)
		if(hours > 1)
			return hours + " hours ago";
		else
			return "1 hour ago";
	}
	//2 days and no more
	else if (seconds < 172800) {
		days = Math.floor(seconds/86400)
		if(days > 1)
			return days + " days ago";
		else
			return "1 day ago";
	}
	else{

		//return new Date(time).toLocaleDateString();
		return date.getDate().toString() + " " + months[date.getMonth()] + ", " + date.getFullYear();
	}
}

// currency
function currencyFormat(num, curr = 'Rp. ') {
    var p = num;
    return curr + p.split("").reverse().reduce(function(acc, num, i, orig) {
        return  num=="-" ? acc : num + (i && !(i % 3) ? "," : "") + acc;
    }, "");
}

//backToTop
function backToTop(){
	if ($('#back-to-top').length) {
	    var scrollTrigger = 100, // px
	        backToTop = function () {
	            var scrollTop = $("html,body").scrollTop();
	            if (scrollTop > scrollTrigger) {
	                $('#back-to-top').addClass('show');
	            } else {
	                $('#back-to-top').removeClass('show');
	            }
	        };
	    backToTop();
	    $(window).on('scroll', function () {
	        backToTop();
	    });
	    $('#back-to-top').on('click', function (e) {
	        e.preventDefault();
	        $('html,body').animate({
	            scrollTop: 0
	        }, 700);
	    });
	}
}
