#!/bin/bash

set -e

kustomize build | kubectl apply -f-
