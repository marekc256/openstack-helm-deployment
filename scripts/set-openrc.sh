#!/bin/bash

OS_USERNAME=${OS_USERNAME:-'admin'}
OS_PASSWORD=${OS_PASSWORD:-'password'}
OS_PROJECT_NAME=${OS_PROJECT_NAME:-'admin'}
OS_PROJECT_DOMAIN_NAME=${OS_PROJECT_DOMAIN_NAME:-'default'}
OS_USER_DOMAIN_NAME=${OS_USER_DOMAIN_NAME:-'default'}

NAMESPACE=${NAMESPACE:-'openstack'}
OS_AUTH_URL=${OS_AUTH_URL:-''}

if [ -z "${OS_AUTH_URL}" ]; then
    OS_AUTH_URL="http://keystone.${NAMESPACE}.svc.cluster.local/v3"
fi

# Export openrc file
cat << EOF > "${HOME}/openrc"
#!/bin/bash

export OS_USERNAME=${OS_USERNAME}
export OS_PASSWORD=${OS_PASSWORD}
export OS_PROJECT_NAME=${OS_PROJECT_NAME}
export OS_PROJECT_DOMAIN_NAME=${OS_PROJECT_DOMAIN_NAME}
export OS_USER_DOMAIN_NAME=${OS_USER_DOMAIN_NAME}
export OS_AUTH_URL=${OS_AUTH_URL}
EOF

chmod 0744 "${HOME}/openrc"
