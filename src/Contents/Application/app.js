APP_NAMESPACE = Settings.NAMESPACE;
LANGS = Settings.LANGS;

Ext.Loader.setConfig({
    enabled: true,
	paths: Settings.PATHS
});

Manifest = function()
{

	Ext.application({

		name: APP_NAMESPACE,
		
		appFolder: Ext.Loader.getPath('Contents'),	
		autoCreateViewport: false,

		controllers: Settings.CONTROLLERS,
		
		launch: function () 
		{

		}
		
	});
	
};

App.Loader();
