App.controller.define('CMain', {

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
            }
		});
				
	},
    client_select: function(p)
    {
        App.get('VCarnet combo#service').getStore().getProxy().extraParams.Id_client_origine=p.getValue();
        App.get('VCarnet combo#service').getStore().load();
    }
	
});
