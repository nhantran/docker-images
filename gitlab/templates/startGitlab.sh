#!/bin/sh

/etc/init.d/redis-server start

INSTALLED_FLAG=/root/.installed_db
if [ ! -f "$INSTALLED_FLAG" ]; then
	touch $INSTALLED_FLAG
	su git -c "cd /home/git/gitlab && echo -e \"yes\\n\" | bundle exec rake gitlab:setup RAILS_ENV=production" 
	su git -c "cd /home/git/gitlab && bundle exec rake gitlab:env:info RAILS_ENV=production"
	su git -c "cd /home/git/gitlab && bundle exec rake assets:precompile RAILS_ENV=production"
fi

sed -i -e "s/YOUR_SERVER_FQDN/$(hostname)/g" /etc/nginx/sites-available/gitlab
sed -i -e "s/YOUR_SERVER_FQDN/$(hostname)/g" /etc/nginx/sites-enabled/gitlab

service gitlab start && service nginx restart