sapei
SELECT 
	$_OBJS
FROM 
	job 
	LEFT JOIN axe ON job.Id_axe=axe.Id_axe 
	LEFT JOIN dpt ON job.Id_dpt=dpt.IdDepartement 
	LEFT JOIN job_statut ON job.Statut_job=job_statut.id 
	LEFT JOIN type_prestation ON job.Id_type_prestation=type_prestation.Id_type_prestation 
	LEFT JOIN client_origine ON job.Id_contact_client=client_origine.Id_client_origine 
	LEFT JOIN bpclight_agents ON bpclight_agents.Kage=job.Id_pilote_job 
WHERE 
	$_WHERE