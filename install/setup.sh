#!/bin/sh
: "${AWS_ACCOUNT_ID:?AWS_ACCOUNT_ID must be set}"

pushd ..

# Label the gloo-system namespace. This label will be used later by the Gateway to determine from which namespaces its listeners will accept routes.
kubectl label namespaces kgateway-system --overwrite shared-gateway-access="true"

# Deploy the Gateway
#KGateway gateway deployment
kubectl create namespace ingress-gw --dry-run=client -o yaml | kubectl apply -f -
# kubectl apply -f gateways/ent-kgateway-parameters.yaml
kubectl apply -f gateways/gw.yaml

# Label the default namespace, so the gateway will accept the HTTPRoute from that namespace.
printf "\nLabel default namespace ...\n"
kubectl label namespaces default --overwrite shared-gateway-access="true"

# Reference Grants
# printf "\nDeploy Reference Grants ...\n"

# Deploy the Lambda Backend
printf "\nDeploy Lambda Backend ...\n"
envsubst '${AWS_ACCOUNT_ID}' < backends/lambda-backend.yaml | kubectl apply -f -

# HTTPRoute
printf "\nDeploy HTTPRoute ...\n"
kubectl apply -f routes/lambda-example-com-httproute.yaml

popd