Router.configure onBeforeAction: -> Meteor.call "cleanUp"

Router.map ->
	@route "main",
		path: "/"

	@route "qkShow",
		path: "/:_id"
		template: "view"

		data: -> qks.findOne new Meteor.Collection.ObjectID @params._id