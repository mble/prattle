class App.Posts
  constructor:  ->
    @content = $('.posts-form #post_content')
    @counter = $('.posts-form .content-count')
    @submitButton = $('.posts-form [name="commit"]')

  init: ->
    @bindLengthCheck()
    @setContentLengthCount()

  bindLengthCheck: ->
    @content.on 'keyup', =>
      @setContentLengthCount()

  setContentLengthCount: ->
    contentLength = 150 - @content.val().length
    @counter.html "#{contentLength}" + @setLengthWarning(contentLength)
    @decorateForm contentLength

  setLengthWarning: (contentLength) ->
    return switch
      when contentLength == 150 then " Can't post without content"
      when contentLength < 0 then ' Too many characters'
      else ''

  decorateForm: (contentLength) ->
    klass = switch
      when contentLength == 150 || contentLength <= 5 then 'red-text'
      when contentLength > 5 && contentLength <= 30 then 'orange-text'
      else 'black-text'

    @counter.removeClass('red-text orange-text black-text').addClass klass

$(document).on 'turbolinks:load', ->
  klass = new App.Posts
  klass.init()
