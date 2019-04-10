/*(function(){
    var fontSize = function(){
        var clientWidth = document.getElementsByTagName("html")[0].clientWidth;
        if (clientWidth > 414) {
            clientWidth = 414;
        }
        if (!clientWidth) return;
        var size = Math.floor(37.5 * (clientWidth / 375)) + 'px';
        document.getElementsByTagName("html")[0].style.fontSize  = size;
    }
    fontSize();
    window.addEventListener("resize",fontSize(),false);

})();*/
!function(n){
    var  e=n.document,
        t=e.documentElement,
        i=375,
        d=i/37.5,
        o="orientationchange"in n?"orientationchange":"resize",
        a=function(){
            var n=t.clientWidth||320;n>375&&(n=375);
            t.style.fontSize=n/d+"px"
        };
    e.addEventListener&&(n.addEventListener(o,a,!1),e.addEventListener("DOMContentLoaded",a,!1))
}(window);
