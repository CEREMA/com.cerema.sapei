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

console.log(Settings.MODULES);
for (var i=0;i<Settings.MODULES.length;i++) {
	Settings.MODS=[];
	Settings.FRAM=[];
	if (Settings.MODULES[i].indexOf('omneedia.')>-1) Settings.FRAM.push(Settings.MODULES[i]); else Settings.MODS.push(Settings.MODULES[i]);
};
console.log(Settings.FRAM);
Ext.require(Settings.FRAM, function() {
	App.Loader(Settings.MODS);
});

/*if (Settings.MODULES.length>0) {
	Ext.require(Settings.MODULES, function()
	{
		for (var i=0;i<Settings.API.length;i++)
		{
			App.using(Settings.API[i]);
		};
		App.load();
	});
} else {
	for (var i=0;i<Settings.API.length;i++)
	{
		App.using(Settings.API[i]);
	};
	App.load();
}*/