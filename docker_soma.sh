#!/bin/bash
case "$1" in

build)

    echo "Criando o build  da image"
    docker build . -t tuxoeu/soma_2_numero:latest
    ;;

run)
    echo
    echo "rodando o containter"
    docker run -tid  --name soma_numero -p 8000:8000 tuxoeu/soma_2_numero:latest
    ;;

logs)   

    echo
    echo "Abrindo o log da container - app "
    docker logs -f soma_numero
    ;;

stop)
    echo "Parando app"
    docker stop soma_numero
    
    echo "Apagando as imagens da app"
    sleep 2
    docker rm soma_numero
    
    ;;
restart)
    $0 stop
    $0 start
    ;;
*)
    echo
    echo "Usage $0 {build|run|logs|stop|restart}"
    echo
esac

exit 0