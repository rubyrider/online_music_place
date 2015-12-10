window.MusicApp.factory 'model.artist', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getAllArtist: ->
      _params = {page: @page}
      Restangular.all('artists').getList(_params)

    getArtist: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Artist]")

      Restangular.one('artists', id).get(_params)
  }
  object
]