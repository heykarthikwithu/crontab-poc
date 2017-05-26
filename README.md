# crontab-poc
Simple Linux Crontab, to delete x time older files from a folder via shell scripts.

Run the cron for cleaning backups, current "clean-files-cron" is configured to run 24 hours once and 30 days older files to delete.

$ crontab clean-files-cron

List the cron jobs running

$ crontab -l

Remove the running cron jobs

$ crontab -r

$ tail /tmp/cron-stdout.log

$ tail /tmp/cron-stderr.log
