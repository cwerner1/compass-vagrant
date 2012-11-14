#An example Puppet manifest to provision the message of the day:

group { "puppet":
   ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
   content => "Welcome to your Vagrant-built virtual machine!
               Managed by Puppet.\n"
}
exec {
	"apt-update":
		command  => "/usr/bin/apt-get update -y"
}


$path_sh = "/etc/profile.d/path.sh"
file { 'path.sh':
  name   => $path_sh,
  ensure => present,
  source => "/vagrant/files/path.sh",
  owner => "root",
  group => "root",
  mode => 744,
}