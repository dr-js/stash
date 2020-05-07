module.exports = {
  pidFile: '/root/data-local/server/dr-node/server.pid',
  logPath: '/root/data-local/server/dr-node/log/',
  logFilePrefix: '[dr-node]',

  authFile: '/mnt/data-link/private/server/DATA_HOST.key',
  // authFileGroupPath: '/mnt/data-link/private/server/auth/',
  // authFileGroupKeySuffix: '.key',
  // authFileGroupDefaultTag: 'DATA_HOST',
  permissionType: 'allow',
  // permissionFile: './permission.config.js',

  explorerRootPath: '/mnt/data-link/private/server/dr-node/',
  explorerUploadMergePath: '/root/data-local/server/dr-node/temp/',

  // websocketTunnelHost: '127.0.0.1:1080',

  host: '0.0.0.0:443',
  TLSDhparam: '/mnt/data-link/private/server/dh4096.pem',
  TLSSNIConfig: require('../[server-https]TLSSNIConfig'),

  ...require('/mnt/data-link/host-config.json')[ '50-server-dr-node' ] // allow overwrite
}
