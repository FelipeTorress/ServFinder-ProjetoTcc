// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

function chamarMapaLocAproximada(loc){
    try{
        user_loc = loc.split(',')
        var map = L.map('map').setView([parseFloat(user_loc[0]), parseFloat(user_loc[1])], 15);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
    
        L.circle([parseFloat(user_loc[0]), parseFloat(user_loc[1])], {
        color: 'red',
        fillColor: '#f03',
        fillOpacity: 0.5,
        radius: 800
        }).addTo(map)
    } catch (e){
        location.reload();
    }
}

function chamarMapaLocExata(loc){
    try{
        user_loc = loc.split(',')
        var map = L.map('map').setView([parseFloat(user_loc[0]), parseFloat(user_loc[1])], 15);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);
    
        L.marker([parseFloat(user_loc[0]), parseFloat(user_loc[1])]).addTo(map);
    } catch (e){
        location.reload();
    }
}


scroll_botton = function() {
    if ($('#messages-box').length > 0){
      $('#messages-box').scrollTop($('#messages-box')[0].scrollHeight);
    }
  }
  
  
$('#new_message').on('ajax:send', function() {
    $('#message_body').val("").focus();
});

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();

    $('.message .close').on('click', function() {
        $(this).closest('.message').transition('fade');
    });

    scroll_botton()

    $(document).bind("ajax:beforeSend", function(){
        $('#message_body').val('');
    });
})