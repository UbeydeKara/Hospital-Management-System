$(document).ready(function () {
    $('.ui.dropdown').dropdown();
    $(".item").on("mouseover", function () {
        $(this).popup('show');
    });
});