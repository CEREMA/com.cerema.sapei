App.view.define('VOpenAffaire', {
    extend: "Ext.window.Window",
    alias: 'widget.VOpenAffaire',
    initComponent: function() {
        this.width = 1024;
        this.height = 700;
		
		this.title = "Ouvrir une affaire";
		
        this.layout = {
            type: 'vbox'
        };

        this.bbar = [
		'->',
		{
			text: "Fermer",
            handler: function(p) {
                p.up('window').close();   
            }
		},
		{
			text: "Ouvrir",
            itemId: "openAffaire"
		}
        ];
		
        this.defaults = {
            split: true
        };

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
				text: "Remise livrable",
				dataIndex:"Date_livrable_job",
				renderer: Ext.util.Format.dateRenderer("d/m/Y")
			},
			{
				text: "Avancement",
				dataIndex:"Lib_client_origine",
                renderer: function(value, meta, record){
                    if (value==-1) return "";
                    if(value == null){
                        value = 0;
                    };              
                    var id=Ext.id();
                    console.info(record);
                    /*pt = (value*100/5)/100;
                    var id = Ext.id();
                    Ext.defer(function (id,pt) {
                        var p = Ext.create('Ext.ProgressBar',{
                            renderTo: id,
                            animate: true,
                            width: '100%',
                            value: pt,
                            text: (pt*100)+"%",
                        });                        
                    }, 50, undefined, [id,pt]);*/
                    return "<div id='" + id + "'></div>";
				}
			}
			],
            features: [
                Ext.create('Ext.grid.feature.Grouping',{
                   groupHeaderTpl: '{name}'
                })
            ],            
			store: App.store.create('sapei://job{Id_job,avancement, total,axe.Axe,axe.dpt.Lib_dpt,Intitule_job+,type_prestation.Libelle_type_prestation,Date_prise_job,Date_livrable_job,Num_SIGMA_job,client_origine.Lib_client_origine}',{groupField:"Lib_client_origine",autoLoad:true})
		}
		];

        this.callParent();
    }
});