SELECT ope.Id_ope,
    type_ope.libelle_ope,
    type_ope.order_id,
       ope.type_ope,
       ope.Stat,
       ope.Id_job,
       schedule_users.StartDate userD0,
       schedule_users.EndDate userD1,
       schedule_users.Name,
       steps.Lib_step,
       schedule_users.ResourceId,
       schedule_skills.Name,
       schedule_skills.StartDate skillsD0,
       schedule_skills.EndDate skillsD1,
       bpclight_agents.Nom,
       bpclight_agents.Prenom,
       bpclight_agents.Kage,
       schedule_skills.ResourceId,
       porteur.Porteur_libelle,
       outils.Libelle_materiel
  FROM (((((((sapei.schedule_users schedule_users
              INNER JOIN sapei.bpclight_agents bpclight_agents
                 ON (schedule_users.ResourceId = bpclight_agents.Kage))
             RIGHT OUTER JOIN sapei.ope ope
                ON (ope.Id_users = schedule_users.Id))
            LEFT OUTER JOIN sapei.steps steps ON (ope.Stat = steps.Id_step))
           LEFT OUTER JOIN sapei.type_ope type_ope
              ON (ope.type_ope = type_ope.id_type_ope))
          LEFT OUTER JOIN sapei.schedule_skills schedule_skills
             ON (ope.Id_skills = schedule_skills.Id))
         LEFT OUTER JOIN sapei.porteur_outils porteur_outils
            ON (schedule_skills.ResourceId = porteur_outils.Id_porteur_outils))
        LEFT OUTER JOIN sapei.outils outils
           ON (schedule_skills.ResourceId = outils.Id_materiel))
       LEFT OUTER JOIN sapei.porteur porteur
          ON (porteur_outils.Id_porteur = porteur.Id_porteur)