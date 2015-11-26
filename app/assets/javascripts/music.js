//= require angular
//= require restangular
//= require angular-route
//= require angular-sanitize
//= require angular-rails-templates
//= require momentjs

//= require ./music_apps/app
//= require_tree ./music_apps/templates
//= require_tree ./music_apps/utils
//= require_tree ./music_apps/directives
//= require_tree ./music_apps/models
//= require_tree ./music_apps/services
//= require_tree ./music_apps/controllers

window.playlists = [
    {
        "id": 3,
        "name": "Din Bari Jay",
        "duration": 5.28,
        "song_url": "/uploads/song/audio/3/din_bari.mp3",
        "artist_names": [
            "Bappa"
        ]
    },
    {
        "id": 15,
        "name": "Hridoypur",
        "duration": 4.97,
        "song_url": "/uploads/song/audio/15/Dolchut_-_Chader_Jonno_Gaan__music.com.bd_.mp3",
        "artist_names": [
            "Dolchut"
        ]
    }
]

_.templateSettings = {
    interpolate: /\<\@\=(.+?)\@\>/gim,
    evaluate: /\<\@([\s\S]+?)\@\>/gim,
    escape: /\<\@\-(.+?)\@\>/gim
};

$(function () {
    {
        var _playlist = _.template($("#playlist").html())
        $("#playlist-area").html(_playlist({songs: window.playlists}))
    }
})
