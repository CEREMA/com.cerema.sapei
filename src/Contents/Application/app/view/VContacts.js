App.view.define('VContacts', {
    extend: "Ext.window.Window",
    alias: 'widget.Contacts',
    initComponent: function() {
        this.width = 1024;
        this.height = 660;

        this.layout = {
            type: 'vbox'
        };

        this.bbar = [
        ];

        this.tbar = [
        ];
		
        this.defaults = {
            split: true
        };

        this.items = [
            {
                xtype: "grid",
                columns:[
                    {
                        text:"Nom",
                        dataIndex: "NomPrenom_contact_client",
                        flex: 1
                    },
                    {
                        text:"Fonction",
                        dataIndex: "Fonction_contact_client",
                        flex: 1
                    },
                    {
                        text:"Téléphone",
                        dataIndex: "Tel_contact_client"
                    },
                    {
                        text:"Mobile",
                        dataIndex: "Mobile_contact_client"
                    },
                    {
                        text:"Mail",
                        dataIndex: "Mail_contact_client",
                        flex: 1
                    }
                ],
                flex: 1,
                width: "100%",
                store: App.store.create('App.Clients.getContacts')
            }
		];
        
        this.title = "Contacts";
        
        this.callParent();
    }
});