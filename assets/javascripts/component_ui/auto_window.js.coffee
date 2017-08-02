GUTTER = 2 # linkage to market.css.scss $gutter var
PANEL_TABLE_HEADER_HIGH = 37
PANEL_PADDING = 8
BORDER_WIDTH = 1

@AutoWindowUI = flight.component ->
  @after 'initialize', ->
    gutter   = GUTTER
    gutter2x = GUTTER * 2
    gutter3x = GUTTER * 3
    gutter4x = GUTTER * 4
    gutter5x = GUTTER * 5
    gutter6x = GUTTER * 6
    gutter7x = GUTTER * 7
    gutter8x = GUTTER * 8
    gutter9x = GUTTER * 9

    border   = BORDER_WIDTH
    border2x = BORDER_WIDTH * 2

    padding   = PANEL_PADDING
    padding2x = PANEL_PADDING * 2

    panel_table_header_high = PANEL_TABLE_HEADER_HIGH

    @$node.resize ->
      navbar_h       = $('.navbar').height()
      markets_h      = $('#market_list').height()
      entry_h        = $('#ask_entry').height()
      depths_h       = $('#depths_wrapper').height()
      my_orders_h    = $('#my_orders').height()
      ticker_h       = $('#ticker').height()
      trades_h       = $('#market_trades').height()
      trades_w       = $('#market_trades').width()

      window_h     = $(@).height()
      window_w     = window.innerWidth

      order_book_w = $('#order_book').width()
      my_orders_w    = $('#my_orders').width()

      side_w         = order_book_w
      bottom_h       = trades_h

      $('.content').height(window_h - navbar_h - gutter)

      $('#candlestick').height(window_h - navbar_h - bottom_h - gutter4x)
      $('#candlestick').width(window_w - side_w - gutter4x)

      my_orders_w = window_w - (side_w + trades_w) - gutter6x
      $('#my_orders').width(my_orders_w)
      $('#my_orders .panel').width(my_orders_w)

      order_h = window_h - navbar_h - depths_h - entry_h - gutter8x
      $('#order_book').height(order_h)
      $('#order_book .panel-body-content').height(order_h - panel_table_header_high - padding2x)

      $(".hover-able").hover

      hoverIn = (e) ->
        $($(e.target).data('hover-target')).show()

      hoverOut = (e) ->
        $(@).hide()

      emptyFun = ->
        return;

      $(".hover-able").hover hoverIn, emptyFun
      $(".hover-target").hover emptyFun, hoverOut
      
    @$node.resize()
