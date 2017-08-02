@EmojiUI = flight.component ->
  @attributes
    'emoji-list': '.emoji-list'
    'chatbox'   : '#chat-textarea'
    'img'       : '.emoji-list img'

  @after 'initialize', ->
    twemoji.parse @select('emoji-list')[0], (icon, options, variant) ->
      return '/emoji/' + icon + '.png'

    @select('img').click (e) =>
      str = e.currentTarget.alt
      @select('chatbox').append(twemoji.parse(str))
      @placeCaretAtEnd @select('chatbox')[0]

  @placeCaretAtEnd = (el) ->
    el.focus()
    if typeof window.getSelection != "undefined" && 
       typeof document.createRange != "undefined"
      range = document.createRange()
      range.selectNodeContents(el)
      range.collapse(false)
      sel = window.getSelection()
      sel.removeAllRanges()
      sel.addRange(range)
    else if typeof document.body.createTextRange != "undefined"
      textRange = document.body.createTextRange()
      textRange.moveToElementText(el)
      textRange.collapse(false)
      textRange.select()