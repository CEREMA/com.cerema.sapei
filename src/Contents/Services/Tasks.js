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
    },
    removeTemp: function(o,cb)
    {
        var db=Tasks.using('db');
        db.query('sapei','DELETE FROM schedule_skills WHERE job=0',function(){
            db.query('sapei','DELETE FROM schedule_users WHERE job=0',cb);
        });        
    }
};

module.exports=Tasks;