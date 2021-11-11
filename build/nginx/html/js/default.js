var reload;
var timeOut = 2000;

function checkRefresh() {
    const refresh = document.cookie.split('; ').find(row => row.startsWith('refresh=')).split('=')[1];
    if ( refresh == "true" ) {
        document.getElementById("check").checked = true;
        reload = setTimeout( function() { location.reload(); }, timeOut );
    } else {
        document.getElementById("check").checked = false;
    }
}

function changeCookie() {
    if ( document.getElementById("check").checked ) {
        document.cookie = "refresh=true";
        reload = setTimeout( function() { location.reload(); }, timeOut );
    } else {
        document.cookie = "refresh=false";
        clearTimeout(reload);
    }
}
