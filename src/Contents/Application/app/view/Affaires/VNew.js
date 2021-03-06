App.view.define('Affaires.VNew', {
    extend: "Ext.window.Window",
    alias: 'widget.AffairesVNew',
    initComponent: function() {
        this.width = 800;
        this.height = 500;
		
		this.bodyStyle="background-color:white";
		
		this.title = "Nouvelle affaire";

        this.layout = {
            type: 'vbox'
        };

        this.bbar = [
		'->',
		{
			xtype: "button",
			text: "Annuler",
			handler: function(me) {
				me.up('window').close();
			}
		},
		{
			xtype: "button",
			text: "Enregistrer",
			itemId: "VNewPost"
		}
        ];

        this.tbar = [
		{
			text: "Axe",
			itemId: "newAxeBtn",
			iconCls: "plus"
		},
        '->',
        {
            xtype: "button",
            itemId: "adrbook",
            text: "Carnet d'adresses",
            iconCls: "adr"
        }            
        ];
		
        this.defaults = {
            split: true
        };

        this.items = [
		{
			xtype: "textfield",
			itemId: "whoami",
			bind: "Id_pilote_job",
			value: "",
			hidden: true
		},
		{
			layout: "hbox",
			padding: 10,
			width: "100%",
			border: false,
			bodyStyle: "background-color:transparent",
			items: [
			{
				xtype: "textfield",
				fieldLabel: "Intitulé de l'affaire",
				labelAlign: "top",
				flex: 1,
				bind: "Intitule_job",
				allowBlank: false
			},
			{
				xtype: "textfield",
				fieldLabel: "Numéro SIGMA",
				labelAlign: "top",
				width: 150,
				margin: {
					left: 5
				},
				bind: "Num_SIGMA_job",
				allowBlank: false
			}			
			]
		},
		{
			layout: "hbox",
			padding: 10,
			width: "100%",
			border: false,
			bodyStyle: "background-color:transparent",
			items: [
			{
				xtype: "combo",
				fieldLabel: "Nature de la prestation",
				labelAlign: "top",
				bind: "Id_type_prestation",
				width: 350,
				store: App.store.create('sapei://type_prestation',{
					autoLoad: true
				}),
				editable:false,
				valueField: 'Id_type_prestation',
				displayField: 'Libelle_type_prestation',
				allowBlank: false
			},
			{
				xtype: "combo",
				fieldLabel: "Clients",
				labelAlign: "top",
				flex: 1,
				margin: {
					left: 5
				},
				store: App.store.create('sapei://client_origine',{
					autoLoad: true
				}),
				displayField: 'Lib_client_origine',
				valueField: 'Id_client_origine',
				bind: "Id_contact_client",
				editable: false,
				allowBlank: false
			}
			]
		},
		{
			layout: "hbox",
			width: "100%",
			padding: 10,
			border: false,
			bodyStyle: "background-color:transparent",
			items: [
			{
				xtype: "datefield",
				fieldLabel: "Prise d'affaire",
				labelAlign: "top",
				bind: "Date_prise_job",
				allowBlank: false
			},
			{
				xtype: "datefield",
				fieldLabel: "Remise du livrable",
				labelAlign: "top",
				margin: {
					left: 5
				},
				bind: "Date_livrable_job"
			},
			{
				xtype: "combo",
				itemId: "cbo_dpt",
				fieldLabel: "Département concerné",
				labelAlign: "top",
				flex: 1,
				margin: {
					left: 5
				},
				store: App.store.create('sapei://dpt{IdDepartement,Num_dpt+" - "+Lib_dpt=Lib_dpt}',{
					autoLoad: true
				}),
				valueField: 'IdDepartement',
                editable: false,
                bind: "Id_dpt",
				displayField: 'Lib_dpt',
				queryMode: 'local',
				allowBlank: false				
			},
			{
				xtype: "combo",
				itemId: "cbo_axe",
				fieldLabel: "Axe",
                editable: false,
				labelAlign: "top",
				width: 100,
				margin: {
					left: 5
				},
				store: App.store.create('sapei://axe{Id_axe,Axe+}',{autoLoad: true}),
				valueField: 'Id_axe',
				displayField: 'Axe',
				bind: "Id_axe",
				queryMode: 'local',
				allowBlank: false
			}			
			]
		},
		{
			xtype: "textarea",
			fieldLabel: "Nature de la tâche demandée",
			bind: "Nature_job",
			labelAlign: "top",
			width: "100%",
			flex: 1,
			padding: 10
		}
		];

        this.callParent();
    }
});