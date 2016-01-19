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
                itemclick: "grid_click",
                itemcontextmenu: "grid_context"
            }
		});
				
	},
    grid_context: function(view, rec, node, index, e) {
		e.stopEvent();
        var me=this;
		var x=Ext.create('Ext.menu.Menu',{
			items: [
				{
					itemId: 'ctx-grid-delete',
					text: "Supprimer"
				}				
			]
		});
		x.on('click',function(z,p) {
			if (p.itemId=="ctx-grid-delete") {
                App.DB.del('sapei://contact_client?Id_contact_client?Id_contact_client='+rec.data.Id_contact_client,function(e,r) {
                    App.get('VCarnet grid').getStore().load(); 
                });
            }
        });
		x.showAt(e.getXY());
		return false;        
    },
    grid_click: function(p,rec)
    {
        var id=rec.data.Id_contact_client;
        App.reset(p.up('window'));
        App.DB.get('sapei://contact_client?Id_contact_client='+id,p.up('window'),function(r){
            var id=r.data[0].Id_client_rattache;
            App.get('VCarnet combo#service').getStore().getProxy().extraParams.Id_client_rattache=id;
            App.get('VCarnet combo#service').getStore().load();
            App.DB.get('sapei://client_rattache{Id_client_origine}?Id_client_rattache='+App.get('VCarnet combo#service').getValue(),function(e,r) {                
                App.get('VCarnet combo#client').setValue(r.result.data[0].Id_client_origine);
            });            
        });
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
        App.get('VCarnet combo#service').setValue('');
        delete(App.get('VCarnet combo#service').getStore().getProxy().extraParams.Id_client_rattache);
        App.get('VCarnet combo#service').getStore().getProxy().extraParams.Id_client_origine=p.getValue();
        App.get('VCarnet combo#service').getStore().load();
    }
	
});
