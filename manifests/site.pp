node ip-10-0-8-251
{
include sshd

cron {"puppet update":
	command => "cd /etc/puppet && git pull -q origin master",
	user => root,
	minute => "*/5",
	 }
}

node ip-10-0-8-223
{
include sshd	
}

node ip-10-0-8-17
{
include sshd
}
