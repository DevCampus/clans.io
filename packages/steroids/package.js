Package.describe({
  summary: "Use AppGyver Steroids to package your meteor app for mobile devices."
});

Package.on_use(function (api) {
  api.export('Steroids');

  api.use(['underscore', 'coffeescript'],
          ['client','server']);

  api.add_files('steroids-load.coffee', 'client');
});
