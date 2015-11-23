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
//= require_tree ./backend
/*
 *
 $(function() {
 $('#select').filterByText($('#textbox'), true);
 });
 *
 * */
$(document).ready(function () {
    $(document).on("click", ".heart_icon", function() {
        var $this = $(this);
        var song_id = $this.data('song-id');
        var url = '/api/v1/users/' + window.current_user.id + '/songs/' + song_id + '/toggle_like';

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

    ///////////////////music player//////////////////

    function remove_play_icon(){
        $('.play-icon').each(function(index){
            $(this).removeClass('fa-pause');
            $(this).addClass('fa-play-circle-o');
        });
    }

    var song;
    var tracker = $('.p_tracker');
    var volume = $('.p_volume');

    function initAudio(elem) {
        var url = elem.attr('audiourl');
        var title = elem.attr('songtitle');
        var cover = elem.attr('cover');
        var artist = elem.attr('artist');

        $('.p_player .p_title').text(title);
        $('.p_player .p_artist').text(artist);
        $('.p_player .p_cover').css('background-image','url(/assets/images/'+ 'placeholder.png' +')');
        $('.p_player .p_cover').css('background-size','94px 94px');


        song = new Audio(url);

        // timeupdate event listener
        song.addEventListener('timeupdate',function (){
            var curtime = parseInt(song.currentTime, 10);
            tracker.slider('value', curtime);
        });

        $('.p_playlist li').removeClass('active');
        elem.addClass('active');
    }
    function playAudio() {
        song.play();

        tracker.slider("option", "max", song.duration);

        $('.p_play').addClass('hidden');
        $('.p_pause').addClass('visible');
    }
    function stopAudio() {
        song.pause();

        $('.p_play').removeClass('hidden');
        $('.p_pause').removeClass('visible');
    }

    // play click
    $('.p_play').click(function (e) {
        e.preventDefault();

        playAudio();
    });

    // pause click
    $('.p_pause').click(function (e) {
        e.preventDefault();

        stopAudio();
    });

    // forward click
    $('.p_fwd').click(function (e) {
        e.preventDefault();

        stopAudio();

        var next = $('.p_playlist li.active').next();
        if (next.length == 0) {
            next = $('.p_playlist li:first-child');
        }
        initAudio(next);
    });

    // rewind click
    $('.p_rew').click(function (e) {
        e.preventDefault();

        stopAudio();

        var prev = $('.p_playlist li.active').prev();
        if (prev.length == 0) {
            prev = $('.p_playlist li:last-child');
        }
        initAudio(prev);
    });

    // show playlist
    $('.p_pl').click(function (e) {
        e.preventDefault();

        $('.playlist').fadeIn(300);
    });

    // playlist elements - click
    $(document).on("click", "i.play-icon", function() {
        stopAudio();
        remove_play_icon();
        initAudio($(this));
        playAudio();
        $(this).removeClass('fa-play-circle-o');
        $(this).addClass('fa-pause');
    });

    $(document).on('click', '.fa-pause', function () {
        stopAudio();
        $(this).addClass('fa-play-circle-o');
        $(this).removeClass('fa-pause');
    });

    // initialization - first element in playlist
    initAudio($('i.play-icon:first-child'));

    // set volume
    song.volume = 0.8;

    // initialize the volume slider
    volume.slider({
        range: 'min',
        min: 1,
        max: 100,
        value: 80,
        start: function(event,ui) {},
        slide: function(event, ui) {
            song.volume = ui.value / 100;
        },
        stop: function(event,ui) {},
    });

    // empty tracker slider
    tracker.slider({
        range: 'min',
        min: 0, max: 10,
        start: function(event,ui) {},
        slide: function(event, ui) {
            song.currentTime = ui.value;
        },
        stop: function(event,ui) {}
    });




    /////////////////////music player//////////////////
    //var song;
    //var tracker = $('.p_tracker');
    //var volume = $('.p_volume');
    //
    //function initAudio(elem) {
    //    var url = elem.attr('audiourl');
    //    var title = elem.text();
    //    var cover = elem.attr('cover');
    //    var artist = elem.attr('artist');
    //
    //    $('.p_player .p_title').text(title);
    //    $('.p_player .p_artist').text(artist);
    //    $('.p_player .p_cover').css('background-image','url(/assets/images/'+ cover+')');
    //    $('.p_player .p_cover').css('background-size','94px 94px');
    //
    //
    //    song = new Audio(url);
    //
    //    // timeupdate event listener
    //    song.addEventListener('timeupdate',function (){
    //        var curtime = parseInt(song.currentTime, 10);
    //        tracker.slider('value', curtime);
    //    });
    //
    //    $('.p_playlist li').removeClass('active');
    //    elem.addClass('active');
    //}
    //function playAudio() {
    //    song.play();
    //
    //    tracker.slider("option", "max", song.duration);
    //
    //    $('.p_play').addClass('hidden');
    //    $('.p_pause').addClass('visible');
    //}
    //function stopAudio() {
    //    song.pause();
    //
    //    $('.p_play').removeClass('hidden');
    //    $('.p_pause').removeClass('visible');
    //}
    //
    //// play click
    //$('.p_play').click(function (e) {
    //    e.preventDefault();
    //
    //    playAudio();
    //});
    //
    //// pause click
    //$('.p_pause').click(function (e) {
    //    e.preventDefault();
    //
    //    stopAudio();
    //});
    //
    //// forward click
    //$('.p_fwd').click(function (e) {
    //    e.preventDefault();
    //
    //    stopAudio();
    //
    //    var next = $('.p_playlist li.active').next();
    //    if (next.length == 0) {
    //        next = $('.p_playlist li:first-child');
    //    }
    //    initAudio(next);
    //});
    //
    //// rewind click
    //$('.p_rew').click(function (e) {
    //    e.preventDefault();
    //
    //    stopAudio();
    //
    //    var prev = $('.p_playlist li.active').prev();
    //    if (prev.length == 0) {
    //        prev = $('.p_playlist li:last-child');
    //    }
    //    initAudio(prev);
    //});
    //
    //// show playlist
    //$('.p_pl').click(function (e) {
    //    e.preventDefault();
    //
    //    $('.playlist').fadeIn(300);
    //});
    //
    //// playlist elements - click
    //$('.p_playlist li').click(function () {
    //    stopAudio();
    //    initAudio($(this));
    //});
    //
    //// initialization - first element in playlist
    //initAudio($('.p_playlist li:first-child'));
    //
    //// set volume
    //song.volume = 0.8;
    //
    //// initialize the volume slider
    //volume.slider({
    //    range: 'min',
    //    min: 1,
    //    max: 100,
    //    value: 80,
    //    start: function(event,ui) {},
    //    slide: function(event, ui) {
    //        song.volume = ui.value / 100;
    //    },
    //    stop: function(event,ui) {},
    //});
    //
    //// empty tracker slider
    //tracker.slider({
    //    range: 'min',
    //    min: 0, max: 10,
    //    start: function(event,ui) {},
    //    slide: function(event, ui) {
    //        song.currentTime = ui.value;
    //    },
    //    stop: function(event,ui) {}
    //});

});