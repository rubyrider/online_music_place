window.MusicApp.factory 'model.content', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getLatestSongs: (query) ->
      _params = {page: @page}

      if typeof(query) == "string"
        _.extend _params, {q: query}

      Logging.info("Loading [Models::Content]")

      Restangular.all('songs').getList(_params)

    getHomePageContents: (query) ->
      _params = {page: @page}

      if typeof(query) == "string"
        _.extend _params, {q: query}

      Logging.info("Loading [Models::Content]")

      Restangular.all('albums').getList(_params)

    getMoodPlaylists: (query) ->
      _params = {page: @page, mood: true}

      if typeof(query) == "string"
        _.extend _params, {q: query}

      Logging.info("Loading [Models::Content]")

      Restangular.all('play_lists').getList(_params)

    getUserPlaylists: (query) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Content]")

      if typeof(query) == "string"
        _.extend _params, {q: query}

      Restangular.all('play_lists').getList(_params)
  }
  object
]