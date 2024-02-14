import path from 'path'
import { homedir } from 'os'
import fs from 'fs'

function detectServerConfig(host) {
    let keyPath = path.resolve(homedir(), `.config/valet/Certificates/${host}.key`)
    let certificatePath = path.resolve(homedir(), `.config/valet/Certificates/${host}.crt`)

    if (!fs.existsSync(keyPath) || !fs.existsSync(certificatePath)) {
        return {}
    }

    return {
        hmr: { host },
        host,
        https: {
            key: fs.readFileSync(keyPath),
            cert: fs.readFileSync(certificatePath),
        },
    }
}

export { detectServerConfig }
