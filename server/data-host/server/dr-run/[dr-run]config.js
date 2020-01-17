module.exports = {
  host: '0.0.0.0:443',

  pidFile: '/root/data-local/server/dr-run/server.pid',
  logPath: '/root/data-local/server/dr-run/log/',
  logFilePrefix: '[dr-run]',

  authFile: '/mnt/data-link/private/server/auth.key',

  rootPath: './[link]root/',
  tempPath: './[link]temp/',

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
