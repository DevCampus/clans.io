Bulletins = new Meteor.Collection('bulletins');

if (Meteor.isClient) {
  Template.bulletins.helpers({
    bulletins: function() {
      return Bulletins.find({});
    },
    email: function() {
      var user = Meteor.users.findOne({_id: this.userId});
      if (user && user.emails) {
        return user.emails[0].address;
      } else {
        return 'Unknown';
      }
    }
  });

  Template.addBulletin.events({
    'submit form': function(evnt, tmpl) {
      evnt.preventDefault();
      if(Meteor.userId()) {
        var el = $(tmpl.find('input[name="bulletin"]'));
        Meteor.call('addBulletin', {
          body: el.val()
        });
        el.val('');
      } else {
        alert('Please login first');
      }
    }
  });
}

if (Meteor.isServer) {
}

Meteor.methods({
  addBulletin: function(data) {
    data = data || {};
    if (this.userId) {
      data.userId = this.userId;
      data.when = new Date;
      Bulletins.insert(data);
    }
  }
});
