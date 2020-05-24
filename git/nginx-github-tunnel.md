# `nginx` config for basic GitHub tunnel

this config setup a tcp proxy server to speed up `git` ssh and selected GitHub asset connection.

to use, add `hosts` to redirect GitHub thought the tunnel:
```shell script
# replace `???.???.???.???` with actual server ip
???.???.???.??? github.com
???.???.???.??? api.github.com
???.???.???.??? github.githubassets.com
???.???.???.??? raw.githubusercontent.com
```

the minimal server `nginx` config: (`ssl_preread` requires `nginx@>=1.11.5`)
```nginx
user www-data;
pid /run/nginx.pid;

# include /etc/nginx/modules-enabled/*.conf;
include /etc/nginx/modules-enabled/50-mod-stream.conf;

events { worker_connections 1024; }

stream {
  log_format LF_STREAM '$remote_addr [$time_local] '
                       '$protocol $status $bytes_sent $bytes_received '
                       '$session_time "$upstream_addr" '
                       '"$upstream_bytes_sent" "$upstream_bytes_received" "$upstream_connect_time"';
  access_log /var/log/nginx/access.log LF_STREAM;
  error_log  /var/log/nginx/error.log notice; # one of: debug,info,notice,warn,error,crit,alert,emerg

  # proxy git ssh
  server { # for git ssh fetch/push
    listen 22; # change to 8022 if `sshd` is on port 22
    proxy_pass github.com:22;
  }

  # proxy https
  map $ssl_preread_server_name $backend_name { # sni map proxy, check: https://stackoverflow.com/questions/34741571/nginx-tcp-forwarding-based-on-hostname/40135151#40135151
    github.com                  backend_github_com;
    api.github.com              backend_api_github_com;
    github.githubassets.com     backend_github_githubassets_com;
    raw.githubusercontent.com   backend_raw_githubusercontent_com;
    default                     backend_default; # local https server, if needed, should run at 8443
  }
  upstream backend_github_com { server github.com:443; }
  upstream backend_api_github_com { server api.github.com:443; }
  upstream backend_github_githubassets_com { server github.githubassets.com:443; }
  upstream backend_raw_githubusercontent_com { server raw.githubusercontent.com:443; }
  upstream backend_default { server 127.0.0.1:8443; }
  server { # for some asset download
    listen 443;
    proxy_pass $backend_name;
    ssl_preread on;
  }
}
```
