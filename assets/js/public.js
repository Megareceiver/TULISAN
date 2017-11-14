var base_url = window.location.origin + '/TULISAN';
var checkedArray = [];
var Base64={_keyStr:"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",encode:function(e){var t="";var n,r,i,s,o,u,a;var f=0;e=Base64._utf8_encode(e);while(f<e.length){n=e.charCodeAt(f++);r=e.charCodeAt(f++);i=e.charCodeAt(f++);s=n>>2;o=(n&3)<<4|r>>4;u=(r&15)<<2|i>>6;a=i&63;if(isNaN(r)){u=a=64}else if(isNaN(i)){a=64}t=t+this._keyStr.charAt(s)+this._keyStr.charAt(o)+this._keyStr.charAt(u)+this._keyStr.charAt(a)}return t},decode:function(e){var t="";var n,r,i;var s,o,u,a;var f=0;e=e.replace(/[^A-Za-z0-9+/=]/g,"");while(f<e.length){s=this._keyStr.indexOf(e.charAt(f++));o=this._keyStr.indexOf(e.charAt(f++));u=this._keyStr.indexOf(e.charAt(f++));a=this._keyStr.indexOf(e.charAt(f++));n=s<<2|o>>4;r=(o&15)<<4|u>>2;i=(u&3)<<6|a;t=t+String.fromCharCode(n);if(u!=64){t=t+String.fromCharCode(r)}if(a!=64){t=t+String.fromCharCode(i)}}t=Base64._utf8_decode(t);return t},_utf8_encode:function(e){e=e.replace(/rn/g,"n");var t="";for(var n=0;n<e.length;n++){var r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r)}else if(r>127&&r<2048){t+=String.fromCharCode(r>>6|192);t+=String.fromCharCode(r&63|128)}else{t+=String.fromCharCode(r>>12|224);t+=String.fromCharCode(r>>6&63|128);t+=String.fromCharCode(r&63|128)}}return t},_utf8_decode:function(e){var t="";var n=0;var r=c1=c2=0;while(n<e.length){r=e.charCodeAt(n);if(r<128){t+=String.fromCharCode(r);n++}else if(r>191&&r<224){c2=e.charCodeAt(n+1);t+=String.fromCharCode((r&31)<<6|c2&63);n+=2}else{c2=e.charCodeAt(n+1);c3=e.charCodeAt(n+2);t+=String.fromCharCode((r&15)<<12|(c2&63)<<6|c3&63);n+=3}}return t}}


/* authentication */
/* =============================================================================================== */
function p_logout(){
	var	reStatus = "";
	$.ajax({
		url: base_url + 'data/router.php?session=logout&group=fLogin&target=',
		type: 'post',
		dataType: 'json',
		async: false,
		data: { session : 'logout' },
		success: function(result){
			// reStatus = result.status;
			// logoutAgent = 1;
			// notifChecker = 0;
			// clearTimeout(notifId);
			// r_clearCookies();
		},
		complete: function(xhr,status) { },
		error: function(xhr,status,error) { console.log(xhr); showNotification('danger', 'failure', 'Terjadi kesalahan, tidak ada respon dari server! ' + error); }
	});

	return reStatus;
}

/* request management */
/* =============================================================================================== */
function p_getData(group, target, page="1", keyword=""){
	var data = null;
	$.ajax({
		url: base_url + '/data/router.php?session=requestData&group=' + group + '&target=' + target,
		type: 'post',
		dataType: 'json',
		async: false,
		data: { page : page, keyword: keyword },
		success: function(result){
			console.log(result);
			data = result;
		},
		complete: function(xhr,status) {  },
		error: function(xhr,status,error) { console.log(xhr); }
	});

	return data;
}

function p_removeData(group, target, id){
	var data = null;
	$.ajax({
		url: base_url + '/data/router.php?session=removeData&group=' + group + '&target=' + target,
		type: 'post',
		dataType: 'json',
		async: false,
		data: { id : id },
		success: function(result){
			console.log(result);
			data = result;
		},
		complete: function(xhr,status) {  },
		error: function(xhr,status,error) { console.log(xhr); }
	});

	return data;
}

function p_changeData(group, target, pId, refferenceId, dataFetch){
	var data = null;
	$.ajax({
		url: base_url + '/data/router.php?session=updateData&group=' + group + '&target=' + target,
		type: 'post',
		dataType: 'json',
		async: false,
		data: { pId : pId, refferenceId: refferenceId, dataFetch: dataFetch },
		success: function(result){
			console.log(result);
			data = result;
		},
		complete: function(xhr,status) {  },
		error: function(xhr,status,error) { console.log(xhr); }
	});

	return data;
}

function p_formHandler(formId, type, back, custom = "no"){
	$("#" + formId).unbind().on('submit', function(e) {
		e.preventDefault();
		$.ajax({
			url: base_url + "/data/router.php?session=" + type + "&group=" + $(this).attr('f-group') + "&target=" + $(this).attr('f-target'), // Url to which the request is send
			type: "POST",             // Type of request to be send, called as method
			data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
			contentType: false,       // The content type used when sending data to the server.
			cache: false,             // To unable request pages to be cached
			processData:false,        // To send DOMDocument or non processed data file it is set to false
			success: function(result){
				console.log(result);
				if(result.feedStatus == "success"){
					if(back != "") r_callBack(back, custom, result.feedData);
				}
			},
			complete: function(xhr,status) {  },
			error: function(xhr,status,error) { console.log(xhr); }
		});
	});
}

//Fall Back
function r_callBack(back, custom, data){
	if(custom == "no"){
		window.location.href = base_url + "/admin/" + back;
	}else{
		switch (back) {
			case "login":
					p_login_set_cookie(data);

					if(data.type=="admin"){
						window.location.href = base_url + "/admin/";
					}else{
						window.location.href = base_url + "/page/shop.html";
					}
			break;
			case "logout":
				r_clearCookies();
				window.location.href = base_url;
			break;
			default:

		}
	}
}

function p_login_set_cookie(data) {
	r_setCookie('tulisan_user_name', data.name);
	r_setCookie('tulisan_user_username', data.username);
	r_setCookie('tulisan_user_type', data.type);
	r_setCookie('tulisan_user_picture', data.picture);
	r_setCookie('tulisan_user_departement', data.departement);
}

function r_setCookie(cname,cvalue,exdays="1") {
    var d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = "TULISAN_" + cname + "=" + cvalue + ";" + expires + ";path=/";
}

function r_getCookie(cname) {
    var name = "TULISAN_" + cname + "=";
    var ca = document.cookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function r_clearCookies(){
	r_setCookie('adminPageFilter'				,'', 0.1);
	r_setCookie('adminAlphaFilter'			,'', 0.1);
	r_setCookie('tulisan_user_name'			,'', 0.1);
	r_setCookie('tulisan_user_username'	,'', 0.1);
	r_setCookie('tulisan_user_type'			,'', 0.1);
	r_setCookie('tulisan_user_picture'			,'', 0.1);
	r_setCookie('tulisan_user_departement'	,'', 0.1);
}

function checkboxActivator(){
	$("[type=checkbox]").unbind().change(function(){
	    var chkArray = [];
	    chkArray = $.map($("[type=checkbox]"), function(el){
	        if(el.checked) { return el.value };
	    });

	    checkedArray = chkArray;
	    console.log(checkedArray);
    });
}

/* form auto */
/* =============================================================================================== */
function isNumberKey(evt){
	$('input.number').keyup(function(){$(this).val($(this).val().replace(/[^\d]/,''));});
    var charCode = (evt.which) ? evt.which : evt.keyCode
    return !(charCode > 31 && (charCode < 48 || charCode > 57));
}

function numberOnlyActivator(target){
	$(target).keypress(function (e) {
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	        return false;
	    }
	});
}

function currencyFormatActivator(target){
	$(target).on('keyup', function(e){
		if ((e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) || $(this).val() == "") { return false; }
		else{
	    	var n = parseInt($(this).val().replace(/\D/g,''),10);
	    	$(this).val(n.toLocaleString());
		}
	});

	$(target).keypress(function (e) {
	    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
	        return false;
	    }
	});
}

function currencyFormatChanger(target){
	var n = parseInt($(target).val().replace(/\D/g,''),10);
	$(target).val(n.toLocaleString());
}

function normalFormatChanger(target){
	var n = parseInt(target.replace(/\D/g,''),10);
	return n;
}

/* image Preview */
function imagePreviewActivator(target){
	 $(target).unbind().on("change", function(){ imagePreview(this, $(this).attr("preview-id")); });
}

function imagePreview(elem, targetId) {

	if (elem.files && elem.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			$('#' + targetId).attr('src', e.target.result);
			// $('img[viewer-id=' + targetId + ']').removeClass("changed").addClass("changed");
		};

		reader.readAsDataURL(elem.files[0]);
		return false;
	}
}

/* get param from url */
function getParam(name, url) {
    if (!url) url = location.href;
    name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
    var regexS = "[\\?&]"+name+"=([^&#]*)";
    var regex = new RegExp( regexS );
    var results = regex.exec( url );
    return results == null ? null : results[1];
}

/* file size converter */
function fileSizeConverter(bytes, si) {
    var thresh = si ? 1000 : 1024;
    if(Math.abs(bytes) < thresh) {
        return bytes + ' B';
    }
    var units = si
        ? ['kB','MB','GB','TB','PB','EB','ZB','YB']
        : ['KiB','MiB','GiB','TiB','PiB','EiB','ZiB','YiB'];
    var u = -1;
    do {
        bytes /= thresh;
        ++u;
    } while(Math.abs(bytes) >= thresh && u < units.length - 1);
    return bytes.toFixed(1)+' '+units[u];
}

//option transform
function dataToOptionHtml(data){
	var html = "";
	for(var loop =0; loop<data.length; loop++){
		html = html + "<option value='" + data[loop].value + "'>" + data[loop].caption + "</option>";
	}

	return html;
}
