/**
 * @class Ext.ux.grid.CustomSortPlugin
 * 
 * Allows you to specify a custom sort function in the grid's ColumnModel.
 * Especially useful for columns that use a renderer to display the
 * data differently from the underlying source data.
 * 
 * To use, add a <b>sortByFn</b> config option to the columns in the ColumnModel
 * you want to add custom sorting.  The function will be passed two records as parameters
 * and should return 1, -1 or 0, indicating the first record is comes before, after, or
 * in the same position as the second record. 
 * 
 * Example Usage:
 *<pre><code>// Create a grid where the employee id column displays as the
	// employee's full name (first mi last), but sorts on the last
	// name.
	 
	//renderer function to display name as First MI Last.
 	var EmployeeRenderer = function( val, meta, rec, row, col, store ) {
 		return rec.get( "first_name" ) + 
 			( rec.get( "middle_name" ) ? " " + rec.get( "middle_name" ).charAt(0) + "." : "" ) +
 			" " + rec.get( "last_name" );
	};
	
	//comparison function to determine what order two records should appear
	var EmployeeSortFn = function( rec1, rec2 ) {
		var name1 = rec1.get( "last_name" ).toUpperCase();
		var name2 = rec2.get( "last_name" ).toUpperCase();
		return name1 > name2 ? 1 : ( name1 < name2 ? -1 : 0 );
	};
	
	var grid = new Ext.grid.GridPanel( {
		store: new Ext.data.JsonStore({
			url: '/my/data/url',
			fields: [ "id", "first_name", "middle_name", "last_name" ]
		}),
		columns: [
			{header: "Employee", dataIndex: "id", renderer: EmployeeRenderer, sortByFn: EmployeeSortFn, sortable: true }
		],
		plugins: new Ext.ux.grid.CustomSortPlugin()
	} );
 </code></pre>
 */

Ext.namespace('Ext.ux.grid');

Ext.ux.grid.CustomSortPlugin = function(config) {
    Ext.apply(this, config);
}

Ext.ux.grid.CustomSortPlugin.prototype = {

    init: function(grid) {
        var store = grid.getStore();

        var plugin = this;

        if (typeof this.usePaging == "undefined") {
            this.usePaging = (typeof store.applyPaging == "function");
        }

        //override default sortData method with this one
        store.sortData = function(f, direction) {
            direction = direction || 'ASC';

            var cm = grid.getColumnModel();
            var colCfg = cm.getColumnsBy(function(cfg, ix) {
                return cfg.dataIndex === f
            })[0];

            var fn = Ext.emptyFn;

            if (colCfg && typeof colCfg.sortByFn == "function") {
                fn = colCfg.sortByFn
            }
            else {
                var st = this.fields.get(f).sortType;
                fn = function(r1, r2) {
                    var v1 = st(r1.data[f]),
                    v2 = st(r2.data[f]);
                    return v1 > v2 ? 1 : (v1 < v2 ? -1 : 0);
                };
            }

            if (plugin.usePaging && this.allData) {
                this.data = this.allData;
                delete this.allData;
            }

            this.data.sort(direction, fn);
            if (this.snapshot && this.snapshot != this.data) {
                this.snapshot.sort(direction, fn);
            }

            if (plugin.usePaging) this.applyPaging();

        }
    }
};

App.view.define('VAffaire', {

    extend: 'Ext.Panel',
	alias : 'widget.TAffaire',
	border: false,
	
	layout: "border",
	
	items: [
	{
		region: 'north',
		itemId: "Title",
		bodyStyle: "background-color: transparent",
		border: false,
		height: 50,
		minSize: 100,
		maxSize: 100,
		margins: '5 0 0 0'
	},
	{
		region: "center",
		itemId: "echanges",
		title: "Points d'échange avec les agents",
		border: false,		
		tools: [{ 
			type: "minimize",
			handler: function(e, toolEl, panel, tc){
				App.get('TAffaire panel#westpanel').show();
				App.get('TAffaire panel#eastpanel').show();
				App.get('TAffaire panel#centerpanel').show();
				App.get('TAffaire panel#southpanel').show();
				App.get('TAffaire panel#echanges').hide();			
			}
		}],
		hidden: true,
		layout: "vbox",
		tbar: [
			{
				itemId: "ecrire2",
				text: "Ecrire"
			}
		],
		items: [
		{			
			width: "100%",
			itemId: "timeline2",
			border: false,
			autoScroll: true,
			html: '<ul class="timeline"></ul>',
			flex: 1
		}
		]
	},
	{
		title: "Points d'échange avec les agents",		
		tools: [{ 
			type: "maximize",
			handler: function(e, toolEl, panel, tc){
				App.get('TAffaire panel#westpanel').hide();
				App.get('TAffaire panel#eastpanel').hide();
				App.get('TAffaire panel#centerpanel').hide();
				App.get('TAffaire panel#southpanel').hide();
				App.get('TAffaire panel#echanges').show();
			}
		}],
		region: 'south',
		itemId: "southpanel",
		border: false,
		collapsible: true,
		height: 195,
		layout: "vbox",
		tbar: [
			{
				itemId: "ecrire",
				text: "Ecrire"
			}
		],
		items: [
		{			
			width: "100%",
			itemId: "timeline",
			border: false,
			autoScroll: true,
			html: '<ul class="timeline"></ul>',
			flex: 1
		}
		]
	},
	{
		region:'west',
		margins: '5 0 0 0',
		cmargins: '5 5 0 0',
		width: 330,
		minSize: 100,
		maxSize: 330,
		layout: "vbox",
		itemId: "westpanel",
		items: [
		{
            xtype: "textfield",
            fieldLabel: "Numéro SIGMA",
            labelAlign: "top",
            padding: 4,
            bind: "Num_SIGMA_job",
            allowBlank: false
        },            
		{
			width: "100%",
			layout: "hbox",
			padding: 4,
			border: false,
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
				flex: 1,
				bind: "Date_livrable_job",
				allowBlank: false
			}
			]
		},
		{
			xtype: "combo",
			padding: 4,
			fieldLabel: "Nature de la prestation",
			labelAlign: "top",
			bind: "Id_type_prestation",
			width: "100%",
			store: App.store.create('sapei://type_prestation',{
				autoLoad: true
			}),
			editable:false,
			valueField: 'Id_type_prestation',
			displayField: 'Libelle_type_prestation',
			allowBlank: false
		},
		{
			xtype: "textarea",
            itemId: "nature",
			padding: 4,
			bind: "Nature_job",
			fieldLabel: "Nature de la tâche",
			labelAlign: "top",
			width: "100%",
			height: 100
		},
		{
			xtype: "combo",
            itemId: "affaire_statut",
			padding: 4,
			bind: "Statut_job",
			fieldLabel: "Statut",
			labelAlign: "top",
			width: "100%",
            valueField: "id",
            displayField: "statut",
            store: App.store.create('sapei://job_statut',{autoLoad: true})
		},            
/*		{
			flex: 1,
			border: false
		},		*/
		{
            xtype: 'chart',
            style: 'background:#fff',
			height: 200,
			width: "100%",
			margin: {
				right: 5
			},
            animate: {
                easing: 'bounceOut',
                duration: 1000
            },
            store: App.store.create(
			{
				fields: ['name', 'data1'],
				data: [{
					name: "test",
					data1: 0
                }]
			}
			),
            insetPadding: 25,
            flex: 1,
            axes: [{
                type: 'gauge',
                position: 'gauge',
                minimum: 0,
                maximum: 100,
                steps: 10,
                margin: 7
            }],
            series: [{
                type: 'gauge',
                field: 'data1',
                donut: 80,
                colorSet: ['#3AA8CB', '#ddd']
            }]
        }		
		]
	},
	{
		title: 'Client',
        itemId: "clientpanel",
		region:'east',
		itemId: "eastpanel",
		margins: '5 0 0 0',
		cmargins: '5 5 0 0',
		width: 350,
		minSize: 350,
		maxSize: 350,
		layout: "vbox",
		collapsible: true,
		items: [
		{
			xtype: "combo",
			fieldLabel: "Client",
            editable: false,
            itemId: "cboclient",
            store: App.store.create("sapei://client_origine{Id_client_origine,Lib_client_origine+}",{autoLoad: true}),
            displayField: "Lib_client_origine", 
            valueField: "Id_client_origine",
            bind: "Id_contact_client",
            labelAlign: "top",			
			padding: 4,
			width: "100%"
		},
		{
			xtype: "combo",
			fieldLabel: "Service",
            itemId: "cboservice",
            editable: false,
            store: App.store.create("App.Clients.getServices"),
            displayField: "Lib_client_rattache", 
            valueField: "Id_client_rattache",
            bind: "Id_client_rattache",
            labelAlign: "top",			
			padding: 4,
			width: "100%"
		},
		{
			xtype: "combo",
			fieldLabel: "Contact principal",
            itemId: "cbocontact",
            editable: false,
            store: App.store.create("sapei://contact_client{Id_contact_client,NomPrenom_contact_client+}?type_client=1",{autoLoad: true}),
            displayField: "NomPrenom_contact_client", 
            valueField: "Id_contact_client",  			
            bind: "Id_client_principal",
            labelAlign: "top",			
			padding: 4,
			width: "100%"
		},
        {
            layout: "vbox",
            width: "100%",
            itemId: "panelContacts",
            flex: 1,
            border: false,
            items: [
            {
                layout: "hbox",
                padding: 4,
                border: false,
                width: "100%",
                items: [				
                {
                    xtype: "textfield",
                    itemId: "tel",
                    bind: "Tel_contact_client",
                    fieldLabel: "Tel",
                    labelAlign: "top",							
                    flex: 1
                },
                {
                    xtype: "textfield",
                    fieldLabel: "Portable",
                    bind: "Mobile_contact_client",
                    itemId: "mobile",
                    labelAlign: "top",			
                    margin: {
                        left: 5
                    },
                    flex: 1
                }
                ]
            },
            {
                xtype: "textfield",
                fieldLabel: "Adresse mail",
                bind: "Mail_contact_client",
                itemId: "mail",
                labelAlign: "top",			
                padding: 4,
                width: "100%"
            },		
            {
                xtype: "textfield",
                fieldLabel: "Fonction",
                bind: "Fonction_contact_client",
                itemId: "fonction",
                labelAlign: "top",			
                padding: 4,
                width: "100%"
            },
            {
                xtype: "textarea",
                fieldLabel: "Adresse",
                itemId: "adresse",
                bind: "Adresse_contact_client",
                labelAlign: "top",			
                padding: 4,
                width: "100%",
                height: 80
            },
            {
                flex: 1,
                border: false
            },
            {
                xtype: "grid",
                itemId: "gridContacts",
                border: false,
                tbar: [
                    {
                        text: "Ajouter",
                        itemId: "addContact"
                    },
                    {
                        text: "Supprimer",
                        itemId: "delContact"
                    }
                ],
                columns: [
                {
                    text: "Contact",
                    dataIndex: "NomPrenom_contact_client",
                    flex: 1
                },
                {
                    text: "Téléphone",
                    dataIndex: "Tel_contact_client"
                },
                {
                    hidden: true,
                    text: "Mobile",
                    dataIndex: "Mobile_contact_client"
                }
                ],
                store: App.store.create("sapei://job_contacts{*,contact_client.*}",{autoLoad: true}),
                width: "100%",
                height:250
            }                
            ]
        }
		]
	},
	{
		collapsible: false,
		region:'center',
		itemId: "centerpanel",
		margins: '5 0 0 0',
		border: false,
		layout: "vbox",
		items: [
		{
			title: "Tâches",
			collapsible: true,
			width: "100%",
			border: false,
			flex: 1,
            autoScroll: true,
			tbar: [
			{
				text: "Nouvelle tâche",
				itemId: "newtask",
                hidden: true
			}
			],
			items: [
			{
				xtype: "grid",
                itemId: "tasks",
				columns: [
				{
					header: "Matériel/Agent",
					dataIndex: "libelle",
				    flex: 1
				},
				{
					header: "Période",
					dataIndex: "periode",
					width: 250
				},
                {
                    header: "Progression",
                    dataIndex: "step",
                    width: 250,
                    editor: {
                        xtype: "combo",
                        editable: false,
                        store: App.store.create("sapei://steps",{autoLoad: true}),
                        displayField: "Lib_step",
                        valueField: "Lib_step"
                    }
                }
				],
                plugins: [ Ext.create('Ext.grid.plugin.CellEditing',{
                    clicksToEdit:1
                }) ],
				features: [
				    Ext.create('Ext.grid.feature.Grouping',{
					   groupHeaderTpl: '{name}'
				    })
				],
				width: "100%",
				flex: 1,
				store: App.store.create({fields:["Id","libelle_ope","step","modID","libelle","periode","type"],remoteGroup:true,
    remoteSort: true,sortInfo:{field: 'order_id', direction: "ASC"},groupField: "libelle_ope",data:[]},{autoLoad: true})
			}
			]
		},
		{
			title: "Localisation de l'affaire",
			collapsible: true,
			width: "100%",
			border: false,
			layout: "vbox",
			flex: 1,
			items: [
            {
                width: "100%",
                layout: "hbox",
                padding: 4,
                border: false,
                items: [
                {
                    xtype: "combo",
                    itemId: "cbo_dpt",
                    fieldLabel: "Département",
                    editable: false,
                    labelAlign: "top",
                    flex: 1,
                    store: App.store.create('sapei://dpt',{
                        autoLoad: true
                    }),
                    bind: "IdDepartement",
                    valueField: 'IdDepartement',
                    displayField: 'Lib_dpt',
                    queryMode: 'local',
                    typeAhead: true,
                    allowBlank: false				
                },
                {
                    xtype: "combo",
                    itemId: "cbo_axe",
                    editable: false,
                    fieldLabel: "Axe",
                    labelAlign: "top",
                    width: 100,
                    margin: {
                        left: 5
                    },
                    store: App.store.create('sapei://axe',{autoLoad: true}),
                    valueField: 'Id_axe',
                    displayField: 'Axe',
                    bind: "Id_axe",
                    queryMode: 'local',
                    typeAhead: false,
                    allowBlank: false
                },
                {
                    xtype: "combo",
                    itemId: "cbo_type_chaussees",
                    fieldLabel: "Type de chaussées",
                    labelAlign: "top",
                    editable: false,
                    width: 200,
                    bind: "Id_type_chaussee",
                    margin: {
                        left: 5
                    },
                    store: App.store.create('sapei://type_chaussee',{
                        autoLoad: true
                    }),
                    valueField: 'Id_type_chaussee',
                    displayField: 'Lib_type_chaussee',
                    queryMode: 'local',
                    typeAhead: true,
                    allowBlank: false				
                },
                {
                    xtype: "combo",
                    itemId: "cbo_sens",
                    editable: false,
                    fieldLabel: "Sens",
                    labelAlign: "top",
                    width: 170,
                    margin: {
                        left: 5
                    },
                    store: App.store.create('sapei://sens',{autoLoad: true}),
                    valueField: 'Id_sens',
                    displayField: 'sens',
                    bind: "Sens_job",
                    queryMode: 'local',
                    typeAhead: true,
                    allowBlank: false
                }                    
                ]
            },
            {
                layout: "hbox",
                border: false,
                margin: {
                    left: 5,
                    top: 10,
                    right: 10
                },
                width: "100%",
                items: [
                {
                    xtype: "textfield",
                    labelWidth: 150,
                    fieldLabel: "PR + abcisse de départ",
                    bind: "PRD",
                    labelAlign: "top",
                    flex: 1
                },
                {
                    xtype: "textfield",
                    labelWidth: 150,
                    margin: {
                        left: 5  
                    },
                    labelAlign: "top",
                    fieldLabel: "PR + abcisse de fin",
                    bind: "PRF",
                    flex: 1
                },
                {
                    xtype: "textfield",
                    labelWidth: 150,
                    labelAlign: "top",
                    margin: {
                        left: 5  
                    },
                    fieldLabel: "Linéaire de mesure (en m)",
                    bind: "Longueur_mesure_job",
                    flex: 1
                },
                {
                    flex: 1,
                    border: false
                }
                ]
            },
            {
                xtype: "checkbox", 
                padding: 4,
                hideLabel: true,
                boxLabel: 'Demande de protection',
                margin: {
                    left: 10,
                    top: 10,
                    right: 10,
                    bottom: 10
                }				
            },			
            {
                xtype: "textarea",		
                itemId: "comments",
                width: "100%",
                fieldLabel: "Commentaires",
                bind: "Comment_dmd_protec_job",
                labelAlign: "top",
                flex: 1,
                margin: {
                    left: 10,
                    right: 10,
                    bottom: 10
                }
            }				                
            ]
		}
		]
	}
	]
	
});
