$(document).ready(function () {
    $(".item").on("mouseover", function () {
        $(this).popup('show');
    });
});
function item_load (id) {
    $(id).toggleClass("ui text");
}