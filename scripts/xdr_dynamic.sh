#!/bin/bash

# Define the DC name, node address, namespace, and sets
DC_NAME="DC3"
NODE_ADDRESS="172.29.0.4:3000"
NAMESPACE="test"
SETS="set1,set2,set3"

# Create XDR DC
echo "Creating XDR DC: $DC_NAME"
asinfo -v "set-config:context=xdr;dc=$DC_NAME"

# Add node to XDR DC
echo "Adding node $NODE_ADDRESS to DC: $DC_NAME"
asinfo -v "set-config:context=xdr;dc=$DC_NAME;add-node=$NODE_ADDRESS"

# Add namespace to XDR DC
echo "Adding namespace $NAMESPACE to DC: $DC_NAME"
asinfo -v "set-config:context=xdr;dc=$DC_NAME;namespace=$NAMESPACE"

# Set forwarding to true and specify set shipping policy
echo "Setting ship-only-specified-sets and forward=true for namespace $NAMESPACE in DC: $DC_NAME"
asinfo -v "set-config:context=xdr;dc=$DC_NAME;namespace=$NAMESPACE;forward=true;ship-only-specified-sets=true;ship-sets=$SETS"

echo "XDR configuration completed successfully!"
