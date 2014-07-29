Session.set "qk", null

editor = new ReactiveAce
editor.theme = "monokai"
editor.syntaxMode = "javascript"
Template.main.rendered = ->
	editor.attach "editor"
	Deps.autorun ->
		if !Session.get("qk")?
			qks.insert { _id: new Meteor.Collection.ObjectID(), text: editor.value }, (aww, yeah) -> Session.set "qk", qks.findOne(yeah) unless error?
		else
			qks.update Session.get("qk")._id, $set: { text: editor.value }

Template.bottomBar.rendered = -> $(".logo").click -> window.open "http://twitter.com/lieuweR", "_blank"

Deps.autorun -> Session.set "qk", if Session.get("qk")? then qks.findOne(Session.get("qk")._id) else null

Template.bottomBar.hasUrl = -> Session.get("qk")?
Template.bottomBar.url = -> Router.routes['qkShow'].path _id: Session.get("qk")?._id._str
Template.bottomBar.isPhone = -> window.matchMedia("only screen and (max-width: 760px)").matches