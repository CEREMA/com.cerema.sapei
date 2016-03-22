App.view.define('VScheduler', {
    extend: "Ext.window.Window",
    alias: 'widget.VScheduler',
    initComponent: function() {
		
		// define time axis & presets
		
		Ext.define('MyTimeAxis', {
			extend     : "Ext.ux.Scheduler.data.TimeAxis",
			continuous : false,

			generateTicks : function (start, end, unit, increment) {
				// Use our own custom time intervals for day time-axis
				if (unit === Ext.ux.Scheduler.util.Date.DAY) {
					var ticks = [],
						intervalEnd;

					while (start < end) {
						if (start.getDay() === 5) {
							// Fridays are lazy days, working 10am - 4pm
							start.setHours(8);
							intervalEnd = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.HOUR, 10);
						} else {
							start.setHours(8);
							intervalEnd = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.HOUR, 10);
						}

						ticks.push({
							start : start,
							end   : intervalEnd
						});
						start = Ext.ux.Scheduler.util.Date.add(start, Ext.ux.Scheduler.util.Date.DAY, 1);
					}
					return ticks;
				} else {
					return this.callParent(arguments);
				}
			}
		});

		Ext.ux.Scheduler.preset.Manager.registerPreset("CEREMA_VIEW", {
				displayDateFormat : 'd/m/Y',
				shiftIncrement    : 1,
				shiftUnit         : "WEEK",
				timeColumnWidth   : 90,
				timeResolution    : {
					unit      : "HOUR",
					increment : 1
				},
				headerConfig      : {
					middle : {
						unit     : "DAY",
						align    : 'center',
						renderer : function (start, end, cfg) {
							return start.getDayName()+' '+start.getDate();
						}
					},
					top    : {
						unit     : "WEEK",
						align    : 'center',
						renderer : function (start, end, cfg) {
							return Ext.Date.format(start, 'M Y')+' - Semaine ' + Ext.Date.format(start, 'W');
						}
					}
				}
		}); 	
		
		// window property
		
        this.width = 1024;
        this.height = 660;

        this.layout = {
            type: 'hbox'
        };

        this.tbar = [
			{
                xtype: "combo",
                fieldLabel: "Mois",
                labelAlign: "top",
                itemId: "selectMonth",
				width: 100,
				editable:false,
                store: App.store.create({
                    fields: [
                        "id",
                        "month"
                    ],
                    data: [{
                        id: 0,
                        month: "Janvier"
                    }, {
                        id: 1,
                        month: "Février"
                    }, {
                        id: 2,
                        month: "Mars"
                    }, {
                        id: 3,
                        month: "Avril"
                    }, {
                        id: 4,
                        month: "Mai"
                    }, {
                        id: 5,
                        month: "Juin"
                    }, {
                        id: 6,
                        month: "Juillet"
                    }, {
                        id: 7,
                        month: "Aout"
                    }, {
                        id: 8,
                        month: "Septembre"
                    }, {
                        id: 9,
                        month: "Octobre"
                    }, {
                        id: 10,
                        month: "Novembre"
                    }, {
                        id: 11,
                        month: "Décembre"
                    }]
                }),
                 margin:{
 						bottom: 5,
						right: 5                     
                 },
                displayField: "month",
                valueField: "id"
            }, {			
                 xtype: "combo",
                 fieldLabel: "Année",
                labelAlign: "top",
                 itemId: "selectAnnee",
				 width: 70,
				 editable: false,
                 displayField: "year",
                 valueField: "year",
                 margin:{
 						bottom: 5,
						right: 5                     
                 },
				 store: App.store.create({
                    fields: [
                        "year"
                    ],
                    data: []
                })
            },            
				{
					xtype: "combo",
					itemId: "type_ope",
					editable: false,
					valueField: "id_type_ope",
					margin: {
						bottom: 5,
						right: 5
					},
					displayField: "libelle_ope",
					fieldLabel: "Nature",
					labelAlign: "top",
					width: 370,
					store: App.store.create("sapei://type_ope",{autoLoad: true})
				},
				'->',
				{
					text: "Ajouter",
					xtype: "button",
					itemId: "save_task",
					height: 40
				}            
        ];

        this.defaults = {
            split: true
        };
		
		this.title="Tâche";
		
		this.bodyStyle="background:#FFFFFF";
        
        this.bbar=[
            '->',
            {
                xtype: "panel",
                border: false,
                height: 35,
                html: '<table><tr><td><div style="background-color:yellow;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Etudes</td><td><div style="background-color:orange;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Mesures</td><td><div style="background-color:red;height:15px;width:15px;margin:5px">&nbsp;&nbsp;&nbsp;&nbsp;</div></td><td>Traitement</td></tr></table>',
                bodyStyle: "background-color:transparent",
                itemId: "Legendes"
            }
        ];

		
        this.items = [
		{
			layout: "vbox",
			border: false,
			height: "100%",
			flex: 1,
			items: [
			{
				xtype: "schedulergrid",
				itemId: "schedule_materiels",
				timeAxis: new MyTimeAxis(),
				enableEventDragDrop:true,
				columnWidth: 30,
				startDate     : new Date(),
				endDate       : new Date(new Date().setMonth(new Date().getMonth()+4)),
				viewPreset    : 'CEREMA_VIEW',
				rowHeight: 32,
				flex: 1,
				allowOverlap: false,
				heigth: 200,
				width: "100%",
				columns: [{
					header: 'Matériels',
					dataIndex: 'Materiel',
					width: 200,
					tdCls: 'user',
					sortable: true,
					field: new Ext.form.TextField()
				}],
				eventStore: App.eventstore.create("sapei://schedule_skills{Id, ResourceId, Job, StartDate, EndDate, User, IF(User='"+Auth.User.uid+"';'blue';'red')=Cls}",{autoLoad: true}),
				resourceStore: App.resourcestore.create("sapei://porteur_outils{Id_porteur_outils=Id,outils.Libelle_materiel+'<br><small><b>'+porteur.Porteur_libelle+'</b></small>'=Materiel+}",{autoLoad: true})
			},                
			{
				xtype: "schedulergrid",
				itemId: "schedule_agents",
				timeAxis: new MyTimeAxis(),
				enableEventDragDrop:true,
				columnWidth: 2,
				startDate     : new Date(),
				endDate       : new Date(new Date().setMonth(new Date().getMonth()+4)),
				viewPreset    : 'CEREMA_VIEW',
				rowHeight: 32,
				allowOverlap: false,
				flex: 1,
				heigth: 200,
				width: "100%",
				columns: [{
					header: 'Agents',
					dataIndex: 'NomPrenom',
					width: 200,
					tdCls: 'user',
					sortable: true,
					field: new Ext.form.TextField()
				}],
				eventStore: App.eventstore.create("sapei://schedule_users{Id, ResourceId, StartDate, EndDate, User, IF(User='"+Auth.User.uid+"';'blue';'red')=Cls}",{autoLoad: true}),
				resourceStore: App.resourcestore.create("sapei://user{Id_Agent=Id,Id_Agent->bpclight_agents{nom+' '+prenom=NomPrenom+}}?Id_role_agent=2",{autoLoad: true})
			}
			]
		},
		{
			width: 250,
			hidden: true,
			border: false,
			items: [
                {
                    xtype: "grid",
                    flex: 1,
                    height: "100%",
                    store: App.store.create({fields:[],data:[]}),
                    columns:[
                    
                    ]
                }
			]
		}
		];

        this.callParent();
    }
});