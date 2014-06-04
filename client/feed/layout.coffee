Template.feedLayout.helpers
  items: ->
    Items.find {},
      sort: { when: -1 }
