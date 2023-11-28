free -h | gawk 'BEGIN { ORS=" " }; {} ;{ if ( $1 ~ /M/ ) {print "Mem: "$3 " / " $2 }  else if ( $1 ~ /S/ ) { print "Swap: "$3 " / " $2 }} '
date
