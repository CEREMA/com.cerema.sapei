App.view.define('VMain', {

    extend: 'Ext.Panel',
	alias : 'widget.mainform',
	border: false,
	
	layout: "border",
	
	items: [
		{
			region: 'north',
			height: 25,
			minHeight: 25,
			border:false,
			baseCls: 'cls-header',
			xtype: "Menu",
			itemId: "MenuPanel",
			menu: [
				{
					text: "Affaires",
					menu: [
						{
							itemId: "mnu_aff_new",
							text: "Nouveau"
						},
						{
							itemId: "mnu_aff_open",
							text: "Ouvrir"
						},
						{
							itemId: "mnu_aff_close",
							text: "Fermer",
                            hidden: true
						}                        
					]
				}
			]		
		},
		{
			region: "center",			
			split:true,
			layout: "fit",
            border: false,
			bbar: [
				'->',
				{
					xtype: "panel",
					border: false,
					height: 35,
					html: '<table><tr><td><div style="background-color:yellow;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Option</td><td><div style="background-color:orange;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Pré-réservation</td><td><div style="background-color:green;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Réservation</td><td><div style="background-color:red;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Maintenance</td></tr></table>',
					bodyStyle: "background-color:transparent",
					itemId: "Legendes"
				}
			],            
			items: [
			{
				xtype: "TAffaire",
				hidden: true,
				flex: 1
			},
            {
				xtype: "VSchedulerMain",
				hidden: false,
				flex: 1                
            }
			]
		}
	]
	
});
