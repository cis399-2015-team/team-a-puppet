class postfix
{
	package
	{
		"postfix": ensure => installed;
	 }

	file
	{
		"/etc/postfix/master.cf":
		source => 
		["puppet:///modules/postfix/$hostname/master.cf",
		"puppet:///modules/postfix/master.cf", ], 
	

	mode => 444,
	owner => root,
	group => root,

	require => Package["postfix"],

	}
	
	service
	{
		"postfix":

		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["postfix"],
		File["/etc/postfix/master.cf"] ],

		subscribe => File["/etc/postfix/master.cf"],

	}
 }
