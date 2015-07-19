class apache
{
	package
	{
		"apache2": ensure => installed;
	 }

	file
	{
		"/etc/apache2/apache2.cf":
		source => 
		["puppet:///modules/apache/$hostname/apache2.cf",
		"puppet:///modules/apache/apache2.cf", ], 
	

	mode => 444,
	owner => root,
	group => root,

	require => Package["apache2"],

	}

	service
	{
		"apache":

		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["apache2"],
		File["/etc/apache2/apache2.cf"] ],

		subscribe => File["/etc/apache2/apache2.cf"],

	}
 }
