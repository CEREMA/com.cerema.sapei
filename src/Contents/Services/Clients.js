
Clients = {
	getServices: function(o,cb) {
		var db=Clients.using('db');
		db.model('sapei','SELECT Id_client_rattache,Lib_client_rattache FROM client_rattache WHERE Id_client_origine='+o.Id_client_origine+' and Id_client_rattache in (SELECT Id_client_rattache FROM contact_client WHERE type_client=1) ORDER BY Lib_client_rattache',cb);
	},
	getContacts: function(o,cb) {
		var db=Clients.using('db');
        console.log('SELECT * FROM contact_client WHERE Id_client_rattache in (SELECT Id_client_rattache FROM client_rattache WHERE Id_client_origine='+o.Id_client_origine+')');
		db.model('sapei','SELECT * FROM contact_client WHERE type_client=2 and Id_client_rattache in (SELECT Id_client_rattache FROM client_rattache WHERE Id_client_origine='+o.Id_client_origine+')',cb);
	}
    
}

module.exports = Clients;
