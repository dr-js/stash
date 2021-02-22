const { promises: fsAsync } = require('fs')

const { forEachRegExpExec } = require('@dr-js/core/library/common/string')
const { getFileList } = require('@dr-js/core/library/node/file/Directory')
const { runMain } = require('@dr-js/dev/library/main')

// parse and check to prevent alias overwrite
const PATH_ROOT = __dirname
const REGEXP_ALIAS_FUNCTION = /(?:alias ([\w-]+)=|function ([\w-]+) \{)/g

runMain(async (logger) => {
  const bashScriptFileList = (await getFileList(PATH_ROOT)).filter((name) => name.endsWith('.sh'))
  logger.stepLog(`found ${bashScriptFileList.length} bash script`)

  const aliasMap = new Map()
  for (const bashScriptFile of bashScriptFileList) {
    logger.log('[bashScriptFile]', bashScriptFile)
    forEachRegExpExec(REGEXP_ALIAS_FUNCTION, String(await fsAsync.readFile(bashScriptFile)), ([ , name0, name1 ]) => {
      const aliasName = name0 || name1
      logger.log('  [aliasName]', aliasName)
      if (aliasMap.has(aliasName)) throw new Error(`duplicate aliasName "${aliasName}" from: "${aliasMap.get(aliasName)}" and "${bashScriptFile}"`)
      else aliasMap.set(aliasName, bashScriptFile)
    })
  }
  logger.stepLog(`verified ${aliasMap.size} alias`)
}, 'verify-alias')
