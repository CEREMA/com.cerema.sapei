App.view.define('VBlog', {
    extend: "Ext.window.Window",
    alias: 'widget.VBlog',
    initComponent: function() {
        this.width = 640;
        this.height = 480;
		
		this.title = "Article";
		
        this.layout = {
            type: 'fit'
        };

        this.bbar = [
			'->',
			{
				text: "Annuler",
				handler: function(p) {
					p.up('window').close();
				}
			},
			{
				text: "Enregistrer",
				itemId: "blog_ok"
			}
        ];

        this.tbar = [
        ];
		
        this.defaults = {
            split: true
        };

        this.items = {
			xtype: "htmleditor",
			border: false,
			itemId: "blogme"
		};

        this.callParent();
    }
});