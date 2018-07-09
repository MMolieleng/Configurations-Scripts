
NETWORK_NAME="bps"
BNA_FILE="$NETWORK_NAME@$1.bna"
VERSION=$1

# FORMATING
bold=$(tput bold)
normal=$(tput sgr0)

echo "${bold}VERSION : $VERSION\n"
echo "BNA FILE VALUE : $BNA_FILE${normal}\n"

echo "\n\n${bold}===========CREATING NEW ARCHIVE FILE==============${normal}\n"
composer archive create -t dir -n . && \

echo "\n\n${bold}==========INSTALLING BUSINESS NETWORK $BNA_FILE=======${normal}\n" &&\
composer network install -a $BNA_FILE -c PeerAdmin@hlfv1 && \

cat package.json | grep \"version\": &&\

#echo "\n\n==========STARTING BUSINESS NETWORK $BNA_FILE=======\n" &&\
#composer network start --networkName $NETWORK_NAME --networkVersion $VERSION --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file bps.card &&\


echo "\n\n=============UPGRADING NETWORK =============" &&\
composer network upgrade -c PeerAdmin@hlfv1 -n $NETWORK_NAME -V $VERSION
