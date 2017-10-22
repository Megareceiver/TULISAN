var base_url = window.location.origin + '/TULISAN';
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

function p_formHandler(formId, type){
	$("#" + formId).unbind().on('submit', function(e) {
		showNotification('info', 'waiting', 'sedang memproses...', false);
		e.preventDefault();
		$.ajax({
			url: base_url + "/data/router.php?session=" + type + "&group=" + $(this).attr('f-group') + "&target=" + $(this).attr('f-target'), // Url to which the request is send
			type: "POST",             // Type of request to be send, called as method
			data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
			contentType: false,       // The content type used when sending data to the server.
			cache: false,             // To unable request pages to be cached
			processData:false,        // To send DOMDocument or non processed data file it is set to false
			success: function(result){
			console.log(data);
		},
		complete: function(xhr,status) {  },
		error: function(xhr,status,error) { console.log(xhr); }
		});
	});		
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