jQuery -> 
  $('form.new_comment').hide()

  $('body').on('click', 'a.js-comment', (event)->
    console.log($(event.target))
    $(event.target).next('form').slideToggle('slow')
    
	

  )
