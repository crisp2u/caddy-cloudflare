FROM caddy:builder AS caddy-builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/dulli/caddy-wol
FROM caddy:2-alpine

COPY --from=caddy-builder /usr/bin/caddy /usr/bin/caddy