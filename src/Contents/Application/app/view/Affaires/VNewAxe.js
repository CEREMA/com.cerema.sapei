App.view.define('Affaires.VNewAxe', {
    extend: "Ext.window.Window",
    alias: 'widget.AffairesVNewAxe',
    initComponent: function() {
        this.width = 350;
        this.height = 350;

        this.layout = {
            type: 'vbox'
        };

        this.bbar = [
		'->',
		{
			xtype: "button",
			itemId: "ctxClose",
			text: "Fermer"
		}
        ];
		
        this.defaults = {
            split: true
        };
		this. bodyStyle="background-color:white",	
        this.items = [
		{
			layout: "hbox",
			padding: 10,
			border: false,
			width: "100%",
			bodyStyle: "background-color:transparent",			
			items: [
			{
				xtype: "textfield",
                itemId: "axe",
				fieldLabel: "Axe",
				labelAlign: "top",
                hidden: false,
				bind: "Axe",
				width: 80,
				margin: {
					left: 5
				},
				bind: "Axe"
			},
			{
				xtype: "combo",
                itemId: "cbo_axe",
				fieldLabel: "Type",
				labelAlign: "top",
				bind: "Id_Type_Axe",
                selectable: false,
				store: App.store.create('sapei://type_axe',{autoLoad: true}),
				displayField: "Lib_type_axe",
				valueField: "Id_type_axe",
				margin: {
					left: 5
				},
				editable:false,
				width: 80
			}
			]
		},
		{
			layout: "hbox",
			padding: 10,
			border: false,
			width: "100%",
			bodyStyle: "background-color:transparent",
			items: [
			{
				flex: 1,
				border: false
			},
			{
				xtype: "button",
				itemId: "btn_add",
				text: "Ajouter",
				width: 100
			}
			]
		},
		{
			xtype: "grid",
			itemId: "gAxe",
			padding: 10,
			border: true,
			width: "100%",
			flex: 1,
			bodyStyle: "background-color:transparent",
			columns: [
			{
				text: "Axe",
				dataIndex: "Axe"
			},
			{
				text: "Type Axe",
				dataIndex: "Lib_type_axe"
			}
			],			
			store: App.store.create("sapei://axe{Id_axe,Axe,type_axe.Lib_type_axe}",{autoLoad: true})
		}
		];
		
		this.title = "Nouveau axe";

        this.callParent();
    }
});