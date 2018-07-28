# `nginx` server


edit `/etc/nginx/nginx.conf`, use either:
```nginx
stream {
  server {
    listen 201;
    listen 201 udp;
    proxy_pass region1.example.com:80;
  }

  server {
    listen 202;
    listen 202 udp;
    proxy_pass region2.example.com:80;
  }

  server {
    listen 301;
    listen 301 udp;
    proxy_pass region1.example.com:80;
  }
}
```

or:
```nginx
stream {
  upstream group1 {
    hash $remote_addr consistent;
    server region1.example.com:80;
    server region2.example.com:80;
  }
  
  server {
    listen 443;
    listen 443 udp;
    proxy_pass group1;
  }
}
```

drop default `http` config, if 80 is needed by other process
