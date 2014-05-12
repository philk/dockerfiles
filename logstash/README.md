# Logstash Docker Container

## Usage

I can't come up with any good way to pass a reasonable logstash config via environment variables so bind mounting a config volume is the best I can come up with. That means you should have a volume containing a `logstash.conf` file and since who knows WTF ports you'll be exporting that's up to you (or use --net=host)

```shell
docker run -i -t \
  -v /etc/logstash:/opt/logstash/etc \
  --net=host \
  philk/logstash
```
