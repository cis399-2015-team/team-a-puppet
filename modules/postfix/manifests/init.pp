class postfix
{
	package
	{
		"postfix": ensure => installed;
	 }

	file
	{
		"/etc/postfix/main.cf":
		source => 
		["puppet:///modules/postfix/$hostname/main.cf",
		"puppet:///modules/postfix/main.cf", ], 
	

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
		File["/etc/postfix/main.cf"] ],

		subscribe => File["/etc/postfix/main.cf"],

	}
 }
