#= require jquery
#= require clipboard.min
#= require active_admin/base

$(document).ready(function() {
  $('.reply_key').click(function (){
    $('#reply_content').val($('#reply_content').val() + $(this).attr("value"));
  })

  $("tr.clip > td").append("<button class='btn'><img class='clippy' src='/clip.png' width='13' alt='Copy to clipboard'></button");
  
  new Clipboard('.btn', {
    text: function(trigger) {
      $(trigger).parent().parent().addClass('bold')
      return $(trigger).parent().text()
    }
  });
})
