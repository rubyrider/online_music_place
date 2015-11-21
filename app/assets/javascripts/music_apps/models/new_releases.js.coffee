window.MusicApp.factory 'model.new_releases', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getNewReleases: () ->
      _params = {page: @page}
      Logging.info("Loading [Models::NewReleases]")

      Restangular.all('albums/new_releases').getList(_params)
  }
  object
]