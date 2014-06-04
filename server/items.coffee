Meteor.publish 'feed', ->
  Items.find({})

Meteor.methods
  addItem: (item) ->
    item.when = new Date
    Items.insert(item)
