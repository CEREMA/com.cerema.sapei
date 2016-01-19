App.view.define('VCarnet', {
    extend: "Ext.window.Window",
    alias: 'widget.VCarnet',
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
		];

        this.callParent();
    }
});