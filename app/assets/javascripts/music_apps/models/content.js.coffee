window.MusicApp.factory 'model.content', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getLatestSongs: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      Restangular.all('songs').getList(_params)

    getHomePageContents: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      Restangular.all('albums').getList(_params)

    getMoodPlaylists: () ->
      _params = {page: @page, mood: true}
      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)

    getUserPlaylists: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)
  }
  object
]