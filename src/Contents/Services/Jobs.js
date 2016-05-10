Jobs={

	getAll: function(o,cb) {              
		var db=Jobs.using('db');
		var objs=[
			"job.Id_job",
            "job.Id_contact_client",
			"job.avancement",
			"job. total",
			"axe.Axe",
			"dpt.Lib_dpt",
			"job.Intitule_job",
			"job_statut.statut",
			"type_prestation.Libelle_type_prestation",
			"job.Date_prise_job",
			"job.Date_livrable_job",
			"job.Num_SIGMA_job",
			"client_origine.Lib_client_origine",
			"CONCAT(bpclight_agents.nom,\" \",bpclight_agents.prenom) nomprenom"
		];
		var where=[];
		if (!o.quest) o.quest="[]";

        o=JSON.parse(o.quest);
		for (var i=0;i<o.length;i++)
		{
			var str="";
			if (i!=0) {
				str=' '+o[i].operator+' ';
			};
			if (o[i].name=="Id_users") {
				str+=' Id_Job in (SELECT Job FROM schedule_users WHERE ResourceId='+o[i].value+')';
			} else {
				str+=o[i].name;
				str+=o[i].value;				
			};
			where.push(str);
		};

		if (where.length==0) where.push("-1");


		var sql=db.get('sapei',objs,where);
		console.log(sql);
		db.model('sapei', sql , cb);	
	}

};

module.exports=Jobs;