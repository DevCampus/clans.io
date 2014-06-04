Template.layout.rendered = (function () {
  max = $('body').hasClass('mobile') ? 266 : 212;
  if(typeof(snapper) === 'undefined') {
    snapper = new Snap({
      element: $('.snap-content').get(0),
      hyperextensible: false,
      maxPosition: max,
      disable: 'right'
    });
  } else {
    snapper.settings({
      element: $('.snap-content').get(0)
    });
  }
});

Template.layout.events({
  'click #drawer-toggle': function (e, tmpl) {
    e.preventDefault();
    if( snapper.state().state=="left" ){
      snapper.close('left');
    } else {
      snapper.open('left');
    }
  }
});
