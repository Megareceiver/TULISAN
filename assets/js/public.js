var base_url = window.location.origin + '';
var checkedArray = [];

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

function p_formHandler(formId, type, back){
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
					r_callBack(back);
				}
			},
			complete: function(xhr,status) {  },
			error: function(xhr,status,error) { console.log(xhr); }
		});
	});		
}

//Fall Back 
function r_callBack(back){
	window.location.href = base_url + "/admin/" + back;
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
	r_setCookie('adminAlphaFilter'				,'', 0.1);
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
