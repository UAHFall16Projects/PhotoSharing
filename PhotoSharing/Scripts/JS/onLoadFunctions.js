$(function () {
    $('#navbar a').click(function (e) {
        $("a.active").removeClass("active");
        $(this).addClass("active");
        $('#userProfileContent > div').hide();
        $(this.hash).show();
        e.preventDefault(); //to prevent scrolling
    });
});