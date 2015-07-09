class @BrowsingHistory
  constructor: ->
    @history = JSON.parse(localStorage.getItem('history')) || []

  get: ->
    excursionId = $('#excursion-data').data('id')
    list = $.grep(@history, (item) -> item['id'] != excursionId)
    list.slice(0,3)

  push: ->
    excursionData = $('#excursion-data').data()
    this.remove(excursionData['id'])
    @history.push(excursionData)
    this.save()

  remove: (id) ->
    @history = $.grep(@history, (item) -> parseInt(item['id']) != parseInt(id))
    this.save()

  save: ->
    localStorage.setItem('history', JSON.stringify(@history))


jQuery ->
  $(document).ready ->
    if location.pathname.indexOf('/excursions/') > -1
      (new BrowsingHistory()).push()
      initRemoveHistoryLink()
      drawHistoryLinks()

  initRemoveHistoryLink = ->
    $(document).on('click', '.remove-history-item', ->
      historyItem = $(this).attr('id')
      (new BrowsingHistory()).remove(historyItem)
      drawHistoryLinks()
      false
    )

  drawHistoryLinks = ->
    $('.nav-list').html('')

    browsingHistory = new BrowsingHistory()
    list = browsingHistory.get()

    $.each(list, (_, item) ->
      link = $("<a href=\"/excursions/#{item['id']}\">#{item['name']}</a>")
      span = $("<span id=\"#{item['id']}\" class=\"remove-history-item\"></span>")

      li = $('<li>').append(link.append(span))
      $('.nav-list').append(li)
    )
