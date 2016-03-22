App.view.define('VOpenAffaire', {
    extend: "Ext.Panel",
    alias: 'widget.VOpenAffaire',
    initComponent: function() {

        this.layout = {
            type: 'vbox'
        };
		
        this.defaults = {
            split: true
        };

        this.tbar = [
            '->',
			{
				text: "Filtrer",
				iconCls: "ico_filter",
				iconAlign: 'left',
				itemId: "BtnFilter"
			},
            {
                text: "Imprimer",
                hidden: true,
                iconCls: "ico_printer",
                handler: function(p) {
                    Ext.ux.grid.Printer.print(App.get(p.up('panel'),'grid#open'));
                }
            }
        ];

        this.items = [
		{
			xtype: "grid",
			itemId: "open",
			width: "100%",
			flex: 1,
			border: false,
			columns: [
			{
				text: "Id",
				dataIndex: "Id_job",
				width: 30
			},
			{
				text: "Type",
				dataIndex:"Libelle_type_prestation"
			},
			{
				text: "Département",
				dataIndex: "Lib_dpt"
			},
			{
				text: "Axe",
				dataIndex: "Axe",
				width: 70
			},                
			{
				text: "Intitulé",
				dataIndex: "Intitule_job",
				flex: 1
			},
			{
				text: "Prise d'affaire",
				dataIndex:"Date_prise_job",
				renderer: Ext.util.Format.dateRenderer("d/m/Y")
			},
            {
                text: "Statut",
                dataIndex: "statut",
                width: 100
            },                
			{
				text: "Remise livrable",
				dataIndex:"Date_livrable_job",
				renderer: Ext.util.Format.dateRenderer("d/m/Y")
			},
			{
				text: "Avancement",
				dataIndex:"avancement",
                width: 80,
                renderer: function(value, meta, record){
                    if (value==-1) return "";
                    if(value == null){
                        value = 0;
                    };              
                    var id=Ext.id();
                    var pt = (value*100/record.data.total)/100;;
                    var id = Ext.id();
                    Ext.defer(function (id,pt) {
                        var p = Ext.create('Ext.ProgressBar',{
                            renderTo: id,
                            animate: true,
                            width: '100%',
                            value: pt,
                            text: (pt*100)+"%",
                        });                        
                    }, 50, undefined, [id,pt]);
                    return "<div id='" + id + "'></div>";
				}
			},
            {
                text: "Pilote",
                dataIndex: "nomprenom"
            }
			],
            features: [
                Ext.create('Ext.grid.feature.Grouping',{
                   groupHeaderTpl: '{name}'
                })
            ],            
			store: App.store.create('sapei://job{Id_job,avancement, total,axe.Axe,axe.dpt.Lib_dpt,Intitule_job+,job_statut.statut,type_prestation.Libelle_type_prestation,Date_prise_job,Date_livrable_job,Num_SIGMA_job,client_origine.Lib_client_origine,Id_pilote_job->bpclight_agents{nom+" "+prenom=nomprenom}}',{groupField:"Lib_client_origine"})
		}
		];

        this.callParent();
    }
});