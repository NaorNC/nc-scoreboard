
var resourceName = "";
$( function() {
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        if ( item.resourcename ) {
            resourceName = item.resourcename;
        }
        if (item.display) {
            $("#wrap").show();
            $('#body').show();
        } else {
            $('#body').hide();
            $("#wrap").hide();
            $("#pageCount").empty();
            $("#playerCount").empty();
            //$("#serverIcon").empty();
            $("#leftCol").empty();
            $("#rightCol").empty();
            $("#ems").empty();
            $("#police").empty();
            $("#taxi").empty();
            $("#mechanic").empty();
            $("#cardealer").empty();
            $("#estate").empty();
        }
        if (item.addRowLeft) {
            $("#leftCol").append(item.addRowLeft);
        }
        if (item.addRowRight) {
            $("#rightCol").append(item.addRowRight);
        }
        if (item.playerCount) {
            $("#playerCount").append(item.playerCount);
        }
        if (item.page) {
            $("#pageCount").append(item.page);
        }
        if (item.serverIcon) {
            $("#serverIcon").attr('src', item.serverIcon);
        }
        if (item.emsCount) {
            $("#ems").append(item.emsCount);
        }
        if (item.policeCount) {
            $("#police").append(item.policeCount);
        }
        if (item.taxiCount) {
            $("#taxi").append(item.taxiCount);
        }
        if (item.mechanicCount) {
            $("#mechanic").append(item.mechanicCount);
        }
        if (item.cardealerCount) {
            $("#cardealer").append(item.cardealerCount);
        }
        if (item.estateCount) {
            $("#estate").append(item.estateCount);
        }
        
    } );
} )
function copyText(text) {
    var $temp = $("<input>");
    $("body").append($temp);
    $temp.val(text).select();
    document.execCommand("copy");
    $temp.remove();
}

function sendData( name, data ) {
    $.post( "http://" + resourceName + "/" + name, JSON.stringify( data ), function( datab ) {
        if ( datab != "ok" ) {
            return false;
        }            
    } );
    return true;
}