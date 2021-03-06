window.MusicApp.factory 'model.genre', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getGenre: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Genre]")

      Restangular.one('genres', id).get(_params)
  }
  object
]