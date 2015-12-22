$(document).ready(function () {

    window.jplayer = $("#jplayer_N").jPlayer()

    $(document).on('click', '.play-song', function(){
       var mp3 = $(this).data('audio-url');
        var title = $(this).data('title');
        var song = [
            {
                mp3: mp3,
                title: title
            }
        ]
        $("#jplayer_N").jPlayer( "clearMedia" );
        $("#jplayer_N").jPlayer( "destroy" );
        initialize_jplayer(song);
    });

    function initialize_jplayer(sources) {
        console.log(sources);
        window.myPlaylist = new jPlayerPlaylist({
            jPlayer: "#jplayer_N",
            cssSelectorAncestor: "#jp_container_N"
        }, sources, {
            playlistOptions: {
                enableRemoveControls: true,
                autoPlay: true
            },
            swfPath: "js/jPlayer",
            supplied: "webmv, ogv, m4v, oga, mp3, wav",
            smoothPlayBar: true,
            keyEnabled: true,
            audioFullScreen: false
        });

        $(document).on($.jPlayer.event.pause, window.myPlaylist.cssSelector.jPlayer, function () {
            $('.musicbar').removeClass('animate');
            $('.jp-play-me').removeClass('active');
            $('.jp-play-me').parent('li').removeClass('active');
        });

        $(document).on($.jPlayer.event.play, window.myPlaylist.cssSelector.jPlayer, function () {
            $('.musicbar').addClass('animate');
        });
    }
});