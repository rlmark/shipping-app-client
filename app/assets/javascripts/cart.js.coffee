$ ->
  $(".checkout").click (e) ->
    e.preventDefault()
    $(this).fadeOut()
    $(".new-address").slideDown()
