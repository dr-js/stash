const { readdirSync, readFileSync } = require('fs')
const { resolve } = require('path')

const PATH_CERT = '/mnt/data-link/private/cert/letsencrypt/live/'
const tryReadFileBuffer = (...args) => { try { return readFileSync(resolve(...args)) } catch (error) { console.log(`[tryReadFileBuffer] ${error}`) } }
const TLSSNIConfig = {} // for server https TLSSNIConfig option
readdirSync(PATH_CERT).forEach((hostname) => { // some path is not cert, so test if key Buffer exist
  const ca = tryReadFileBuffer(PATH_CERT, hostname, 'chain.pem')
  const key = tryReadFileBuffer(PATH_CERT, hostname, 'privkey.pem')
  const cert = tryReadFileBuffer(PATH_CERT, hostname, 'fullchain.pem')
  if (key) TLSSNIConfig[ hostname ] = { hostname, ca, key, cert }
})
TLSSNIConfig[ 'default' ] = TLSSNIConfig[ Object.keys(TLSSNIConfig).reduce((o, v) => o.length > v.length ? v : o, Object.keys(TLSSNIConfig)[ 0 ]) ] // default to the shortest hostname
// console.log(TLSSNIConfig)
module.exports = TLSSNIConfig
