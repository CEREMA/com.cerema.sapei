App.view.define('VMain', {

	extend: 'Ext.Panel'
	, alias: 'widget.mainform'
	, border: false,

	layout: "border",

	items: [
		{
			region: 'north'
			, height: 25
			, minHeight: 25
			, border: false
			, baseCls: 'cls-header'
			, xtype: "Menu"
			, itemId: "MenuPanel"
			, menu: [
				{
					text: "Affaires"
					, menu: [
						{
							itemId: "mnu_aff_new"
							, text: "Nouveau"
							, hidden: true
						}
						, {
							itemId: "mnu_aff_close"
							, text: "Fermer"
							, hidden: true
						}
					]
				}
				, {
					text: "Contacts"
					, menu: [
						{
							itemId: "mnu_contacts"
							, text: "Carnet d'adresses"
                        }
                    ]
                }
			]
		}
		, {
			region: "north"
			, xtype: "FilterBox"
			, itemId: "FilterPanel"
			, fields: [
				{
					name: "Axe"
					, field: "Axe"
					, type: "choice"
					, model: "sapei://axe"
					, display: "Axe"
					, value: "Axe"
			 }
				, {
					name: "Pilote"
					, field: "Id_pilote_job"
					, type: "choice"
					, model: 'sapei://user{Id_agent=kage,Id_agent->bpclight_agents{nom+" "+prenom=NomPrenom+}}'
					, display: "NomPrenom"
					, value: "kage"
			 },
                 {
                    name: "Agents",
                    field: "Id_users",
                    type: "choice",
                    model: 'sapei://user{Id_agent,Id_agent->bpclight_agents{nom+" "+prenom=NomPrenom+}}',
                    display: "NomPrenom",
                    value: "Id_agent"
                 }
				
				, {
					name: "Clients"
					, field: "Id_contact_client"
					, type: "choice"
					, model: 'sapei://client_origine{Id_client_origine,Lib_client_origine}'
					, display: "Lib_client_origine"
					, value: "Id_client_origine"
			 },
                 {
                    name: "Matériels",
                    field: "Id_skills",
                    type: "choice",
                    model: 'sapei://porteur_outils{Id_porteur_outils,outils.Libelle_materiel}',
                    display: "Libelle_materiel",
                    value: "Id_porteur_outils"
                 }
        ]
        }
		, {
			region: "center"
			, split: true
			, layout: "fit"
			, border: false
			, items: [
				{
					xtype: "TAffaire"
					, hidden: true
					, flex: 1
			}
				, {
					xtype: "tabpanel"
					, itemId: "mainscreen"
					, activeTab: 0
					, items: [
						{
							xtype: "VOpenAffaire"
							, border: false
							, title: "Affaires"
                		}
						, 
						{
							xtype: "VSchedulerMain"
							, title: "Planification"
							, hidden: false
							, tbar: [
								{
									xtype: "combo"
									, fieldLabel: "Année"
									, labelAlign: "top"
									, itemId: "selectAnnee"
									, width: 70
									, editable: false
									, displayField: "year"
									, valueField: "year"
									, margin: {
										bottom: 5
										, right: 5
									}
									, store: App.store.create({
										fields: [
                        				"year"
                    					]
										, data: []
									})
            					}
							]
							, bbar: [
                        '->'
								, {
									xtype: "panel"
									, border: false
									, height: 35
									, html: '<table><tr><td><div style="background-color:yellow;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Etudes</td><td><div style="background-color:orange;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Mesures</td><td><div style="background-color:red;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Traitement</td></tr></table>'
									, bodyStyle: "background-color:transparent"
									, itemId: "Legendes"
                        }
                    ]
							, flex: 1
                }
                ]
            }
			, ]
		}
	]

});