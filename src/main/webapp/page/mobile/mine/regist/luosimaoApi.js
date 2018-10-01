window.onload = function () {
    var c = document.createElement('script');
    c.type = 'text/javascript';
    c.async = true;
    c.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'captcha.luosimao.com/static/js/api.js';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(c, s);
}