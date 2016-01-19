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
            }
		});
				
	},
    record_click: function(p)
    {
        App.DB.post('sapei://contact_client',p.up('window'),function(e) {
            console.log(e);
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
