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
						}
					]
				}
			]		
		},
		{
			region: "center",			
			split:true,
			layout: "fit",
			items: [
			{
				xtype: "TAffaire",
				hidden: "true",
				flex: 1
			},
            {
				xtype: "VSchedulerMain",
				hidden: "false",
				flex: 1                
            }
			]
		}
	]
	
});
