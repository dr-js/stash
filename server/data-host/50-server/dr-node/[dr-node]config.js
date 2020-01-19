module.exports = {
  pidFile: '/root/data-local/server/dr-node/server.pid',
  logPath: '/root/data-local/server/dr-node/log/',
  logFilePrefix: '[dr-node]',

  authFile: '/mnt/data-link/private/server/DATA_HOST.key',
  permissionType: 'allow',
  // permissionFile: './permission.config.js',

  explorerRootPath: '/mnt/data-link/private/server/dr-node/',
  explorerUploadMergePath: '/root/data-local/server/dr-node/temp/',
  // taskRunnerRootPath: './[link]task/'

  host: '0.0.0.0:443',
  https: true,
  TLSDhparam: '/mnt/data-link/private/server/dh4096.pem',
  TLSSNIConfig: require('../[server-https]TLSSNIConfig')
}
