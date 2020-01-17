module.exports = {
  host: '0.0.0.0:443',

  pidFile: '/root/data-local/server/dr-node/server.pid',
  logPath: '/root/data-local/server/dr-node/log/',
  logFilePrefix: '[dr-node]',

  authFile: '/mnt/data-link/private/server/auth.key',
  permissionType: 'allow',
  // permissionFile: './permission.config.js',

  explorerRootPath: './[link]root/',
  explorerUploadMergePath: './[link]temp/',
  // taskRunnerRootPath: './[link]task/'

  https: true,
  TLSDhparam: '../dh4096.pem',
  TLSSNIConfig: {
    'default': {
      key: '../[link]cert/DOMAIN.HOSTNAME/privkey.pem',
      cert: '../[link]cert/DOMAIN.HOSTNAME/fullchain.pem',
      chain: '../[link]cert/DOMAIN.HOSTNAME/chain.pem'
    },
    'DOMAIN.HOSTNAME': {
      key: '../[link]cert/DOMAIN.HOSTNAME/privkey.pem',
      cert: '../[link]cert/DOMAIN.HOSTNAME/fullchain.pem',
      chain: '../[link]cert/DOMAIN.HOSTNAME/chain.pem'
    }
  }
}
