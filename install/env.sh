#!/bin/bash
export ENT_KGATEWAY_VERSION="2.2.0-rc.2"
export ENT_KGATEWAY_HELM_VALUES_FILE="ent-kgateway-helm-values.yaml"
export K8S_GW_API_VERSION="v1.5.1"

# Controls whether we install from the standard product helm charts or from the dev charts.
export DEV_VERSION=false

export ENT_KGATEWAY_SYSTEM_NAMESPACE="kgateway-system"

export KEYCLOAK_HOST=keycloak.example.com
export KC_ADMIN_PASS=admin