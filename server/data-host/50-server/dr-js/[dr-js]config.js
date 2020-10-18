module.exports = {
  serverServeStatic: 5 * 1000, // expireTime

  root: '/mnt/data-link/share/server/dr-js/',

  host: '0.0.0.0:80',

  ...require('/mnt/data-link/host-config.json')[ '50-server-dr-js' ] // allow overwrite
}
