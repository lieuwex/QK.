Router.configure
	onBeforeAction: -> Meteor.call "cleanUp"

Router.map ->
	@route "main",
		path: "/"

	@route "view",
		path: "/:_id"

		onBeforeAction: ->
			if !@data()?
				Router.go "fuck"
			Meteor.call "cleanUp"

		data: -> try qks.findOne new Meteor.Collection.ObjectID @params._id

	@route "fuck"