$(function () {
    $('#navbar a').click(function (e) {
        $("a.active").removeClass("active");
        $(this).addClass("active");
        $('#userProfileContent > div').hide();
        $(this.hash).show();
        e.preventDefault(); //to prevent scrolling
    });

    $('#profileMoreOptions').click(function (e) {
        $('#profileMoreDDL').toggleClass("hide");
        e.stopPropagation();
        e.preventDefault(); //to prevent scrolling
    });

    $(document).mouseup(function (e) {
        var container = $("#profileMoreOptions");
        if (!container.is(e.target) // if the target of the click isn't the container...
            && container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            $('#profileMoreDDL').addClass("hide");
           
        }

    });
});