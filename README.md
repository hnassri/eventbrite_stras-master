# README
L'application sera une version minimaliste (mais fonctionnelle, c'est le plus important) d'Eventbrite, un site qui propose plein d'événements que tu peux rejoindre. Les événements ne concernent qu'une seule ville, la ville où tu te trouves.Nous avons créer une base de données, composée de 3 models:
- User
- Event
- Attendance (table réunissant les events et les utilisateurs qui participent aux events)Les attributs qui composent la table User:
- email
- description
- first_name
- last_nameLes attributs qui composent la table Event:
- start_date
- duration
- title
- description
- price
- locationLes attributs qui composent la table Attendance:
- user_id
- event_id
Comment l'utiliser?
rails db:create
rails db:migrate
rails db:seed

Attention cette app est en production. C'est à dire qu'il faut mettre vos clés d'api dans un fichier .env que vous créer.Si vous voulez ne pas utiliser en production, vous n'avez qu'à dégrisé les lignes dans config/environments/development.rb

Produit par NASSRI Hamdi
