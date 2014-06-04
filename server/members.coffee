Meteor.publish 'members', ->
  Meteor.users.find {},
    fields:
      emails: 1
      profile: 1
      username: 1
      createdAt: 1

Meteor.publish "userData", () ->
  Meteor.users.find
    _id: @userId
  ,
    fields:
      services: 1
