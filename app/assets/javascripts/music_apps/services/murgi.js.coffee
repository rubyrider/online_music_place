window.MusicApp.murgi =
  {
    sources: (songs) ->(
      _song_list = []

      _.each(songs, (song)->(
        _song = {}
        _song.title = song.name
        _formats = _.keys(song.song_url)
        _.each(_formats, (format)->
           _song[format] = song.song_url[format]
           console.log(_song)
        )
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
        supplied: "mp3, ogg, m4a",
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
