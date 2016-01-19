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
                xtype: "combo",
                padding: 10,
                width: "100%",
                fieldLabel: "Service",
                editable: false,
                labelAlign: "left",
                store: App.store.create('sapei://client_rattache'),
                displayField: "Lib_client_rattache",
                valueField: "Id_client_rattache"
            },
            {
                xtype: "combo",
                padding: 10,
                width: "100%",
                fieldLabel: "Type",
                editable: false,
                labelAlign: "left",
                store: App.store.create('sapei://type_contact'),
                displayField: "Lib_type_contact",
                valueField: "Id_client_rattache"
            },
            {
                flex: 1,
                border: false
            },
            {
                xtype: "grid",
                width: "100%",
                flex: 1,
                columns:[
                {
                    text: "Nom Prénom",
                    dataIndex: "NomPrenom_contact_client"
                },
                {
                    text: "Téléphone",
                    dataIndex: "Tel_contact_client" 
                },
                {
                    text: "Mobile",
                    dataIndex: "Mobile_contact_client" 
                },
                {
                    text: "Mail",
                    dataIndex: "Mail_contact_client" 
                },
                {
                    text: "Fonction",
                    dataIndex: "Fonction_contact_client" 
                },
                {
                    text: "Service",
                    dataIndex: "Lib_client_rattache"
                },
                {
                    text: "Type",
                    dataIndex: "Lib_type_contact"
                }
                ],
                store: App.store.create('sapei://contact_client{*,client_rattache.Lib_client_rattache,type_contact.Lib_type_contact}',{autoLoad: true})
            }
		];

        this.callParent();
    }
});