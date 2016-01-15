Tasks={
	getAll: function(o,cb)
	{
        var db=Tasks.using('db');
		var sql=db.sql('getAll',{});
		sql+=" WHERE Id_job="+o.id_job;
        console.log(sql);
		db.model('sapei',sql,cb);
	}
};

module.exports=Tasks;