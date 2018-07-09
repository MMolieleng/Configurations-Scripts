#########################################################
#							#
#							#
#	WORKING DEPLOYMENT SCRIPT FOR 			#
#		   v 0.19				#
#							#
#							#
#########################################################

VERSION=0.1.31
BNA_FILE="bps@$VERSION.bna"
NETWORK="bps"
CARD="bps.car"

composer card delete --card admin@bps

composer card list

composer archive create -t dir -n .

composer network install -a $BNA_FILE --card PeerAdmin@hlfv1

composer network start --networkName $NETWORK --networkVersion $VERSION --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file bps.card

composer card import -f *.card

composer card list

composer network ping -c admin@bps

composer-rest-server
