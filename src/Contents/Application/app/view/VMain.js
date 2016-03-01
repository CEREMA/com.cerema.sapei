App.view.define('VMain', {

    extend: 'Ext.Panel',
	alias : 'widget.mainform',
	border: false,
	
	layout: "border",
	
	items: [
		{
			region: 'north',
			height: 250,
			minHeight: 250,
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
							text: "Nouveau",
                            hidden: true
						},
						{
							itemId: "mnu_aff_close",
							text: "Fermer",
                            hidden: true
						}                        
					]
				},
                {
                    text: "Contacts",
                    menu: [
                        {
                            itemId: "mnu_contacts",
                            text: "Carnet d'adresses"
                        }
                    ]
                }
			],
            items: [
                {
                    html: "yes",
                    height: 450
                }
            ]
		},
		{
			region: "center",			
			split:true,
			layout: "fit",
            border: false,
			items: [
			{
				xtype: "TAffaire",
				hidden: true,
				flex: 1
			},
            {
                xtype: "tabpanel",
                itemId: "mainscreen",
                activeTab: 0,
                items: [
                {
                    xtype: "VOpenAffaire",
                    border: false,
                    title: "Affaires"
                },                    
                {
                    xtype: "VSchedulerMain",
                    title: "Planification",
                    hidden: false,
                    bbar: [
                        '->',
                        {
                            xtype: "panel",
                            border: false,
                            height: 35,
                            html: '<table><tr><td><div style="background-color:yellow;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Etudes</td><td><div style="background-color:orange;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Mesures</td><td><div style="background-color:red;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Traitement</td></tr></table>',
                            bodyStyle: "background-color:transparent",
                            itemId: "Legendes"
                        }
                    ],                            
                    flex: 1                
                }
                ]
            },
			]
		}
	]
	
});
