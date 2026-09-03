{pkgs, writeTextDir}: writeText "ssh" ''
  Host work
  	HostName 192.168.110.91
  	ForwardAgent yes
''