module.exports = {
  pidFile: '/root/data-local/server/dr-run/server.pid',
  logPath: '/root/data-local/server/dr-run/log/',
  logFilePrefix: '[dr-run]',

  rootPath: '/mnt/data-link/private/server/dr-run/',
  authFile: '/mnt/data-link/private/server/DATA_HOST.key',
  fileUploadMergePath: '/root/data-local/server/dr-run/temp/',
  // websocketTunnelHost: '127.0.0.1:1080',

  host: '0.0.0.0:443',
  TLSDhparam: '/mnt/data-link/private/server/dh4096.pem',
  TLSSNIConfig: require('../[server-https]TLSSNIConfig'),

  ...require('/mnt/data-link/host-config.json')[ '50-server-dr-run' ] // allow overwrite
}
