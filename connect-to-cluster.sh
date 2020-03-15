#!/usr/bin/env bash

PROJECT_ID=cne-devbliss
CLUSTER_NAME=cne-devbliss-dev
ZONE=europe-west4-b

# login
gcloud auth print-access-token >/dev/null 2>&1 || gcloud auth login
gcloud auth application-default print-access-token >/dev/null 2>&1 || gcloud auth application-default login
# Credentials saved to file: [/root/.config/gcloud/application_default_credentials.json]

# find & set project
[ -z "${PROJECT_ID}" ] \
    && echo "ERROR: PROJECT_ID not set" \
    && echo "find project name in list:" \
    && gcloud projects list \
    && exit 1
gcloud config set project $PROJECT_ID

# find & set cluster
[ -z "${CLUSTER_NAME}" ] \
    && echo "ERROR: CLUSTER_NAME not set" \
    && echo "find cluster name in list:" \
    && gcloud container clusters list \
    && exit 1
[ -z "${ZONE}" ] \
    && echo "ERROR: ZONE not set" \
    && echo "find cluster zone (aka location) in list:" \
    && gcloud container clusters list \
    && exit 1
gcloud container clusters get-credentials $CLUSTER_NAME --zone=$ZONE

# test if kubectl works
echo "testing if kubectl is connected to cluster"
kubectl get nodes
