// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require dropdown-filter
//= require jquery-ui
//= require autocomplete-rails
//= require cocoon
//= require underscore
//= require music
//= require lodash
//= require popcorn/popcorn.jplayer
//= require demo
//= require jquery.jplayer.min
//= require jplayer.playlist.min
//= require jquery.jplayer.inspector.min
//= require jquery.bxslider
//= require_tree ./backend
//= require_tree ./facebooks
//= require ckeditor-jquery

$(document).ready(function () {

    $('.ckeditor').ckeditor({
        // optional config
    });

    $(document).on("click", ".heart_icon", function() {
        var $this = $(this);
        var song_id = $this.data('song-id');
        var rpath = $this.data('resources-type');
        var url = '/api/v1/users/' + window.current_user.id + '/'+ rpath +'/' + song_id + '/toggle_like';

        $.ajax({
            url: url,
            type: 'POST',
            success: function (response) {
                console.log(response);
                if($this.hasClass('true')){
                    $this.removeClass('true');
                }
                else{
                    $this.addClass('true');
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    });

    /////////////////////like album////////////////////
    $(document).on("click", ".like-album", function() {
        var $this = $(this);
        var album_id = $this.data('album-id');
        var url = '/api/v1/users/' + window.current_user.id + '/albums/' + album_id + '/toggle_like';

        $.ajax({
            url: url,
            type: 'POST',
            success: function (response) {
                console.log(response);
                if($this.hasClass('true')){
                    $this.removeClass('true');
                }
                else{
                    $this.addClass('true');
                }
            },
            error: function (error) {
                console.log(error);
            }
        });
    });

});