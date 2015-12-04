window.MusicApp.factory 'model.playlist', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getPlaylists: () ->
      _params = {page: @page, system: true}
      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)

    getSongs: (id) ->
      _params = {page: @page, system: true}
      Restangular.one('play_lists', id).get(_params)

    getUserPlaylists: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)
  }
  object
]