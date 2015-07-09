node ip-10-0-8-251{
cron {"puppet update":
	command => "cd /etc/puppet && git pull -q origin master",
	user => root,
	minute => "*/5",
	 }
}

node ip-10-0-8-128{}

node ip-10-0-8-17{}
