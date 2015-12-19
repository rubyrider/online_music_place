window.MusicApp.factory 'model.search', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getLatestSongs: (query) ->
      _params = {page: @page, query: query}
      Logging.info("Loading [Models::Content]")

      Restangular.all('search').get(_params)

    getHomePageContents: (query) ->
      _params = {page: @page, query: query}
      Logging.info("Loading [Models::Search]")

      Restangular.all('search').get(_params)

    getUserPlaylists: (query) ->
      _params = {page: @page, query: query}
      Logging.info("Loading [Models::Search]")

      Restangular.all('search').get(_params)
  }
  object
]