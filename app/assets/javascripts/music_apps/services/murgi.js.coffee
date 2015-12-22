window.MusicApp.murgi =
  {
    sources: (songs) ->(
      _song_list = []

      _.each(songs, (song)->(
        _song = {}
        _song.mp3 = "#{song.song_url}/;stream/1"
        _song.title = song.name
        _song_list.push(_song)
      ))

      _song_list
    )

    addToPlaylist: (songs)->(
      _playlist = @sources(songs)
      @initializePlayer(_playlist)
    )

    initializePlayer: (sources)->(

      window.myPlaylist = new jPlayerPlaylist({
        jPlayer: '#jplayer_N'
        cssSelectorAncestor: '#jp_container_N'
      }, sources,
        playlistOptions:
          enableRemoveControls: true
          autoPlay: true
        swfPath: 'js/jPlayer'
        supplied: 'webmv, ogv, m4v, oga, mp3, wav'
        smoothPlayBar: true
        keyEnabled: true
        audioFullScreen: false)

      $(document).on $.jPlayer.event.pause, window.myPlaylist.cssSelector.jPlayer, ->
        $('.musicbar').removeClass 'animate'
        $('.jp-play-me').removeClass 'active'
        $('.jp-play-me').parent('li').removeClass 'active'

      $(document).on $.jPlayer.event.play, window.myPlaylist.cssSelector.jPlayer, ->
        $('.musicbar').addClass 'animate'
    )
  }
