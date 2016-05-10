App.view.define('VNew', {
    extend: "Ext.window.Window",
    alias: 'widget.VNew',
    initComponent: function() {
		
		
		// window property
		
        this.width = 824;
        this.height = 160;
        
        this.title = "Nouveau"

        this.layout = {
            type: 'vbox'
        };
        
        this.bbar= [
          {
              '->',
              text: "Enregistrer"
          }
        ];

        this.items = [
            {
                xtype: "textfield",
                padding: 5,
                width: "100%",
                fieldLabel: "Service"                
            }
		];

        this.callParent();
    }
});