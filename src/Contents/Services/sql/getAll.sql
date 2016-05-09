SELECT ope.Id_ope,
       type_ope.libelle_ope,
       type_ope.order_id,
       ope.type_ope,
       ope.Stat,
       ope.Id_job,
       schedule_skills.StartDate skillsD0,
       schedule_skills.EndDate skillsD1,
       steps.Lib_step,
       schedule_users.ResourceId,
       schedule_users.Name,
       schedule_users.StartDate userD0,
       schedule_users.EndDate userD1,
       schedule_skills.ResourceId,
       ope.Id_users,
       porteur.Porteur_libelle,
       outils.Libelle_materiel,
       bpclight_agents.Nom,
       bpclight_agents.Prenom,
       bpclight_agents.Kage
  FROM (((((((sapei.porteur_outils porteur_outils
              INNER JOIN sapei.porteur porteur
                 ON (porteur_outils.Id_porteur = porteur.Id_porteur))
             INNER JOIN sapei.outils outils
                ON (porteur_outils.Id_outils = outils.Id_materiel))
            RIGHT OUTER JOIN sapei.schedule_skills schedule_skills
               ON (schedule_skills.ResourceId =
                      porteur_outils.Id_porteur_outils))
           RIGHT OUTER JOIN sapei.ope ope
              ON (ope.Id_skills = schedule_skills.Id))
          LEFT OUTER JOIN sapei.schedule_users schedule_users
             ON (ope.Id_users = schedule_users.Id))
         LEFT OUTER JOIN sapei.bpclight_agents bpclight_agents
            ON (schedule_users.ResourceId = bpclight_agents.Kage))
        LEFT OUTER JOIN sapei.type_ope type_ope
           ON (ope.type_ope = type_ope.id_type_ope))
       INNER JOIN sapei.steps steps ON (ope.Stat = steps.Id_step)