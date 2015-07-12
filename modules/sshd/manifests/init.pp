class sshd
{
	package
	{
		"sshd": ensure => isntalled;
	 }

	file
	{
		"/etc/puppet.conf":
		source => 
		["puppet:///modules/sshd/$hostname/sshd_config.conf",
		"puppet:///modules/sshd/sshd_config.conf", ], 
	

	mode => 444,
	owner => root,
	group => root,

	require => Package["sshd"],

	}

	service
	{
		"sshd":

		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["sshd"],
		File["/etc/puppet/modules/sshd/sshd_config.conf"] ],

		subscribe => File["/etc/puppet/modules/sshd/sshd_config.conf"],

	}
 }
