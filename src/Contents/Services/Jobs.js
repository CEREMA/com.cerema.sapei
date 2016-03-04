Jobs={

	getAll: function(o,cb) {        
		var db=Jobs.using('db');
		var objs=[
			"job.Id_job",
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
        o=JSON.parse(o.quest);
		for (var i=0;i<o.length;i++)
		{
			var str="";
			if (i!=0) {
				str=' '+o[i].operator+' ';
			};
			str+=o[i].name;
			str+=o[i].value;
			where.push(str);
		};		
		var sql=db.get('sapei',objs,where);
		console.log(sql);
		db.model('sapei', sql , cb);	
	}

};

module.exports=Jobs;