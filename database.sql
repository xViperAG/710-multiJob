ALTER TABLE `players`
ADD COLUMN `job_two` TEXT NULL DEFAULT '{"name":"unemployed","onduty":true,"payment":10,"label":"Civilian","grade":{"name":"Freelancer","level":0},"isboss":false}';