Jobs={

	getAll: function(o,cb) {
		var db=Jobs.using('db');
		var objs=[];
		var where=[];
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