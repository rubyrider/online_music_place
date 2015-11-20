window.MusicApp.factory 'utils.cache_manager', [
  'utils.logging', (Logging) ->
    {
      caches: {},

      get: (key) ->
        Logging.info("CacheManager - Retrieve from cache #{key}")
        @caches["#{key}"]

      set: (key, value) ->
        Logging.info("CacheManager - Set cache for #{key}")
        @caches["#{key}"] = value
    }
]