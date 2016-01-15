App.view.define('VSchedulerMain', {
    extend: "Ext.Panel",
    alias: 'widget.VSchedulerMain',
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
		
        this.layout = {
            type: 'hbox'
        };

        this.defaults = {
            split: true
        };
		
        this.bodyStyle="background:#FFFFFF";
		
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
				eventStore: App.eventstore.create("sapei://schedule_skills{Id,ResourceId,StartDate,EndDate,User,Cls}",{autoLoad: true}),
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
				eventStore: App.eventstore.create("sapei://schedule_users{Id,ResourceId,StartDate,EndDate,User,Cls}",{autoLoad: true}),
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