$(document).ready(function()
{
    /******************
    COOKIE NOTICE
    ******************/
    if(getCookie('show_cookie_message') != 'no')
    {
        $('#cookie_box').show();
    }

    $('.cookie_box_close').click(function()
    {
        $('#cookie_box').animate({opacity:0 }, "slow");
        setCookie('show_cookie_message','no');
        return false;
    });

    /*********************************************************************/

    var cookie_val = $.cookie('gtb_notification_cookies')
    if (cookie_val == "box closed") {
        $("#cookie_box").hide();
    }

    $("#change_cookie_val").click(function(){
        $.cookie('gtb_notification_cookies', 'box closed', { expires: 1826 });
        console.log($.cookie('gtb_notification_cookies'));
    });
    /************************ Once Closed *********************************/

});

function setCookie(cookie_name, value)
{
    document.cookie = cookie_name+ "=" + escape(value);
}

function getCookie(cookie_name)
{
    if (document.cookie.length>0)
    {
        cookie_start = document.cookie.indexOf(cookie_name + "=");
        if (cookie_start != -1)
        {
            cookie_start = cookie_start + cookie_name.length+1;
            cookie_end = document.cookie.indexOf(";",cookie_start);
            if (cookie_end == -1)
            {
                cookie_end = document.cookie.length;
            }
            return unescape(document.cookie.substring(cookie_start,cookie_end));
        }
    }
    return "";
}