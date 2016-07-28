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
				infiniteScroll: true,
				columns: [{
					header: 'Matériels',
					dataIndex: 'Materiel',
					width: 200,
					tdCls: 'user',
					sortable: true,
					field: new Ext.form.TextField()
				}],
				eventStore: App.store.create("sapei://schedule_skills{Id,ResourceId,Job,Type,Name,StartDate,EndDate,User,Cls}",{type:"events",autoLoad: true}),
				resourceStore: App.store.create("sapei://porteur_outils{Id_porteur_outils=Id,outils.Libelle_materiel+'<br><small><b>'+porteur.Porteur_libelle+'</b></small>'=Materiel+}",{type:"resources",autoLoad: true})
			},                
			{
				xtype: "schedulergrid",
				itemId: "schedule_agents",
				timeAxis: new Lib.timeAxis(),
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
				infiniteScroll: true,
				columns: [{
					header: 'Agents',
					dataIndex: 'NomPrenom',
					width: 200,
					tdCls: 'user',
					sortable: true,
					field: new Ext.form.TextField()
				}],
				eventStore: App.store.create("sapei://schedule_users{Id,ResourceId,Job,Type,Name,StartDate,EndDate,User,Cls}",{type:"events",autoLoad: true}),
				resourceStore: App.store.create("sapei://user{Id_Agent=Id,Id_Agent->bpclight_agents{nom+' '+prenom=NomPrenom+}}?Id_role_agent=2",{type:"resources",autoLoad: true})
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