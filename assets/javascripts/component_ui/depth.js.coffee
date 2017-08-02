@DepthUI = flight.component ->
  @attributes
    chart: '#depths'

  @refresh = (event, data) ->
    chart = @select('chart').highcharts()
    chart.series[0].setData data.bids.reverse(), false
    chart.series[1].setData data.asks, false
    chart.xAxis[0].setExtremes(data.low, data.high)
    chart.redraw()

  @initChart = (data) ->
    tooltipTemplate = JST["templates/depth_tooltip"]

    @select('chart').highcharts
      chart:
        margin: 12
        marginLeft: 2
        marginRight: 2
        height: 122
        backgroundColor: 'rgba(0,0,0,0)'

      title:
        text: ''

      credits:
        enabled: false

      legend:
        enabled: false

      rangeSelector:
        enabled: false

      xAxis:
        lineColor: '#333'
        tickColor: '#333'
        labels:
          enabled: false

      yAxis:
        min: 0
        gridLineWidth: 0
        title:
          text: ''
        labels:
          enabled: false
        maxPadding: 0.002
        minPadding: 0.002

      tooltip:
        crosshairs: [{
            width: 0.5,
            dashStyle: 'solid',
            color: '#777'
        }, false],
        valueDecimals: 4
        borderWidth: 1
        backgroundColor: 'rgba(33,33,33,0)'
        borderRadius: 4
        shadow: false
        useHTML: true
        shared: true
        formatter: ->
          tooltipTemplate
            format: (v, fixed=4) -> Highcharts.numberFormat v, fixed
            point: @points[0]
        positioner: (width, height, point) ->
          if point.plotX < 260
            {x: 520 - width - 2, y: 2}
          else
            {x:2, y: 2}

      series : [{
        name : gon.i18n.bid
        type : 'area'
        fillColor: 'rgba(132, 247, 102, 0.35)'
        lineColor: 'rgba(132, 247, 102, 0.8)'
        color: 'transparent'
        animation:
          duration: 1000
      },{
        name: gon.i18n.ask
        type: 'area'
        animation:
          duration: 1000
        fillColor: 'rgba(255, 105, 57, 0.35)'
        lineColor: 'rgba(255, 105, 57, 0.8)'
        color: 'transparent'
      }]

  @after 'initialize', ->
    @initChart()
    @on document, 'market::depth::response', @refresh
    @on document, 'market::depth::fade_toggle', ->
      @$node.fadeToggle()

    @on @select('close'), 'click', =>
      @trigger 'market::depth::fade_toggle'
