App.view.define('VNewCarnet', {
    extend: "Ext.window.Window",
    alias: 'widget.VNewCarnet',
    initComponent: function() {
        this.width = 750;
        this.height = 630;
        
        this.title="Nouveau client";

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
        ];
		
        this.defaults = {
            split: true
        };

        this.items = [
            
		];

        this.callParent();
    }
});