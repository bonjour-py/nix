{pkgs, writeShellApplication}: writeShellApplication {
  name = "work";
  runtimeInputs = with pkgs;[ 
    waypipe
    remmina
    openssh
  ];
  text = ''
    KALI="192.168.110.91"
    WINDOWS="192.168.110.92"
    if [ $# -eq 0 ]; then
        ssh -A $KALI
    elif [ "$1" = "waypipe" ]; then
        shift
        waypipe --title-prefix work --video h264 ssh $KALI "$@"
    elif [ "$1" = "wxwork" ]; then
        remmina -c "rdp://bonjour:zdU76+p0wBg=@$WINDOWS" \
            --set-option sound=local \
            --set-option scale=2 \
            --set-option multitransport=1 \
            --enable-fullscreen
    else
        echo "未知参数: $1"
        echo "用法: 无参数 | waypipe ... | wxwork"
        exit 1
    fi
  '';
}