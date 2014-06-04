Accounts.onCreateUser(function (options, user) {
  user.profile = options.profile || {};
  return user;
});

Meteor.users.allow({
  remove: function (userId, doc) {
    return true;
  }
});
