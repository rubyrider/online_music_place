window.MusicApp.factory 'model.album', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getAlbum: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Album]")

      Restangular.one('albums', id).get(_params)

    getAlbums: ->
      _params = {page: @page}
      Logging.info("Loading [Models::Album]")

      Restangular.all('albums').getList(_params)

    getUserPlaylists: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)
  }
  object
]