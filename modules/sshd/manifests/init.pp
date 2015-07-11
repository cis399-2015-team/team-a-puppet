sshd
{
	package{
		"sshd": ensure => isntalled;
	 		}

	file{"/etc/puppet.conf":
		source => ["puppet:///modules/sshd/$hostname/sshd_config",
					"puppet:///modules/sshd/sshd_config", ], 
		}
		mode => 444,
		owner => root,
		group => root,

		require => Package["sshd"],
 
		service
		{
			"sshd":

		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["sshd"],
					File["/etc/sshd_config"] ],

		subscribe => File["/etc/sshd_config"],

		}
 }
