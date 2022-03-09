$(document).ready(function () {
    $(document).on('click', '#switch_button', function () {

        var imageDiv = $('.swap_image').closest('div'),
            formDiv = $('.swap_form').closest('div');
            distance = imageDiv.offset().left - formDiv.offset().left + 60;
            
            if (imageDiv.length) {
            $.when(
                imageDiv.animate({left: -distance}, 1000, ),
                formDiv.animate({left: distance}, 1000)).done(function () {
                imageDiv.css('left', '0px');
                formDiv.css('left', '0px');
            
                if(distance > 0) {
                    formDiv.css('top', '0px');
                    imageDiv.prependTo("#login_section");
                }
                else {
                    formDiv.css('top', '-14px');
                    formDiv.prependTo("#login_section");
                }
            });
        }
    });
});