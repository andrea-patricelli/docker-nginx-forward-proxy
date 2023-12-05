@'
#!/bin/sh
set -eu

RESOLVER=${RESOLVER:-1.1.1.1 ipv6=off}
if [ -n "$RESOLVER" ]; then
    echo "Applying: resolver $RESOLVER;"
    sed -i "s/# resolver.*/resolver $RESOLVER;/" /usr/local/nginx/conf/nginx.conf
fi

if [ $# -gt 0 ] && [ "${1#-}" != "$1" ]; then
    set -- nginx "$@"
fi

exec "$@"
'@
