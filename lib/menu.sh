#!/bin/bash

#Menu system for launching appropriate scripts based on user choice
source qm.variables
source lib/common.sh

function banner() {
	local __version=$(egrep -Eo "[0-9].*" <<< $dockerImage)
	    
	IFS='_'; arrIN=($__version); unset IFS;

	echo -e 'Version '${arrIN[1]}' Built on Aiserchain '${arrIN[0]}'\n'
}

function readParameters() {
    POSITIONAL=()
    while [[ $# -gt 0 ]]
    do
        key="$1"

        case $key in
            create)
            option="1"
            shift # past argument            
            ;;
            join)
            option="2"
            shift # past argument            
            ;;
			attach)
            option="3"
            shift # past argument            
            ;;
			dev)
            option="4"
            shift # past argument            
            ;;
            -h|--help)
            help
            
            ;;
            *)    # unknown option
            POSITIONAL+=("$1") # save it in an array for later
            shift # past argument
            ;;
        esac
    done
    set -- "${POSITIONAL[@]}" # restore positional parameters

	if [[ ! -z $option && $option -lt 1 || $option -gt 4 ]]; then 		
		exit 1
	fi
	
	if [ ! -z $option ]; then 		
		NON_INTERACTIVE=true
	fi
    
}

function main() {

	banner
	readParameters $@

	if [ -z "$NON_INTERACTIVE" ]; then
		exit 1
	fi

	case $option in
		1)
			lib/create_network.sh $@;;
		2)
			lib/join_network.sh $@;;
		3)
			lib/attach_node.sh $@;; 
		4)
			lib/create_dev_network.sh $@;;
		5)
			flagmain=false	;;
		*)
			echo "Please enter a valid option"	;;
	esac
}

main $@

