window.MusicApp.factory 'utils.logging', [
  ->
    {
      debug:  (msg)             -> @isEnabled() && console.debug  @buildMessage('debug', msg)
      info:   (msg)             -> @isEnabled() && console.info   @buildMessage('info', msg)
      warn:   (msg)             -> @isEnabled() && console.warn   @buildMessage('warn', msg)
      error:  (msg)             -> @isEnabled() && console.error  @buildMessage('error', msg)

      isEnabled:                -> typeof(console) != 'undefined'
      buildMessage: (type, msg) -> if typeof(msg) == 'object' then msg else "[MessagingApp] #{type.toUpperCase()} - #{msg}"
    }
]