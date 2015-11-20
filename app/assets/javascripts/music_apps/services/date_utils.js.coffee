window.MusicApp.factory 'DateUtils', [
  'utils.logging', (Logging) ->
    {
      caches: {},

      dateToday: ->
        date = new Date()
        @getDateFormat(date)

      dateYesterday: ->
        @getDateAgo(1)

      getDateAgo: (days)->
        _days = parseInt(days)
        date = new Date();
        date.setDate(date.getDate() - _days)
        @getDateFormat(date)

      getDateFormat: (date) ->
        date.getDate() + '-' + (parseInt(date.getMonth())+1) + '-' + date.getFullYear();

      defaultDateFormat: (dateStr)->
        date = new Date(dateStr)
        date.getFullYear() + '-' + (parseInt(date.getMonth())+1) + '-' + date.getDate();

      getMonthName: ->
        month = []
        month[0] = "January";
        month[1] = "February";
        month[2] = "March";
        month[3] = "April";
        month[4] = "May";
        month[5] = "June";
        month[6] = "July";
        month[7] = "August";
        month[8] = "September";
        month[9] = "October";
        month[10] = "November";
        month[11] = "December";
        month
    }

]