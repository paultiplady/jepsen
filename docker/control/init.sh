#!/bin/bash
set -e
set -o pipefail


if [ ! -f ~/.ssh/known_hosts ]; then
    echo > ~/.ssh/known_hosts
    # Get nodes list
    # TODO: Can we do this ahead of time? Seems like we cannot, since each node's key is generated on startup.
    #  Perhaps we could just generate node keys externally and inject them all?

    # Alas there's no clean way to go from StatefulSet to list of pods.
    # https://github.com/kubernetes-client/python/issues/1167
    # Alternatively, could filter pods by `metadata.owner_references`.

    # Use the k8s API server to locate our Node pods:
    # https://kubernetes.io/docs/tasks/run-application/access-api-from-pod/#without-using-a-proxy
    # Point to the internal API server hostname
    APISERVER=https://kubernetes.default.svc

    # Path to ServiceAccount token
    SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount

    # Read this Pod's namespace
    NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)

    # Read the ServiceAccount bearer token
    TOKEN=$(cat ${SERVICEACCOUNT}/token)

    # Reference the internal certificate authority (CA)
    CACERT=${SERVICEACCOUNT}/ca.crt

    # Get the pods for the `node` StatefulSet, using a labelSelector filter.
#    curl -v --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/pods/\?labelSelector\=app\=node
    curl --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}/api/v1/namespaces/default/pods/\?labelSelector\=app\=node | jq -r .items[].metadata.name > ~/nodes

    # Scan SSH keys
    # Note, the DNS name is (pod-name).(service-name), e.g. node-0.node
    # Since k8s has DNS search-path configured for the FQDN node-0.node.default.svc.cluster.local
    # TODO: Maybe we don't need to put this in a file any more? Leave it here for now in case other bits of the system want to use it.
    while read node; do
      ssh-keyscan -t rsa "${node}.node" >> ~/.ssh/known_hosts
      ssh-keyscan -t ed25519 "${node}.node" >> ~/.ssh/known_hosts
    done <~/nodes
fi

# TODO: assert that SSH_PRIVATE_KEY==~/.ssh/id_rsa

cat <<EOF
Welcome to Jepsen on Docker
===========================

Please run \`bin/console\` in another terminal to proceed.
EOF

# hack for keep this container running
tail -f /dev/null
