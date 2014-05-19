# Kibana Docker Container

## Usage

This sets up nginx and a site for the kibana static files. Currently it doesn't have any auth (using firewall rules) and can only support one elasticsearch upstream.

```shell
docker run -i -t \
  -p 8080:8080 \
  -e ES_UPSTREAM=192.168.1.1:9200 \
  -e SERVER_NAME=f.q.d.n.com \
  philk/kibana
```

## TODO

- Setup some type of auth
- Allow multiple ES_UPSTREAM servers for load-balancing and failover
- Figure out a sane way to handle nginx logs
