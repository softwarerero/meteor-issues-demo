if Meteor.isClient
  Meteor.loginWithPassword 'test@test', 'test'

  Router.configure
    layoutTemplate: 'layout'

  Router.map ->
    @route "home",
      path: "/"
      
  Handlebars.registerHelper "email", (val) ->
    Meteor.user()?.emails[0]?.address || "-"


if Meteor.isServer
  Meteor.startup () ->
    count = Meteor.users.find({}).count()
    if !count
      console.log("create user")
      id = Accounts.createUser
        email: 'test@test'
        password: "test"
