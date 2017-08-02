#= require es5-shim.min
#= require es5-sham.min
#= require jquery
#= require jquery_ujs
#= require jquery-ui.min
#= require jquery.mousewheel
#= require jquery-timing.min
#= require jquery.nicescroll.min
#= require keymaster
#= require autolink.min
#= require twemoji.min
#
#= require bootstrap
#= require bootstrap-switch.min
#
#= require moment
#= require bignumber
#= require underscore
#= require cookies.min
#= require flight.min
#= require pusher.min
#= require phoenix

#= require ./lib/sfx
#= require ./lib/notifier
#= require ./lib/pusher_connection

#= require highstock
#= require_tree ./highcharts/

#= require_tree ./helpers
#= require_tree ./component_mixin
#= require_tree ./component_data
#= require_tree ./component_ui
#= require_tree ./templates

#= require_self

$ ->
  window.notifier = new Notifier()

  BigNumber.config(ERRORS: false)

  HeaderUI.attachTo('header')
  AccountSummaryUI.attachTo('#account_summary')

  FloatUI.attachTo('.float')
  KeyBindUI.attachTo(document)
  AutoWindowUI.attachTo(window)

  PlaceOrderUI.attachTo('#bid_entry')
  PlaceOrderUI.attachTo('#ask_entry')
  OrderBookUI.attachTo('#order_book')
  DepthUI.attachTo('#depths_wrapper')

  MyOrdersUI.attachTo('#my_orders')
  MarketTickerUI.attachTo('#ticker')
  MarketSwitchUI.attachTo('#market_list')
  MarketTradesUI.attachTo('#market_trades')

  MarketData.attachTo(document)
  GlobalData.attachTo(document, {pusher: window.pusher})
  MemberData.attachTo(document, {pusher: window.pusher}) if gon.accounts

  $('.panel-body-content').niceScroll
    autohidemode: true
    cursorborder: "none"