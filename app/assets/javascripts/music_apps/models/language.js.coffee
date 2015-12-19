window.MusicApp.factory 'model.language', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getLanguage: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Genre]")

      Restangular.one('languages', id).get(_params)
  }
  object
]