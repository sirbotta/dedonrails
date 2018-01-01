var formsInit = function() {
    $('select').material_select();
    $('.modal').modal();
};
//$(document).ready(formsInit); //standard jQuery behavior
//$(document).on('page:load', formsInit); //adaptation to turbolink
$(document).on('turbolinks:load', formsInit); //adaptation to turbolink