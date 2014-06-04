Router.configure
  # autoRender: false
  layoutTemplate: 'layout'
  after: -> snapper?.close('left')

Router.map ->
  @route 'dashboard',
    path: '/'
    template: 'dashboard'

  @route 'feed',
    path: '/feed'
    template: 'empty'
    layoutTemplate: 'feedLayout'
    data: ->
      class: 'list'

  @route 'showItem',
    path: '/items/:_id'
    template: 'item'
    layoutTemplate: 'feedLayout'
    yieldTemplates:
      'item': { to: 'details' }
    data: ->
      class: 'detail'
      item: => Items.findOne({_id: @params._id})

  @route 'members',
    data:
      members: Meteor.users.find({})

  @route 'showMember',
    path: '/members/:_id'
    template: 'members'
    data: ->
      members: Meteor.users.find({})
      member: =>
        Meteor.users.findOne({_id: @params._id})
    action: ->
      @render()

  @route 'profile',
    data: -> Meteor.user()
