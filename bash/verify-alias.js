const { forEachRegExpExec } = require('@dr-js/core/library/common/string.js')
const { readTextSync } = require('@dr-js/core/library/node/fs/File.js')
const { getFileListSync } = require('@dr-js/core/library/node/fs/Directory.js')
const { runKit } = require('@dr-js/core/library/node/kit.js')

// parse and check to prevent alias overwrite
const PATH_ROOT = __dirname
const REGEXP_ALIAS_FUNCTION = /(?:alias ([\w-]+)=|function ([\w-]+) \{)/g

runKit(async (kit) => {
  const bashScriptFileList = getFileListSync(PATH_ROOT).filter((name) => name.endsWith('.sh'))
  kit.stepLog(`found ${bashScriptFileList.length} bash script`)

  const aliasMap = new Map()
  for (const bashScriptFile of bashScriptFileList) {
    kit.log('[bashScriptFile]', bashScriptFile)
    forEachRegExpExec(REGEXP_ALIAS_FUNCTION, readTextSync(bashScriptFile), ([ , name0, name1 ]) => {
      const aliasName = name0 || name1
      kit.log('  [aliasName]', aliasName)
      if (aliasMap.has(aliasName)) throw new Error(`duplicate aliasName "${aliasName}" from: "${aliasMap.get(aliasName)}" and "${bashScriptFile}"`)
      else aliasMap.set(aliasName, bashScriptFile)
    })
  }
  kit.stepLog(`verified ${aliasMap.size} alias`)
}, { title: 'verify-alias' })
