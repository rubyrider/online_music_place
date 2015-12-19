window.MusicApp.factory 'model.profile', [ 'Restangular', 'utils.logging', 'DateUtils', (Restangular, Logging, DateUtils) ->

  object =
  {
    page: 1
    page_info: {}

    getPageInfo: -> @page_info

    initialDuration: 31

    getAlProfiles: ->
      _params = {page: @page}
      Restangular.all('users').getList(_params)

    getProfile: (id) ->
      _params = {page: @page}
      Logging.info("Loading [Models::Artist]")

      Restangular.one('users', id).get(_params)
  }
  object
]