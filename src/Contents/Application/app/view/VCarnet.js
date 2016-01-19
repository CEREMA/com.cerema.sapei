App.view.define('VCarnet', {
    extend: "Ext.window.Window",
    alias: 'widget.VCarnet',
    initComponent: function() {
        this.width = 600;
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
                xtype: "combo",
                padding: 10,
                width: "100%",
                fieldLabel: "Client",
                editable: false,
                labelAlign: "left",
                store: App.store.create('sapei://client_origine',{autoLoad: true}),
                displayField: "Lib_client_origine",
                valueField: "Id_client_origine"
            },
            {
                flex: 1,
                border: false
            },
            {
                xtype: "grid",
                width: "100%",
                columns:[
                {
                    dataIndex: "NomPrenom_contact_client"
                },
                {
                    dataIndex: "Tel_contact_client" 
                },
                {
                    dataIndex: "Mobile_contact_client" 
                },
                {
                    dataIndex: "Mail_contact_client" 
                },
                {
                    dataIndex: "Fonction_contact_client" 
                },
                {
                    dataIndex: "Lib_client_rattache"
                },
                {
                    dataIndex: "Lib_type_contact"
                }
                ],
                store: App.store.create('contact_client{*,client_rattache.Lib_client_rattache,type_contact.Lib_type_contact}',{autoLoad: true})
            }
		];

        this.callParent();
    }
});