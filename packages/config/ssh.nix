{pkgs, writeTextDir}: writeTextDir "/etc/ssh/ssh_config" ''
  Host server
  	HostName 192.168.110.98
  Host work
  	HostName 192.168.110.91
  Host *
  	ForwardAgent yes
''