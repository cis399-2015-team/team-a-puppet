node ip-10-0-8-251
{
include sshd
include postfix

cron {"puppet update":
	command => "cd /etc/puppet && git pull -q origin master",
	user => root,
	minute => "*/5",
	 }
}

node ip-10-0-8-223
{
include sshd
include postfix
include apache	
}

node ip-10-0-8-17
{
include sshd
include postfix
include apache
}
