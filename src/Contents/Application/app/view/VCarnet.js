App.view.define('VCarnet', {
    extend: "Ext.window.Window",
    alias: 'widget.VCarnet',
    initComponent: function() {
        this.width = 750;
        this.height = 630;
        
        this.title="Carnet d'adresses";

        this.layout = {
            type: 'vbox'
        };
        
        this.bodyStyle="background-color:white";

        this.bbar = [
            '->',
            {
                itemId: "record",
                text: "Enregistrer"
            }
        ];

        this.tbar = [
            {
                text: "Nouveau contact",
                handler: function(p) {
                    App.reset(p.up('window'));   
                }
            },
            {
                text: "Nouveau client",
                handler: function(p) {
                    App.reset(p.up('window'));   
                    App.get(p.up('window'),"panel#newclient").show();
                }
            },
            {
                text: "Nouveau service",
                handler: function(p) {
                    App.reset(p.up('window'));   
                    App.get(p.up('window'),"panel#newservice").show();
                }
            }            
        ];
		
        this.defaults = {
            split: true
        };

        this.items = [
            {
                xtype: "panel",
                itemId: "newservice",
                layout: "fit",
                hidden: true,
                height: 100,
                width: "100%",
                border: false,
                bbar: [
                '->',
                {
                    text: "Fermer",
                    handler: function(p) {
                        p.up("panel").hide();
                    }
                },
                {
                    text: "Enregistrer",
                    handler: function(p) {
                        if (App.get(p.up('window'),"combo#client").getValue()=="") {
                            alert("Vous devez sélectionner un client.");
                            p.up("panel").hide();
                            return;  
                        };
                        if (App.get(p.up("window"),"textfield#newserviceed").getValue()!="") App.DB.post('sapei://client_rattache',{
                            Lib_client_rattache: App.get(p.up("window"),"textfield#newserviceed").getValue(),
                            Id_client_origine: App.get(p.up('window'),"combo#client").getValue()
                        },function(){
                            App.get(p.up("window"),"combo#service").getStore().load();
                            p.up("panel").hide();
                        });
                    }
                }                    
                ],
                items: [
                    {
                        xtype: "textfield",
                        itemId: "newcliented",
                        padding: 5,
                        width: "100%",
                        fieldLabel: "Nouveau client"                
                    }
                ]
            },
            {
                xtype: "panel",
                itemId: "newclient",
                layout: "fit",
                hidden: true,
                height: 100,
                width: "100%",
                border: false,
                bbar: [
                '->',
                {
                    text: "Fermer",
                    handler: function(p) {
                        p.up("panel").hide();
                    }
                },
                {
                    text: "Enregistrer",
                    handler: function(p) {
                        if (App.get(p.up("window"),"textfield#newcliented").getValue()!="") App.DB.post('sapei://client_origine',{
                            Lib_client_origine: App.get(p.up("window"),"textfield#newcliented").getValue()
                        },function(){
                            App.get(p.up("window"),"combo#client").getStore().load();
                            p.up("panel").hide();
                        });
                    }
                }                    
                ],
                items: [
                    {
                        xtype: "textfield",
                        itemId: "newcliented",
                        padding: 5,
                        width: "100%",
                        fieldLabel: "Nouveau client"                
                    }
                ]
            },
            {
                xtype: "textfield",
                bind: "Id_contact_client",
                hidden: true
            },
            {
                layout: "hbox",
                width: "100%",
                border: false,
                items: [
                {
                    xtype: "combo",
                    itemId: "client",
                    padding: 10,
                    flex: 1,
                    fieldLabel: "Client",
                    editable: false,
                    labelAlign: "top",
                    store: App.store.create('sapei://client_origine{Id_client_origine,Lib_client_origine+}',{autoLoad: true}),
                    displayField: "Lib_client_origine",
                    valueField: "Id_client_origine"
                },
                {
                    xtype: "combo",
                    itemId: "service",
                    padding: 10,
                    flex: 1,
                    fieldLabel: "Service",
                    bind: "Id_client_rattache",
                    editable: false,
                    labelAlign: "top",
                    store: App.store.create('sapei://client_rattache{Id_client_rattache,Lib_client_rattache+}'),
                    displayField: "Lib_client_rattache",
                    valueField: "Id_client_rattache"
                },
                {
                    xtype: "combo",
                    itemId: "type",
                    padding: 10,
                    width: 100,
                    fieldLabel: "Type",
                    editable: false,
                    labelAlign: "top",
                    store: App.store.create('sapei://type_contact',{autoLoad: true}),
                    displayField: "Lib_type_contact",
                    valueField: "Id_type_contact",
                    bind: "Type_client"
                }                    
                ]
            },
            {
                xtype: "textfield",
                fieldLabel: "Nom, Prénom",
                bind: "NomPrenom_contact_client",
                padding: 10,
                width: "100%",
                labelAlign: "left"
            },
            {
                xtype: "textfield",
                fieldLabel: "Téléphone",
                bind: "Tel_contact_client",
                padding: 10,
                width: "100%",
                labelAlign: "left"
            },
            {
                xtype: "textfield",
                fieldLabel: "Mobile",
                bind: "Mobile_contact_client",
                padding: 10,
                width: "100%",
                labelAlign: "left"
            },
            {
                xtype: "textfield",
                fieldLabel: "Mail",
                bind: "Mail_contact_client",
                padding: 10,
                width: "100%",
                labelAlign: "left"
            },
            {
                xtype: "textfield",
                fieldLabel: "Fonction",
                bind: "Fonction_contact_client",
                padding: 10,
                width: "100%",
                labelAlign: "left"
            },            
            {
                xtype: "textarea",
                fieldLabel: "Adresse",
                bind: "Adresse_contact_client",
                padding: 10,
                width: "100%",
                flex: 1,
                labelAlign: "left"
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
                store: App.store.create('sapei://contact_client{*,NomPrenom_contact_client+,client_rattache.Lib_client_rattache,type_contact.Lib_type_contact}',{autoLoad: true})
            }
		];

        this.callParent();
    }
});