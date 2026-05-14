# KGateway Lambda Demo

## Installation

Install KGateway:
```
cd install
./install-ent-kgateway-with-helm.sh
```

> NOTE
> The KGateway version that will be installed is set in a variable at the top of the `install/env.sh` configuration script.

## Setup the environment

Run the `install/setup.sh` script to setup the environment:

- Create the required namespaces
- Deploy the Gateway
- Deploy the Reference Grants
- Deploy the Lambda Backend application
- Deploy the HTTPRoute (K8S Gateway API)

```
./setup.sh
```

## Access the Lambda function

__K8S Gateway API:__

```
./curl-request-lambda.sh
```

or

```
curl -v http://lambda.example.com -d '{"Hello":"Lambda"}'
```