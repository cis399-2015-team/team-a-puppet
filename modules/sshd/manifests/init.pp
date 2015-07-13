class sshd
{
	package
	{
		"openssh-server": ensure => isntalled;
	 }

	file
	{
		"/etc/ssh/sshd_config":
		source => 
		["puppet:///modules/sshd/$hostname/sshd_config",
		"puppet:///modules/sshd/sshd_config", ], 
	

	mode => 444,
	owner => root,
	group => root,

	require => Package["openssh-server"],

	}

	service
	{
		"ssh":

		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["openssh-server"],
		File["/etc/puppet/modules/sshd/sshd_config"] ],

		subscribe => File["/etc/puppet/modules/sshd/sshd_config"],

	}

	ssh_authorized_key {"austin-key-pair":
		user => "ubuntu",
		key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCQU3wv7wMak7CwIw9aT9iQsiLI8mEVjO2ghzYyGHXwTJ6h9bjCVuohr+QbobVl6k6nulBGw0NtiMOQ7zLLoAjHxYZEkIz/l+yWqJ8iTQQBybLNVbfIsl7n74M8hfW95K56eDi3XDQSlzsaUO80xY9DlDrPiTcKWao7gzIVu+afDEHOveqD1Ly9nyIsnddJI2EBNmBiVE/bjWH7kNSvEwqmHFz9+Uz2gmCnlWbUnwaEOOgYYzVO+D2BDmJJVxOsNfIuJcAgsZ9BxmYeG4xsbvPoTcBKcgqBqUAZus2Uj7mP/0rIaD6Qaycbw3pnWsl2BtsR+dFSWmk9yALtYUSkDt11", 
		}

	ssh_authorized_key {"alex-key-pair":
        user => "ec2-user",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQCnpZfeADh0kl/FnCYugKx0yGxq3AWuN1ND3djLU33/CTm1qkjN4Ds5a0/JV21YduEGCF1DAUYGHj+7zbYpApYl0T596iMt2v1DOIhzn5pTiAdB3UE+7r5+HMfKRkGxQ8z3cLIS7PQalJKCi3ta3+NwdpAAwaHlW5W29H/unftevB44SOfNRpzE2F7Lc8Vk4BFk8ZQM2wn6v1zbkZDYC++OW/FRwHCGaxmGI3ugxM4Oa0mIPAITU7JriYQUlrXbYQsxjlKp1o14bs5jL45vvFQHo/AwglcMsvXZImDPSPL6HomE6H02lbycKG5m7BzSYMp1MsGnSMo3TNvJsF848xq/", 
        }

	ssh_authorized_key {"brendan-key-pair":
        user => “ubuntu",
        key => "AAAAB3NzaC1yc2EAAAADAQABAAABAQChpdqsDowV+NWhVEL9epaybNAPa5R2ifjhPe7l0wUQQhLxFRVPh6q+FuCRSVRZMLgXB6z4OfXw4qCMzN3rx5yVtYmiH+w4LuNX7sr1BH+oP4LwCsRMgxR+9nHo68THMbO4GPMh9ywT6EFqUoOJEZlFQsXmgEeSDjV20G/4iffyXpFwuQ1Cr4l/Zms17XXcPm3tyVkefdg8T7KDWp6E+RWiHhe/Rf4dcyVEiKKC0OPxBg1P/jOhyp4K38UbBG6aEztox/8VJRCjZVsBWGCyASWFHneHEHI2kjHyEN0C67xlb4UsjEKo21osXZpXVLQn7rAB1aN/1XFouJ73b0lRH/4V", 
        }




 }
