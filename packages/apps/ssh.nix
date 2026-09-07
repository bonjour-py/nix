{writeText}: writeText "ssh" ''
  Host server
  	HostName 192.168.110.98
  Host *
  	ForwardAgent yes
''