$(document).ready(function () {

    window.jplayer = $("#jplayer_N").jPlayer()

    $(document).on('click', '.play-song', function () {
        var songs = $(this).data('audio-url');
        var title = $(this).data('title');
        var song = {}
        song.title = title

        var _formats = _.keys(songs)

        _.each(_formats, function(format){
            song[format] = songs[format]
            console.log(song)
        })

        $("#jplayer_N").jPlayer("clearMedia");
        $("#jplayer_N").jPlayer("destroy");
        initialize_jplayer(song);
    });

    function initialize_jplayer(sources) {
        //$("#jplayer_inspector").jPlayerInspector({jPlayer:$("#jplayer_N")});

        console.log(sources);

        window.myPlaylist = new jPlayerPlaylist({
            jPlayer: "#jplayer_N",
            cssSelectorAncestor: "#jp_container_N",
            preload: 'auto',
        }, [sources], {
            errorAlerts: true,
            warningAlerts: true,
            supplied: "mp3, ogg, m4a",
            playlistOptions: {
                enableRemoveControls: true,
                autoPlay: true
            },
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