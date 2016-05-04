App.view.define('VSchedulerMain', {
    extend: "Ext.Panel",
    alias: 'widget.VSchedulerMain',
    initComponent: function() {
		
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
				timeAxis: new Lib.timeAxis(),
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
				eventStore: App.eventstore.create("sapei://schedule_skills{Id,ResourceId,Type,Name,StartDate,EndDate,User,Cls}",{autoLoad: true}),
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
				eventStore: App.eventstore.create("sapei://schedule_users{Id,ResourceId,Type,Name,StartDate,EndDate,User,Cls}",{autoLoad: true}),
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