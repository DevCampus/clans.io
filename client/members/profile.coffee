# Template.profile.rendered = ->
#   $('#bio').keydown( (event) ->
#     if event.keyCode == 13
#       $('#bio').blur()
#   )

Template.profile.helpers
  email:         -> @emails[0].address if @emails?
  firstName:     -> @profile.firstName
  lastName:      -> @profile.lastName
  organization:  -> @profile.organization
  location:      -> @profile.location
  bio:           -> @profile.bio
  url:           -> @profile.url
  googlePlusUrl: -> @profile.googlePlusUrl
  twitterHandle: -> @profile.twitterHandle

Template.profile.events
  'click .done': ->
    if @profile.firstName
      Router.go('/')
    else
      $('.errors').text('First name is required.')

  'change #email': (event) ->
    Meteor.call('changeEmail', @_id, $(event.target).val())

  'change #firstName': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.firstName': $(event.target).val()

  'change #lastName': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.lastName': $(event.target).val()

  'change #organization': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.organization': $(event.target).val()

  'change #location': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.location': $(event.target).val()

  'change #bio': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.bio': $(event.target).val()

  'change #url': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update @_id,
      $set:
        'profile.url': url

  'change #googlePlusUrl': (event) ->
    url = $(event.target).val()
    if not url.match(/^http/) and not url.match(/^https/) and url isnt ''
      url = 'http://' + url
    Meteor.users.update @_id,
      $set:
        'profile.googlePlusUrl': url

  'change #twitterHandle': (event) ->
    Meteor.users.update @_id,
      $set:
        'profile.twitterHandle': $(event.target).val()
