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

    $(document).on('click', '.play-album', function () {
        var album_id = $(this).data('album-id');
        if($(this).data('type') == 'album'){
            var url = '/api/v1/albums/' + album_id + '/get_for_jplayer.json'
        }
        else if($(this).data('type') == 'playlist'){
            var url = '/api/v1/play_lists/' + album_id + '/get_for_jplayer.json'
        }
        else {
            var url = '/api/v1/artists/' + album_id + '/get_for_jplayer.json'
        }
        $.ajax({
            url: url,
            type: 'GET',
            success: function (response) {
                $("#jplayer_N").jPlayer( "clearMedia" );
                $("#jplayer_N").jPlayer( "destroy" );
                initialize_jplayer(response);
            }
        });
    });


    function initialize_jplayer(sources) {
        console.log(sources);
        window.myPlaylist = new jPlayerPlaylist({
            jPlayer: "#jplayer_N",
            cssSelectorAncestor: "#jp_container_N"
        }, sources, {
            playlistOptions: {
                enableRemoveControls: true,
                autoPlay: false
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

        $(document).on('click', '.jp-play-me', function (e) {
            e && e.preventDefault();
            var $this = $(e.target);
            if (!$this.is('a')) $this = $this.closest('a');

            $('.jp-play-me').not($this).removeClass('active');
            $('.jp-play-me').parent('li').not($this.parent('li')).removeClass('active');

            $this.toggleClass('active');
            $this.parent('li').toggleClass('active');
            if (!$this.hasClass('active')) {
                window.myPlaylist.pause();
            } else {
                var i = Math.floor(Math.random() * (1 + 7 - 1));
                window.myPlaylist.play(i);
            }

        });
    }


    // video


});