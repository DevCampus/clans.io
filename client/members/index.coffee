Template.members.helpers
  fullName: -> "#{@profile.firstName} #{@profile.lastName}"

  subhead: ->
    if @profile.organization && @profile.location
      [@profile.organization, @profile.location].join(' - ')
    else
      if @profile.organization
        return @profile.organization
      if @profile.location
        return @profile.location

  email: -> @emails[0].address if @emails?

  avatar: ->
    if @emails?
      Gravatar.imageUrl(@emails[0].address) + '?s=300'
    else
      "http://placehold.it/300x300"
