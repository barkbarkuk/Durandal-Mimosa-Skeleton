exports.config =
  minMimosaVersion:'2.0.0'

  modules: [
    'server'
    'require'
    'minify-js'
    'minify-css'
    'live-reload'
    'combine'
    'requirebuild-include'
    'requirebuild-textplugin-include'
    'bower'
    'csslint'
    'jshint'
    'web-package'
    'copy'
  ]

  watch:
    javascriptDir: 'javascripts/app'

  requireBuildTextPluginInclude:
    pluginPath: 'text'
    extensions: ['html']

  requireBuildInclude:
    folder:"javascripts"
    patterns: ['app/**/*.js', 'vendor/durandal/**/*.js']

  bower:
# Uncomment below to see files brought in by bower for adjusting copy.mainOverrides
#    bowerDir:
#        path:".mimosa/bower_components"
#        clean:false
    copy:
      mainOverrides:
        "knockout.js":["knockout.js","knockout.debug.js"]
        "font-awesome": [
          { "fonts": "../../fonts" }
          "css/font-awesome.css"
        ]
        "jquery": [ "jquery.js" ]
        "bootstrap": [
           "dist/js/bootstrap.js"
           "dist/css/bootstrap.css"
           { "dist/css/bootstrap.css.map": "../../stylesheets/bootstrap.css.map" }
           { "dist/fonts": "../../fonts" }
        ]
        "durandal": [
          {
            img: "../../images"
            js: "durandal"
            css: "durandal"
          }
        ]
        "almond-custom": [
          {
            "almond.js": "almond-custom.js"
          }
        ]

  combine:
    folders: [
      {
        folder:'stylesheets'
        output:'stylesheets/styles.css'
        order: [
          'vendor/bootstrap/bootstrap.css'
          'vendor/font-awesome/font-awesome.css'
          'vendor/durandal/durandal.css'
          'starterkit.css'
        ]
      }
    ]

  server:
    path: "server.js"
    views:
      compileWith: 'handlebars'
      extension: 'hbs'

  require:
    optimize:
      overrides:
        name: '../vendor/almond-custom'
        inlineText: true
        stubModules: ['text']
        pragmas:
          build: true
