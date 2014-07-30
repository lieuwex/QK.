Meteor.methods
	cleanUp: -> qks.remove { text: /(^\s+$)|(^$)/ }