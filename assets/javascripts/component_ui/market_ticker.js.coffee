window.MarketTickerUI = flight.component ->
  @attributes
    lastSelector: '.last'
    lastEstimateSelector: '.last-estimate'

  @updatePrice = (selector, price, trend) ->
    selector.removeClass('text-up').removeClass('text-down').addClass(formatter.trend(trend))
    selector.html(formatter.fixBid(price))

  @refresh = (event, ticker) ->
    @updatePrice @select('lastSelector'), ticker.last, ticker.last_trend

    last = new BigNumber(ticker.last)

    $(@select('lastEstimateSelector')).each ->
      coefficient = new BigNumber($(@).data('coefficient'))
      $(@).html("≈ <i class='fa fa-#{$(@).data('icon')}'></i>#{coefficient.times(last).round($(@).data('precision')).toString()}")

  @after 'initialize', ->
    BigNumber.config({ EXPONENTIAL_AT: -16 })
    @on document, 'market::ticker', @refresh
