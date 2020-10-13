today=$(date +%m-%d-%Y)
heroku pg:backups:capture && heroku pg:backups:download && mv latest.dump ./backups/pg-$today.dump
