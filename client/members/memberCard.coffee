Template.memberCard.helpers
  name: ->
    if @profile.firstName && @profile.lastName
      "#{@profile.firstName} #{@profile.lastName}"
    else
      "The Nameless"

  subhead: ->
    if @profile.organization && @profile.location
      [@profile.organization, @profile.location].join(' - ')
    else
      if @profile.organization
        return @profile.organization
      if @profile.location
        return @profile.location

  email: ->
    if @emails
      @emails[0].address

  avatar: ->
    if @emails?
      Gravatar.imageUrl(@emails[0].address) + '?s=300'
    else
      "http://placehold.it/300x300"

  bio: -> @profile.bio
  url: -> @profile.url
  googlePlusUrl: -> @profile.googlePlusUrl
  twitterHandle: -> @profile.twitterHandle

