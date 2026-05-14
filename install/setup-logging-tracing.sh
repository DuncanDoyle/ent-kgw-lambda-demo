#!/bin/sh

pushd ..

kubectl apply -f referencegrants/default/httplistenerpolicy-ingress-gw-ns-service-rg.yaml

kubectl apply -f policies/http-listener-policy.yaml

popd