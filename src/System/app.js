App = {
	init: function(app,server) {
		app.use('/tmp',server.static(__dirname + require('path').sep+'0'));		
	}
};

module.exports = App;