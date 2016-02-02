Tasks={
	getAll: function(o,cb)
	{
        var db=Tasks.using('db');
		var sql=db.sql('getAll',{});
		sql+=" WHERE Id_job="+o.id_job;
        console.log(sql);
		db.model('sapei',sql,cb);
	},
    getUsers: function(o,cb)
    {
        var db=Tasks.using('db');
        db.model('sapei','SELECT Kage, CONCAT(Nom," ",Prenom) nomprenom FROM bpclight_agents WHERE Kage in (SELECT Id_agent FROM user)',cb);
    }
};

module.exports=Tasks;