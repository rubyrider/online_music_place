window.MusicApp.factory 'model.content', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getHomePageContents: () ->
      _params = {page: @page}
      Logging.info("[Models::Content]")

      Restangular.all('albums').getList(_params)
  }
  object
]