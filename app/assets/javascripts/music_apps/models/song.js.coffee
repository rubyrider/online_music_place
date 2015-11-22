window.MusicApp.factory 'model.song', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getSong: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Song]")

      Restangular.one('songs', id).get(_params)

  }
  object
]