
var AFFAIRE_ID="";

App.controller.define('CMain', {

	views: [
		"VMain",
		"VScheduler",
		"VOpenAffaire",
		"VAffaire",
		"VBlog",
		"Affaires.VNew",
		"Affaires.VNewAxe",
        "VContacts",
        "VCarnet",
        "VSchedulerMain",
        "admin.VBackoffice"
	],
	
	models: [
	],
	
	TASK_USER: {},
	TASK_SKILLS: {},
	
	init: function()
	{

		this.control({
			"menu>menuitem": {
				click: "Menu_onClick"
			},
			"button#clickme": {
				click: "clickme_onclick"
			},
			"AffairesVNew": {
				show: "AffairesVNew_onshow"
			},
            "AffairesVNew button#adrbook": {
                click: "AdrBookClick"
            },
			"AffairesVNew button#VNewPost": {
				click: "VNewPost_onclick"
			},
			"AffairesVNew button#newAxeBtn": {
				click: "newAxeBtn_onclick"
			},
			"AffairesVNew combo#cbo_dpt": {
				select: "cbo_dpt_onselect"
			},
            /*
            AffairesVNewAxe
            */
			"AffairesVNewAxe": {
			
			},
			"AffairesVNewAxe button#btn_add": {
				click: "add_new_axe"
			},
			"AffairesVNewAxe combo#cboDepartement": {
				select: "newaxe_dpt_onchange"
			},
			"AffairesVNewAxe combo#cbo_axe": {
				select: "newaxe_axe_onchange"
			},
			"AffairesVNewAxe grid#gAxe" : {
				itemcontextmenu: "gAxe_context"
			},
			"AffairesVNewAxe button#ctxClose": {
				click: "ctxClose_onclick"
			},
			/*
			Affaire (écran principal)
			*/
			"TAffaire": {
				show: "TAffaire_onshow"
			},
            "TAffaire button#addContact": {
                  click: "on_add_contact"
            },
            "TAffaire textfield": {
                change: "textfield_change"  
            },
            "TAffaire textarea#comments": {
                change: "textarea_change"
            },
            "TAffaire textarea#nature": {
                change: "textarea_nature_change"
            },
			"TAffaire combo": {
				select: "affaire_combo_update",
                change: "affaire_combo_change"
			},
            "TAffaire combo#cboservice": {
                select: "cboservice_onselect"  
            },
            "TAffaire combo#cbocontact": {
                select: "cbocontact_onselect"  
            },
			"TAffaire button#newtask": {
				click: "newtask_onclick"
			},
			"TAffaire button#ecrire": {
				click: "ecrire"
			},
			"TAffaire button#ecrire2": {
				click: "ecrire"
			},
            "TAffaire combo#cboclient": {
                select: "cboclient_onselect"  
            },
            "TAffaire grid#tasks": {
                itemcontextmenu:  "Task_delete",
                edit: "Task_edit",
                beforeedit: function(editor, e) {
                    console.log(editor);
                    console.log(e);
                    if (e.colIdx === 2 && e.record.data.step == '-')
                    return false;
                }
            },
            "TAffaire grid#gridContacts": {
                itemcontextmenu:  "contacts_context"  
            },
            "TAffaire datefield": {
                select: "datefield_onchange"
            },
			/*
			Scheduler 
			*/
			"VScheduler": {
				show: "VScheduler_onshow",
                close: "VScheduler_onclose"
			},
			"VScheduler button#save_task": {
				click: "save_task"
			},
			"VScheduler schedulergrid#schedule_agents": {
				beforeeventresize: "sch_agents_beforeeventresize",
				beforeeventdrag: "sch_agents_beforeeventdrag",
				beforeeventadd: "sch_agents_dragcreate",
                eventresizeend: "sch_agents_dragcreate",
                eventdrop: "sch_agents_dragcreate",
                eventmouseleave: "hide_tip",
                eventmouseenter: "schedule_tip",
                eventcontextmenu: "schedule_agents_context"
			},
			"VScheduler schedulergrid#schedule_materiels": {
				beforeeventresize: "sch_materiels_beforeeventresize",
				beforeeventdrag: "sch_materiels_beforeeventdrag",
				beforeeventadd: "sch_materiels_dragcreate",
                eventresizeend: "sch_materiels_dragcreate",
                eventdrop: "sch_materiels_dragcreate",
                eventmouseleave: "hide_tip",
                eventmouseenter: "schedule_tip",
                eventcontextmenu: "schedule_materiels_context"
			},
			/*
			OpenAffaire
			*/
			"VOpenAffaire button#BtnFilter" : {
				click: "filter_onclick"
			},
			"VOpenAffaire grid#open": {
				itemdblclick: "grid_open_dblclick"
			},
            "VOpenAffaire button#openAffaire": {
                click: "openAffaire"  
            },
			/*
			VBlog
			*/
			"VBlog": {
				close: "VBlog_close"
			},
			"VBlog button#blog_ok" : {
				click: "write_to_blog"
			},
            /*
            Contacts
            */
            "Contacts": {
                show: "Contacts_onshow"
            },
            "Contacts grid": {
                itemdblclick: "contacts_choose"
            },
            /*
            VSchedulerMain
            */
            "VSchedulerMain": {
                show: "VSchedulerMain_onshow"
            },
            "VSchedulerMain schedulergrid": {
                beforeeventresize: "read_only",
				beforeeventdrag: "read_only",
				beforeeventadd: "read_only",
                eventresizeend: "read_only",
                eventdrop: "read_only",
                eventcontextmenu: "read_only",
				beforetooltipshow: "tooltip_schedule",
                itemcontextmenu: "read_only",
                eventmouseleave: "hide_tip",
                eventmouseenter: "schedule_tip",
				beforedragcreate: "read_only",
                dragcreateend: "read_only",
                eventdrop: "read_only",
                eventdblclick: "load_affaire"
            }
		});
		
		App.init('VMain',this.onLoad);
		
	},
    VScheduler_onclose: function(p) {
        // détection de job=0 quand on quitte la fenêtre
        App.Tasks.removeTemp();
    },
	VSchedulerMain_onshow: function(p) {
		// update combo daterange
		var now = new Date();
        var year=now.getFullYear();		
        var tab=[];
		for (var i=-3;i<=3;i++) tab.push({year:year+i});
		var store_year = App.store.create({
			fields: [
				"year"
			],
			data: tab
		});
		App.get(p,'combo#selectAnnee').bindStore(store_year);
		App.get(p,'combo#selectAnnee').setValue(now.getFullYear());
		App.get(p,'combo#selectAnnee').on('select',function(){
			App.get(p,"schedulergrid#schedule_agents").setStart(new Date(App.get(p,"combo#selectAnnee").getValue(),0,1));
			App.get(p,"schedulergrid#schedule_agents").setEnd(new Date(App.get(p,"combo#selectAnnee").getValue(),12,31));
			App.get(p,"schedulergrid#schedule_materiels").setStart(new Date(App.get(p,"combo#selectAnnee").getValue(),0,1));
			App.get(p,"schedulergrid#schedule_materiels").setEnd(new Date(App.get(p,"combo#selectAnnee").getValue(),12,31));			
		});	
		
		App.get(p,"schedulergrid#schedule_agents").setStart(new Date(App.get(p,"combo#selectAnnee").getValue(),0,1));
		App.get(p,"schedulergrid#schedule_agents").setEnd(new Date(App.get(p,"combo#selectAnnee").getValue(),12,31));
		App.get(p,"schedulergrid#schedule_materiels").setStart(new Date(App.get(p,"combo#selectAnnee").getValue(),0,1));
		App.get(p,"schedulergrid#schedule_materiels").setEnd(new Date(App.get(p,"combo#selectAnnee").getValue(),12,31));

		
		// sync scrollbars
		
		App.get(p,'schedulergrid#schedule_agents').getSchedulingView().getEl().on('scroll', function(e, t) {
			App.get(p,'schedulergrid#schedule_materiels').getSchedulingView().getEl().dom.scrollLeft = t.scrollLeft;
		});
		App.get(p,'schedulergrid#schedule_materiels').getSchedulingView().getEl().on('scroll', function(e, t) {
			App.get(p,'schedulergrid#schedule_agents').getSchedulingView().getEl().dom.scrollLeft = t.scrollLeft;
		});
		
		App.get(p,"schedulergrid#schedule_materiels").scrollToDate(new Date());
		App.get(p,"schedulergrid#schedule_agents").scrollToDate(new Date());
	},
	filter_onclick: function()
	{
        App.get('VOpenAffaire grid#open').bindStore(App.store.create("App.Jobs.getAll"));
		App.get('mainform FilterBox#FilterPanel').store=App.get('VOpenAffaire grid#open').getStore();
		if (App.get('mainform FilterBox#FilterPanel').isVisible()) {
            App.get('mainform FilterBox#FilterPanel').hide();
            if (Auth.User.profiles.indexOf('Admin')>-1) {            
                // si je suis admin, je sélectionne par pilote
                App.get('VOpenAffaire grid#open').bindStore(App.store.create('sapei://job{Id_job,avancement, total,axe.Axe,axe.dpt.Lib_dpt,Intitule_job+,job_statut.statut,type_prestation.Libelle_type_prestation,Date_prise_job,Date_livrable_job,Num_SIGMA_job,client_origine.Lib_client_origine,Id_pilote_job->bpclight_agents{nom+" "+prenom=nomprenom}}',{groupField:"Lib_client_origine"}));
                App.get('VOpenAffaire grid#open').getStore().getProxy().extraParams.Id_pilote_job=Auth.User.uid;
                App.get('VOpenAffaire grid#open').getStore().load();
            };		  
        } else {
			App.get('mainform FilterBox#FilterPanel').show();
			App.get('VOpenAffaire grid#open').getStore().load();
		}
	},	
    AdrBookClick: function(p) {
        this.Contacts();
    },
    textfield_change: function(p) {
        if (App.timo) clearTimeout(App.timo);
        App.timo=setTimeout(function() {
            if (p.bind) {
                // on met à jour l'enregistrement
                var obj={};
                obj.Id_job=App.get('TAffaire').ItemID;
                obj[p.bind]=p.getValue();
                App.DB.post('sapei://job',obj,function(e,r) {
                    console.log(e);
                    console.log(r);
                    clearTimeout(App.timo);
                });
            }          
        },1000);        
    },
    textarea_nature_change: function(p) {
        if (App.timo) clearTimeout(App.timo);
        App.timo=setTimeout(function() {
            if (p.bind) {
                // on met à jour l'enregistrement
                var obj={};
                obj.Id_job=App.get('TAffaire').ItemID;
                obj[p.bind]=p.getValue();
                App.DB.post('sapei://job',obj,function(e,r) {
                    console.log(e);
                    console.log(r);
                    clearTimeout(App.timo);
                });
            }          
        },1000);                        
    },
    textarea_change: function(p) {
        if (p.getValue()!='') App.get('TAffaire checkbox').setValue(true); else App.get('TAffaire checkbox').setValue(false);
        if (App.timo) clearTimeout(App.timo);
        App.timo=setTimeout(function() {
            if (p.bind) {
                // on met à jour l'enregistrement
                var obj={};
                obj.Id_job=App.get('TAffaire').ItemID;
                obj[p.bind]=p.getValue();
                App.DB.post('sapei://job',obj,function(e,r) {
                    console.log(e);
                    console.log(r);
                });
            }          
        },1000);                
    },
    datefield_onchange: function(p) {
		if (p.bind) {
			// on met à jour l'enregistrement
			var obj={};
			obj.Id_job=App.get('TAffaire').ItemID;
			obj[p.bind]=p.getValue();
			App.DB.post('sapei://job',obj,function(e,r) {
                clearTimeout(App.timo);
			});
		}          
    },
    load_affaire: function(p,rec) {

        if (rec.data.Type==1) {
            var id=rec.data.Job; 
            App.reset(App.get('TAffaire')); 
            App.DB.get('sapei://job{*,axe.Axe,axe.dpt.IdDepartement}?Id_job='+id,App.get('TAffaire'),function(response) {
                response=response.data[0];
                App.get('TAffaire combo#cboservice').getStore().getProxy().extraParams.Id_client_origine=response.Id_contact_client;
                App.get('TAffaire combo#cboservice').getStore().load();
                App.get('TAffaire').ItemID=response.Id_job;
                App.get('TAffaire grid#gridContacts').getStore().getProxy().extraParams.Id_job=response.Id_job;
                App.get('TAffaire grid#gridContacts').getStore().load();
                var html=[
                    '<div class="job_title">',
                    response.Intitule_job,
                    '<div class="job_num">Id : ',
                    response.Id_job,
                    '</div>',
                    '</div>'				
                ];
                App.get('TAffaire panel#Title').update(html.join(''));	
                App.get('mainform tabpanel#mainscreen').hide();
                var btns=App.getAll('menu>menuitem');
                for (var i=0;i<btns.length;i++) {
                    if (btns[i].itemId=="mnu_aff_close") btns[i].show();  
                };
                App.get('TAffaire').show();		
            });            
        };
        if (rec.data.Type==2) {
            var id=rec.data.Job; 
            App.reset(App.get('TAffaire')); 
            App.DB.get('sapei://job{*,axe.Axe,axe.dpt.IdDepartement}?Id_job='+id,App.get('TAffaire'),function(response) {

                response=response.data[0];
                App.get('TAffaire combo#cboservice').getStore().getProxy().extraParams.Id_client_origine=response.Id_contact_client;
                App.get('TAffaire combo#cboservice').getStore().load();
                App.get('TAffaire').ItemID=response.Id_job;
                App.get('TAffaire grid#gridContacts').getStore().getProxy().extraParams.Id_job=response.Id_job;
                App.get('TAffaire grid#gridContacts').getStore().load();
                var html=[
                    '<div class="job_title">',
                    response.Intitule_job,
                    '<div class="job_num">Id : ',
                    response.Id_job,
                    '</div>',
                    '</div>'				
                ];
                App.get('TAffaire panel#Title').update(html.join(''));	
                App.get('VSchedulerMain').hide();
                var btns=App.getAll('menu>menuitem');
                for (var i=0;i<btns.length;i++) {
                    if (btns[i].itemId=="mnu_aff_close") btns[i].show();  
                };
                App.get('TAffaire').show();		
            });            
        };
    },
    hide_tip: function() {
        $('.x-tip').hide();  
    },
    schedule_tip: function(view, rec, e, eOpts) {
        view.tip = Ext.create('Ext.tip.ToolTip', {
            html: '...',
            listeners: {
                beforeshow: function updateTipBody(tip) {
                    if (!rec.data.Type) {
                        var id=rec.data.Job; 
                        App.DB.get('sapei://job{*}?Id_job='+id,function(e,rec) {
                            var html=[];
                            html.push("<b>"+rec.result.data[0].Intitule_job+"</b><br>"+rec.result.data[0].Nature_job);
                            tip.update(html.join(''));
                        });                        
                    };
                    if (rec.data.Type==1) {
                        var id=rec.data.Job; 
                        App.DB.get('sapei://job{*}?Id_job='+id,function(e,rec) {
                            var html=[];
                            html.push("<b>"+rec.result.data[0].Intitule_job+"</b><br>"+rec.result.data[0].Nature_job);
                            tip.update(html.join(''));
                        });
                    };
                    if (rec.data.Type==2) {
						var id=rec.data.Job; 
                        App.DB.get('sapei://job{*}?Id_job='+id,function(e,rec) {
                            var html=[];
                            html.push("<b>"+rec.result.data[0].Intitule_job+"</b><br>"+rec.result.data[0].Nature_job);
                            tip.update(html.join(''));
                        });
                    };
                    
                }
            }
        });
        view.tip.showAt(e.getXY());
    },
    read_only: function() {
        return false;  
    },
    contacts_context: function(view, rec, node, index, e)
    {
		e.stopEvent();
        var me=this;
        var items=[];
        items.push({
            itemId: 'ctx-grid-mail',
            text: rec.data.Mail_contact_client 
        });
        items.push({
					itemId: 'ctx-grid-delete',
					text: "Supprimer"
        });
		var x=Ext.create('Ext.menu.Menu',{
			items: items
		});
		x.on('click',function(z,p) {
			if (p.itemId=="ctx-grid-delete") {
                App.DB.del('sapei://job_contacts?Id_job_contact='+rec.data.Id_job_contact,function(o) {
                    App.get('TAffaire grid#gridContacts').getStore().load();        
                });
            };
            if (p.itemId=="ctx-grid-mail") {
                window.location="mailto:"+p.text;
            }
        });
		x.showAt(e.getXY());
		return false;        
    },
    contacts_choose: function(p,record)
    {
        App.DB.post('sapei://job_contacts',{
            Id_job: App.get('TAffaire').ItemID,
            Id_client: record.data.Id_contact_client
        },function(o) {
            App.get('TAffaire grid#gridContacts').getStore().load();
            p.up('window').close();
        });
    },
    newaxe_axe_onchange: function()
    {
        if (App.get('AffairesVNewAxe combo#cbo_axe').getValue()==3) 
            App.get('AffairesVNewAxe textfield#axe').setValue("multi-axes"); 
        else 
            App.get('AffairesVNewAxe textfield#axe').setValue(App.get('AffairesVNewAxe combo#cbo_axe').getRawValue()+App.get('AffairesVNewAxe combo#cboDepartement').getRawValue().split(' - ')[0]);      
    },
    newaxe_dpt_onchange: function(p)
    {
        if (App.get('AffairesVNewAxe combo#cbo_axe').getValue()==3) 
            App.get('AffairesVNewAxe textfield#axe').setValue("multi-axes"); 
        else 
            App.get('AffairesVNewAxe textfield#axe').setValue(App.get('AffairesVNewAxe combo#cbo_axe').getRawValue()+App.get('AffairesVNewAxe combo#cboDepartement').getRawValue().split(' - ')[0]); 
    },
    Task_edit: function()
    {
        var me=this;
        var records = App.get('TAffaire grid#tasks').getStore().getRange();
        for (var i=0;i<records.length;i++) {
            var rec=records[i];
            if (rec.dirty) {
                var id=rec.data.Id;
                var step=-1;
                if (rec.data.step=="Effectué") step=1;
                if (rec.data.step=="En cours") step=2;
                if (rec.data.step=="Non réalisé") step=3;
                if (rec.data.step=="Programmé") step=4;
                if (rec.data.step=="Reporté") step=5;
                if (rec.data.step=="-") step=0;
                App.DB.post('sapei://ope',{
                    Id_ope: id,
                    Stat: step
                },function(e,r) {
                    App.Tasks.getAll({id_job: App.get('TAffaire').ItemID},me.TAffaire_update);
                });
            }
        };
    },
    Task_delete: function(view, rec, node, index, e) {
		e.stopEvent();
        var me=this;
		var x=Ext.create('Ext.menu.Menu',{
			items: [
				{
					itemId: 'ctx-grid-delete',
					text: "Supprimer"
				}				
			]
		});
		x.on('click',function(z,p) {
			if (p.itemId=="ctx-grid-delete") {
                App.DB.get('sapei://ope?Id_ope='+rec.data.Id,function(e,response) {
                    var skills=response.result.data[0].Id_skills;
                    var users=response.result.data[0].Id_users;
                    if (skills) console.log(skills);
                    if (users) console.log(users);
                    App.DB.del('sapei://ope?Id_ope='+rec.data.Id,function(response) {
                       if (skills) {
                            App.DB.del('sapei://schedule_skills?Id='+skills,function(e){
                                console.log(e);
					           App.Tasks.getAll({id_job: App.get('TAffaire').ItemID},me.TAffaire_update);
					           App.notify('Enregistrement supprimé.');                            
                            });  
                       };
                       if (users) {
                            App.DB.del('sapei://schedule_users?Id='+users,function(e){
                               App.Tasks.getAll({id_job: App.get('TAffaire').ItemID},me.TAffaire_update);
					           App.notify('Enregistrement supprimé.');                             
                            });  
                       };
				    });                    
                });

			}
		});
		x.showAt(e.getXY());
		return false;
    },
    on_add_contact: function()
    {
        App.view.create('VContacts',{modal: true}).show();
    },
    Contacts_onshow: function()
    {
        App.get('Contacts grid').getStore().getProxy().extraParams.Id_client_origine=App.get('TAffaire combo#cboclient').getValue();
        App.get('Contacts grid').getStore().load();
    },
    cbocontact_onselect: function(p)
    {
        App.DB.get('sapei://contact_client?Id_contact_client='+p.getValue(),App.get('TAffaire panel#panelContacts'));
    },
    cboservice_onselect: function(p)
    {
        App.reset(App.get('TAffaire panel#panelContacts'));
        var zobj=App.getData(p.up('panel'));
        zobj.Id_job=p.up('panel').up('panel').ItemID;
        App.DB.post('sapei://job',zobj,function(){});
        App.get("TAffaire combo#cbocontact").getStore().getProxy().extraParams.Id_client_rattache=p.getValue();
        App.get("TAffaire combo#cbocontact").getStore().load();
        App.get("TAffaire combo#cbocontact").setValue('');
    },
    cboclient_onselect: function(p)
    {
        App.reset(p.up('panel'),p);
        var zobj=App.getData(p.up('panel'));
        zobj.Id_job=p.up('panel').up('panel').ItemID;
        App.DB.post('sapei://job',zobj,function(){});
        App.get("TAffaire combo#cboservice").getStore().getProxy().extraParams.Id_client_origine=p.getValue();
        App.get("TAffaire combo#cboservice").getStore().load();
        App.get("TAffaire combo#cboservice").getStore().on('load',function(s) {
            if (s.totalCount==1) {
                    App.get("TAffaire combo#cboservice").setValue(s.data.items[0].data.Id_client_rattache);
                    App.get("TAffaire combo#cbocontact").getStore().getProxy().extraParams.Id_client_rattache=s.data.items[0].data.Id_client_rattache;
                    App.DB.post('sapei://job',{
                        Id_job: p.up('panel').up('panel').ItemID,
                        Id_client_rattache: s.data.items[0].data.Id_client_rattache
                    },function(){});                    
                    App.get("TAffaire combo#cbocontact").getStore().load();
                    App.get("TAffaire combo#cbocontact").getStore().on('load',function(s) {
                        if (s.totalCount==1) {
                            App.get("TAffaire combo#cbocontact").setValue(s.data.items[0].data.Id_contact_client);
                            App.DB.get('sapei://contact_client?Id_contact_client='+s.data.items[0].data.Id_contact_client,App.get('TAffaire panel#panelContacts'));
                            App.DB.post('sapei://job',{
                                Id_job: p.up('panel').up('panel').ItemID,
                                Id_client_principal: s.data.items[0].data.Id_contact_client
                            },function(){});
                        }
                    });
            }
        });
    },
    affaire_combo_update: function(p) {
		if (p.bind) {
			// on met à jour l'enregistrement
			var obj={};
			obj.Id_job=App.get('TAffaire').ItemID;
			obj[p.bind]=p.getValue();
            if (!obj.Id_job) alert("somethin' went wrong");
			App.DB.post('sapei://job',obj,function(e,r) {
				console.log(e);
				console.log(r);
			});
		}
	},
    affaire_combo_change: function(p) {
        /*if (p.itemId=="cboclient") {
            App.get('TAffaire combo#cboservice').getStore().getProxy().extraParams.Id_client_origine=p.getValue();
            App.get('TAffaire combo#cboservice').getStore().load();
        };
        if (p.itemId=="cboservice") {
            p.getStore().getProxy().extraParams.Id_client_origine=App.get('TAffaire combo#cboclient').getValue();
            p.getStore().load();
            p.getStore().on('load',function() {
                App.get('TAffaire combo#cbocontact').getStore().getProxy().extraParams.Id_client_rattache=p.getValue();
                App.get('TAffaire combo#cbocontact').getStore().load();
            });
        };
        */
        if (p.itemId=="cbocontact") {
            p.getStore().getProxy().extraParams.Id_client_rattache=App.get('TAffaire combo#cboservice').getValue();
            p.getStore().load();            
            p.getStore().on('load',function() {
                App.DB.get('sapei://contact_client?Id_contact_client='+p.getValue(),App.get('TAffaire panel#panelContacts'));
            });            
        };
    },
	VBlog_close: function()
	{
		App.get('TAffaire button#ecrire').setDisabled(false);
		App.get('TAffaire button#ecrire2').setDisabled(false);
	},
	write_to_blog: function(p)
	{
		var blog=App.get(p.up('window'),'htmleditor#blogme').getValue();
		if (blog) {
            if (App.get(p.up('window'),'datefield').getValue()) var madate=App.get(p.up('window'),'datefield').getValue(); else madate=new Date();
			App.DB.post('sapei://wiki',{
				poster: Auth.User.uid,
                date: madate,
				job: App.get('TAffaire').ItemID,
				blog: blog
			},function(r) {
				App.notify('Votre commentaire a été posté.');
                App.IO.send("#UPDATEMSG",{
                    poster: Auth.User.uid,
                    job: App.get('TAffaire').ItemID
                },"*");
                App.IO.send("#UPDATEMSG",App.get('TAffaire').ItemID,"*")
                App.IO.send("#AFF"+App.get('TAffaire').ItemID,App.get('TAffaire').ItemID,"*");
				p.up('window').close();
			});
		};
	},
	ecrire: function(p)
	{
		p.setDisabled(true);
		App.view.create('VBlog',{modal: true}).show();
	},
	save_task: function(p)
	{
        var me=this;
		if (!App.get('VScheduler combo#type_ope').getValue()) {
			alert('Vous devez renseigner la nature de la tâche');
			return;
		};
		p.setDisabled(true);
		var posts=[];
        if (App.get('VScheduler combo#type_ope').getValue()*1<4) {
            for (var el in this.TASK_USER) posts.push({
                Id_job: App.get('TAffaire').ItemID,
                Id_users: el,
                Stat: 4,
                type_ope: App.get('VScheduler combo#type_ope').getValue()
            });
        } else {
            for (var el in this.TASK_USER) posts.push({
                Id_job: App.get('TAffaire').ItemID,
                Id_users: el,
                Stat: 6,
                type_ope: App.get('VScheduler combo#type_ope').getValue()
            });            
        };
		for (var el in this.TASK_SKILLS) posts.push({
			Id_job: App.get('TAffaire').ItemID,
			Id_skills: el,
            Stat: 4,
			type_ope: App.get('VScheduler combo#type_ope').getValue()
		});        
		// Mise à jour de l'opération
		App.DB.post('sapei://ope',posts,function(r) {
			App.notify("La tâche a bien été enregistrée.");
            App.Tasks.getAll({id_job: App.get('TAffaire').ItemID},me.TAffaire_update);
			p.up('window').close();
		});
	},
    schedule_agents_context: function(scheduler, eventRecord, e) {
        e.stopEvent();
		var p=this;
		var menu = Ext.create('Ext.menu.Menu', {
			items: [
            {
                text: "Supprimer",
                handler: function() {
                    console.log(eventRecord);
                    App.DB.del('sapei://schedule_users?id='+eventRecord.data.Id,function() {
						delete p.TASK_USER[eventRecord.data.Id];
                        scheduler.getEventStore().load();
                    })
                }
            }
			]
		});
		menu.showAt(e.getXY());                
    },
    schedule_materiels_context: function(scheduler, eventRecord, e) {
        e.stopEvent();
		var p=this;
		var menu = Ext.create('Ext.menu.Menu', {
			items: [
            {
                text: "Supprimer",
                handler: function() {
                    App.DB.del('sapei://schedule_skills',[eventRecord.data.Id],function() {
						delete p.TASK_SKILLS[eventRecord.data.Id];
                        scheduler.getEventStore().load();
                    })                    
                }
            }
			]
		});
		menu.showAt(e.getXY());
    },
	sch_agents_dragcreate: function(scheduler,record)
	{
		var p=this;
        if (record[0]) record=record[0];
        var Cls="";
        if (App.get('VScheduler combo#type_ope').getValue()==1) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==2) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==3) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==4) Cls="orange";
        if (App.get('VScheduler combo#type_ope').getValue()==5) Cls="red";
        
		var obj={
			Cls: Cls,
			EndDate: record.data.EndDate,
			Name: record.data.Name,
			ResourceId: record.data.ResourceId,
			StartDate: record.data.StartDate,
			User: Auth.User.uid,
            Job: App.get('TAffaire').ItemID
		};
		record.data.User=Auth.User.uid;
		if (record.data.Id!=0) obj.Id=record.data.Id;
		App.DB.post("sapei://schedule_users",obj,function(c) {
			p.TASK_USER[c.insertId]=obj;
			scheduler.getEventStore().load();
		});
	},
	sch_materiels_dragcreate: function(scheduler,record)
	{
		var p=this;
        if (record[0]) record=record[0];
        var Cls="";
        if (App.get('VScheduler combo#type_ope').getValue()==1) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==2) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==3) Cls="yellow";
        if (App.get('VScheduler combo#type_ope').getValue()==4) Cls="orange";
        if (App.get('VScheduler combo#type_ope').getValue()==5) Cls="red";        
		var obj={
			Cls: Cls,
			EndDate: record.data.EndDate,
			Name: record.data.Name,
			ResourceId: record.data.ResourceId,
			StartDate: record.data.StartDate,
			User: Auth.User.uid,
            Job: App.get('TAffaire').ItemID
		};
		record.data.User=Auth.User.uid;
		if (record.data.Id!=0) obj.Id=record.data.Id;
		App.DB.post("sapei://schedule_skills",obj,function(c) {
			p.TASK_SKILLS[c.insertId]=obj;
			scheduler.getEventStore().load();            
		});
	},	
	AffairesVNew_onshow: function(p)
	{
		App.get('AffairesVNew textfield#whoami').setValue(Auth.User.uid);
	},
    openAffaire: function(p)
    {
		App.reset(App.get('TAffaire')); 
        var record=App.get('VOpenAffaire grid').getSelectionModel().getSelection();
        if (record.length<=0) return;
        record=record[0];
		App.DB.get('sapei://job{*,axe.Axe,axe.dpt.IdDepartement}?Id_job='+record.data.Id_job,App.get('TAffaire'),function(response) {
			response=response.data[0];
            App.get('TAffaire combo#cboservice').getStore().getProxy().extraParams.Id_client_origine=response.Id_contact_client;
            App.get('TAffaire combo#cboservice').getStore().load();
			App.get('TAffaire').ItemID=response.Id_job;
            App.get('TAffaire grid#gridContacts').getStore().getProxy().extraParams.Id_job=response.Id_job;
            App.get('TAffaire grid#gridContacts').getStore().load();
			var html=[
				'<div class="job_title">',
				response.Intitule_job,
				'<div class="job_num">Id : ',
				response.Id_job,
				'</div>',
				'</div>'				
			];
			p.up('window').close();	
			App.get('TAffaire panel#Title').update(html.join(''));	
            App.get('VSchedulerMain').hide();
            var btns=App.getAll('menu>menuitem');
            for (var i=0;i<btns.length;i++) {
                if (btns[i].itemId=="mnu_aff_close") btns[i].show();  
            };
			App.get('TAffaire').show();		
		});        
    },
	grid_open_dblclick: function(p,record)
	{
        App.info.loading('Veuillez patienter...');
		App.reset(App.get('TAffaire')); 
        App.get('mainform FilterBox#FilterPanel').hide();
		App.DB.get('sapei://job{*,axe.Axe,axe.dpt.IdDepartement}?Id_job='+record.data.Id_job,App.get('TAffaire'),function(response) {
            console.log(response);
			response=response.data[0];
            App.get('TAffaire combo#cboservice').getStore().getProxy().extraParams.Id_client_origine=response.Id_contact_client;
            App.get('TAffaire combo#cboservice').getStore().load();
			App.get('TAffaire').ItemID=response.Id_job;
            App.get('TAffaire grid#gridContacts').getStore().getProxy().extraParams.Id_job=response.Id_job;
            App.get('TAffaire grid#gridContacts').getStore().load();
			var html=[
				'<div class="job_title">',
				response.Intitule_job,
				'<div class="job_num">Id : ',
				response.Id_job,
				'</div>',
				'</div>'				
			];
			App.get("tabpanel#mainscreen").hide();
			App.get('TAffaire panel#Title').update(html.join(''));	
            App.get('VSchedulerMain').hide();
            var btns=App.getAll('menu>menuitem');
            for (var i=0;i<btns.length;i++) {
                if (btns[i].itemId=="mnu_aff_close") btns[i].show();  
            };
            App.info.hide();
			App.get('TAffaire').show();		
		});
	},
	cbo_dpt_onselect: function(p)
	{
		App.get('AffairesVNew combo#cbo_axe').getStore().getProxy().setExtraParam('Id_Dpt',p.getValue());
		App.get('AffairesVNew combo#cbo_axe').getStore().load();
	},
	// prevent to modify event by anyone but the creator
	sch_agents_beforeeventresize: function ( me, record, e, options ) {
		console.log(record);
		if (record.data.Job!=App.get('TAffaire').ItemID) return false;	
	},
	sch_agents_beforeeventdrag: function ( me, record, e, options ) {
		console.log(record);
		if (record.data.Job!=App.get('TAffaire').ItemID) return false;	
	},
	sch_materiels_beforeeventresize: function ( me, record, e, options ) {
		if (record.data.Job!=App.get('TAffaire').ItemID) return false;	
	},
	sch_materiels_beforeeventdrag: function ( me, record, e, options ) {
		if (record.data.Job!=App.get('TAffaire').ItemID) return false;	
	},
	newtask_onclick: function(p)
	{
		App.view.create("VScheduler",{
			modal: true
		}).show();
	},
	VScheduler_onshow: function(me)
	{
	    function LastDayOfMonth(year,month) {
		  function isBissextile(n) { return n % 4 === 0 && (n % 400 === 0 || n % 100 !== 0) ? true : false; }
		  if (month==1) {
			  if (isBissextile(year))
				return 29;
			  else
				return 28;
		  	};
		  return new Date(year, month+1, 0).getDate();
	    }; 		
        this.TASK_SKILLS={};
        this.TASK_USER={};
		// sync scrollbars
		App.get('VScheduler schedulergrid#schedule_agents').getSchedulingView().getEl().on('scroll', function(e, t) {
			App.get('VScheduler schedulergrid#schedule_materiels').getSchedulingView().getEl().dom.scrollLeft = t.scrollLeft;
		});
		App.get('VScheduler schedulergrid#schedule_materiels').getSchedulingView().getEl().on('scroll', function(e, t) {
			App.get('VScheduler schedulergrid#schedule_agents').getSchedulingView().getEl().dom.scrollLeft = t.scrollLeft;
		});
		// update combo daterange
		var now = new Date();
        var year=now.getFullYear();		
        var tab=[];
		for (var i=-3;i<=3;i++) tab.push({year:year+i});
		var store_year = App.store.create({
			fields: [
				"year"
			],
			data: tab
		});
		App.get(me,'combo#selectAnnee').bindStore(store_year);
		App.get(me,'combo#selectAnnee').setValue(now.getFullYear());	     
		var mm = ((now.getMonth() + 1) >= 10) ? (now.getMonth() + 1) : '0' + (now.getMonth() + 1);
        App.get(me,'combo#selectMonth').setValue(parseInt(mm)-1);
        App.get(me,'combo#selectMonth').on('select',function(p) {
          var d=new Date();
          d.setDate(1);
          d.setMonth(p.getValue());
          d.setYear(App.get(me,'combo#selectAnnee').getValue());
		  App.get(me,'schedulergrid#schedule_materiels').setStart(d);
          App.get(me,'schedulergrid#schedule_agents').setStart(d);
          var e=new Date();          
          e.setMonth(p.getValue());
          e.setYear(App.get(me,'combo#selectAnnee').getValue());
          e.setDate(LastDayOfMonth(App.get(me,'combo#selectAnnee').getValue(),p.getValue()));
          App.get(me,'schedulergrid#schedule_materiels').setEnd(e);
          App.get(me,'schedulergrid#schedule_agents').setEnd(e);
        });
        App.get(me,'combo#selectAnnee').on('select',function(p) {
          var d=new Date();
          d.setDate(1);
          d.setMonth(App.get(me,'combo#selectMonth').getValue());
          d.setYear(p.getValue());
		  App.get(me,'schedulergrid#schedule_materiels').setStart(d);
          App.get(me,'schedulergrid#schedule_agents').setStart(d);            
          var e=new Date();      
          e.setMonth(App.get(me,'combo#selectMonth').getValue());
          e.setYear(p.getValue());
          e.setDate(LastDayOfMonth(p.getValue(),App.get(me,'combo#selectMonth').getValue()));
		  App.get(me,'schedulergrid#schedule_materiels').setEnd(e);
          App.get(me,'schedulergrid#schedule_agents').setEnd(e);
        });
        // set scheduler begin date by minimum of date 
        App.DB.get('sapei://schedule_users{Id, Job, StartDate}?Job='+App.get('TAffaire').ItemID,function(e,r) {
            if (r.result.data.length>0) {
                var debut=r.result.data[0].StartDate.toDate();
                App.DB.get('sapei://schedule_skills{Id, Job, StartDate}?Job='+App.get('TAffaire').ItemID,function(e,r) {            
                    var d2=r.result.data[0].StartDate.toDate();
                    if (d2<debut) debut=d2;
                    App.get(me,'schedulergrid#schedule_materiels').setStart(debut);
                    App.get(me,'schedulergrid#schedule_agents').setStart(debut);
                    App.get(me,'schedulergrid#schedule_agents').setEnd(new Date(new Date().setMonth(new Date().getMonth()+4)));
                    App.get(me,'schedulergrid#schedule_materiels').setEnd(new Date(new Date().setMonth(new Date().getMonth()+4)));
                });        
            };
        });
	},
    TAffaire_update: function(e,r) {

            if (r.result.data) {
                var data=[];
                var total=0;
                for (var i=0;i<r.result.data.length;i++) {
                    if (r.result.data[i].Stat<6) total++;
                };
                var inc=0;
                for (var i=0;i<r.result.data.length;i++) {
                    if (r.result.data[i].Stat==1) inc++;
 					if (r.result.data[i].skillsD0) {
                        var libelle='<b>'+r.result.data[i].Libelle_materiel+'</b>\n<i>'+r.result.data[i].Porteur_libelle+'</i>';
                        var periode="Du "+r.result.data[i].skillsD0.toDate().toString("dd/MM/yyyy")+" au "+r.result.data[i].skillsD1.toDate().toString("dd/MM/yyyy");
                    } else {
						var libelle=r.result.data[i].Nom+'\n'+r.result.data[i].Prenom;
                        var periode="Du "+r.result.data[i].userD0.toDate().toString("dd/MM/yyyy")+" au "+r.result.data[i].userD1.toDate().toString("dd/MM/yyyy");
                    };
                    var obj={
                        Id: r.result.data[i].Id_ope,
                        libelle: libelle,
                        libelle_ope: r.result.data[i].libelle_ope,
                        periode: periode,
                        step: r.result.data[i].Lib_step
                    };
                    data.push(obj);
                };
                if (total>0) {
                    App.get('TAffaire chart').getStore().loadData([{
                        name: "test",
                        data1: (inc/total)*100
                    }]);
                    App.get('TAffaire chart').redraw();
                    // on met à jour l'affaire
                    App.DB.post('sapei://job',{
                        Id_job: App.get('TAffaire').ItemID,
                        avancement: inc,
                        total: total
                    },Ext.emptyFn);
                };
                App.get('TAffaire grid#tasks').getStore().loadData(data);
            };
            
    },
    Update_Message: function(data){
        App.DB.get('sapei://wiki{id}?job='+data,function(r) {
            console.log(r);
            if (r.data.length==0) {
                if (App.get('TAffaire panel#timeline').isVisible()) App.get('TAffaire panel#timeline').update("");
                if (App.get('TAffaire panel#timeline2').isVisible()) App.get('TAffaire panel#timeline2').update("");				
            };
            //if (r.data.length!=App.get('TAffaire').wiki) {
                App.DB.get('sapei://wiki{date-,blog,poster->bpclight_agents{prenom+" "+nom=nomprenom}}?job='+AFFAIRE_ID,function(e,r) {
                    var html='<li><p class="timeline-date">%DATE%</p><div class="timeline-content"><h3>%POSTER%</h3><p>%COMMENT%</p></div></li>';
                    var tpl=[];
                    for (var i=0;i<r.result.data.length;i++) {
                        var results=html;
                        results=results.replace('%DATE%',r.result.data[i].date.toDate().toString('dd/MM/yyyy hh:mm'));
                        results=results.replace('%POSTER%',r.result.data[i].nomprenom);
                        results=results.replace('%COMMENT%',r.result.data[i].blog);
                        tpl.push(results);
                    };
                    results='<ul class="timeline">'+tpl.join('')+'</ul>';
                    if (App.get('TAffaire panel#timeline').isVisible()) App.get('TAffaire panel#timeline').update(results);
                    if (App.get('TAffaire panel#timeline2').isVisible()) App.get('TAffaire panel#timeline2').update(results);
                    App.get('TAffaire').wiki=r.result.data.length;
                });				
            //};
        });            
    },
    broadcastUpdate: function(data)
    {

        // data.poster data.jpb
        App.DB.get('sapei://job?id_job='+data.job,function(e,o){
            App.DB.get('sapei://bpclight_agents?kage='+data.poster,function(e,oo) {
                if (oo.result.data.length>0) {
                    var user=oo.result.data[0];
                    var job=o.result.data[0];
                    if (user.Kage!=Auth.User.uid) App.notify(user.Prenom+' '+user.Nom+' a posté un nouveau message concernant l\'affaire :<br><b>'+job.Intitule_job+'</b>');
                };
                console.log(oo);
                console.log(o);
            });
        });
    },
	TAffaire_onshow: function(p)
	{
		// Tout le monde a accès aux tâches
        //if (Auth.User.profiles.indexOf('Admin')>-1) 
		App.get('TAffaire button#newtask').show();
		p.wiki=0;
        App.Tasks.getAll({id_job: p.ItemID},this.TAffaire_update);        
        AFFAIRE_ID=p.ItemID;
        App.IO.subscribe("#UPDATEMSG");
        App.IO.subscribe("#AFF"+AFFAIRE_ID);
        App.IO.on('#AFF'+AFFAIRE_ID,this.Update_Message);
        App.IO.on('#UPDATEMSG',this.broadcastUpdate);
        this.Update_Message(AFFAIRE_ID);
	},
	ctxClose_onclick: function(me)
	{	
		// refresh the store
		App.get('AffairesVNew combo#cbo_axe').getStore().load();
		// before we close
		me.up('window').close();
	},
	gAxe_context: function(view, rec, node, index, e) {
		e.stopEvent();
		var x=Ext.create('Ext.menu.Menu',{
			items: [
				{
					itemId: 'ctx-grid-delete',
					text: "Supprimer"
				}				
			]
		});
		x.on('click',function(z,p) {
			if (p.itemId=="ctx-grid-delete") {
				App.DB.del('sapei://axe?id='+rec.data.Id_axe,function(response) {
					console.log(response);
					App.get('AffairesVNewAxe grid').getStore().load();
					App.notify('Enregistrement supprimé.');
				});
			}
		});
		x.showAt(e.getXY());
		return false;
    },
	add_new_axe: function(p)
	{
		App.DB.post('sapei://axe',p.up('window'),function() {
			App.reset(p.up('window'));
			App.get('AffairesVNewAxe grid').getStore().load();
		});
	},
	newAxeBtn_onclick: function(p)
	{
		App.view.create('Affaires.VNewAxe',{
			modal: true
		}).show();
	},
	VNewPost_onclick: function(p)
	{
		p.setDisabled(true);
		App.DB.post('sapei://job',p.up('window'),function(o) {
            console.log(o);
			App.reset(App.get('TAffaire'));
			if (o.insertId) {
                App.DB.get('sapei://job{*,axe.Axe,axe.dpt.IdDepartement}?Id_job='+o.insertId,App.get('TAffaire'),function(response) {
                    response=response.data[0];
                    App.get('TAffaire').ItemID=response.Id_job;
                    var html=[
                        '<div class="job_title">',
                        response.Intitule_job,
                        '<div class="job_num">SIGMA : ',
                        response.Num_SIGMA_job,
                        '</div>',
                        '</div>'				
                    ];
                    App.get('TAffaire panel#Title').update(html.join(''));	
                    App.get("tabpanel#mainscreen").hide();
                    var btns=App.getAll('menu>menuitem');
                    for (var i=0;i<btns.length;i++) {
                        if (btns[i].itemId=="mnu_aff_close") btns[i].show();  
                    };
                    App.get('TAffaire').show();		
                });                
				p.up('window').close();
			}
		});	
	},
	newAffaires: function(me)
	{
		App.get('TAffaire').hide();
        App.get('VSchedulerMain schedulergrid#schedule_materiels').getEventStore().load();
        App.get('VSchedulerMain schedulergrid#schedule_agents').getEventStore().load();
        App.get("tabpanel#mainscreen").show();
		delete App.get('TAffaire').wiki;
		//if (App.get('TAffaire').runner) window.clearInterval(App.get('TAffaire').runner);	
		App.view.create('Affaires.VNew',{
			modal: true
		}).show();
	},
	openAffaires: function(me)
	{
		/*App.get('TAffaire').hide();
        App.get("tabpanel#mainscreen").show();
        App.get('VSchedulerMain schedulergrid#schedule_materiels').getEventStore().load();
        App.get('VSchedulerMain schedulergrid#schedule_agents').getEventStore().load();
		delete App.get('TAffaire').wiki;
		if (App.get('TAffaire').runner) window.clearInterval(App.get('TAffaire').runner);
		App.view.create('VOpenAffaire',{modal: true}).show();*/
	},
    closeAffaire: function(p)
    {
        var btns=App.getAll('menu>menuitem');
        for (var i=0;i<btns.length;i++) {
            if (btns[i].itemId=="mnu_aff_close") btns[i].hide();  
        };
        App.get('VOpenAffaire grid#open').getStore().load();
        App.get("TAffaire").hide();
        App.get('VSchedulerMain schedulergrid#schedule_materiels').getEventStore().load();
        App.get('VSchedulerMain schedulergrid#schedule_agents').getEventStore().load();
        App.get("tabpanel#mainscreen").show();
    },
    Contacts: function()
    {
        App.view.create('VCarnet',{modal: true}).show();  
    },
    AdminGestion: function()
    {
        App.view.create('admin.VBackoffice',{modal: true}).show();  
    },
	Menu_onClick: function(p)
	{
		if (p.itemId) {
			switch(p.itemId) {
				case "mnu_aff_new":
					this.newAffaires();
					break;
				case "mnu_aff_open":
					this.openAffaires();
					break;
                case "mnu_aff_close":
                    this.closeAffaire();
                    break;
                case "mnu_contacts":
                    this.Contacts();
                    break;
                case "mnu_admin_gestion":
                    this.AdminGestion();
                    break;
				break;
				default:
			}
		};			
	},
	onLoad: function()
	{        
		// form loaded
		Auth.login(function(auth) {
            App.info.loading("Veuillez patienter");
            if (Auth.User.profiles.indexOf('Admin')>-1) {
                var btns=App.getAll('menu>menuitem');
                for (var i=0;i<btns.length;i++) {
                    if (btns[i].itemId=="mnu_aff_new") btns[i].show();
                };
                // si je suis admin, je sélectionne par pilote
                var store=App.get('VOpenAffaire grid#open').getStore();
                store.getProxy().extraParams.Id_pilote_job=Auth.User.uid;
                store.load();
                store.on('load',function(){
                    App.info.hide();    
                });                        
            };            
            if (Auth.User.profiles.indexOf('Users')>-1) {
                // si je suis utilisateur, je sélectionne par mes affaires
                App.DB.get('sapei://schedule_users{Job}?ResourceId='+Auth.User.uid,function(e,r){
                    if (r.result.data.length>0) {
                        var jobs=[];
                        for (var i=0;i<r.result.data.length;i++) jobs.push(r.result.data[i].Job);
                        var store=App.get('VOpenAffaire grid#open').getStore();
                        store.getProxy().extraParams.Id_job='['+jobs.join(',')+']';
                        store.load();
                        store.on('load',function(){
                            App.info.hide();    
                        });                        
                    } else App.info.hide();
                });
            }
		});
	}
	
	
});
