Meteor.startup(function () {
  FastClick.attach(document.body);

  App = {
    subs: {
      feed: Meteor.subscribe('feed'),
      members: Meteor.subscribe('members'),
      userData: Meteor.subscribe('userData')
    }
  }

  enquire.register("screen and (max-width:768px)", {
      match: function() {
        $('body').addClass('mobile');
        snapper.settings({maxPosition: 266});
        snapper.close();
      },

      unmatch: function() {
        $('body').removeClass('mobile');
        snapper.settings({maxPosition: 206});
      }
  })
  .register("screen and (min-width:769px) and (max-width:998px)", {
      match: function() {
        $('body').addClass('tablet');
      },

      unmatch: function() {
        $('body').removeClass('tablet');
      }
  })
  .register("screen and (min-width:999px)", {
      match: function() {
        $('body').addClass('computer');
      },

      unmatch: function() {
        $('body').removeClass('computer');
      }
  })
  .register("screen and (orientation:portrait)", {
      match: function() {
        $('body').addClass('portrait');
      },

      unmatch: function() {
        $('body').removeClass('portrait')
        .scrollLeft(0);
        console.log('leaving portrait')
      }
  })
  .register("screen and (orientation:landscape)", {
      match: function() {
        $('body').addClass('landscape');
      },

      unmatch: function() {
        $('body').removeClass('landscape')
        .scrollLeft(0);
        console.log('leaving landscape')
      }
  });
});
