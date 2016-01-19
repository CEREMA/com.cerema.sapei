App.controller.define('CCarnet', {

	views: [
        "VCarnet"
	],
	
	models: [
	],
	
	init: function()
	{

		this.control({
            "VCarnet combo#client": {
                select: "client_select"    
            },
            "VCarnet button#record": {
                click: "record_click"   
            },
            "VCarnet grid": {
                itemclick: "grid_click"   
            }
		});
				
	},
    grid_click: function(p,rec)
    {
        console.log(rec);
    },
    record_click: function(p)
    {
        App.DB.post('sapei://contact_client',p.up('window'),function(e) {
            if (e.errno) {
                alert("La fiche ne s'est pas enregistrée.");
                return;  
            };
            App.reset(p.up('window'));
            App.get('VCarnet grid').getStore().load();
        });
    },
    client_select: function(p)
    {
        App.get('VCarnet combo#service').getStore().getProxy().extraParams.Id_client_origine=p.getValue();
        App.get('VCarnet combo#service').getStore().load();
    }
	
});
