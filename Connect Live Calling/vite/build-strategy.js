import path from 'path'
import fs from 'fs'

export default function getStrategy(process, npmPackages) {
    return {
        manualChunks: (id, { getModuleInfo, getModuleIds }) => {
            if (id.includes('node_modules')) {
                const [, module] = /node_modules\/(@?[a-z0-9-]+?[a-z0-9-]+)/.exec(id)

                const modulePath = path.join(process.cwd(), 'node_modules', module, 'package.json')

                if (fs.existsSync(modulePath)) {
                    try {
                        const packageJson = require(modulePath)
                        const packageFileName = packageJson.name.replace(/@|\/|\./i, '').toLowerCase()
                        // return `vendor-${packageFileName}`

                        const corePackages = [
                            'vue',
                            'vuex',
                            'vue-router',
                            'vuex-persistedstate',
                            'axios',
                            'nprogress',
                            'vue-analytics',
                            'vue-toasted',
                            'vue2-transitions',
                            'toastify-js',
                        ]

                        const essentialPackages = [
                            'js-cookie',
                            'moment',
                            'moment-timezone',
                            'vue-moment',
                            'uuid',
                            'vuescroll',
                            'qrcode',
                            'vue-lazyload',
                            'sweetalert2',
                            'snakecase-keys',
                            'camelcase-keys',
                        ]

                        if (corePackages.includes(packageJson.name)) {

                            return `vendor/vendor-core`

                        } else if (essentialPackages.includes(packageJson.name)) {

                            return `vendor/vendor-essential`

                        } else if (['lodash', 'lodash-es'].includes(packageJson.name)) {

                            return `vendor/vendor-others`

                        } else if (npmPackages.includes(packageJson.name)) {

                            return `vendor/vendor-${packageFileName}`
                        }

                        return `vendor/vendor-others`
                    } catch (error) {
                        console.error(error)
                    }
                }
            }
        },

        chunkFileNames: (assetInfo) => {
            // console.log(`assetInfo - ${assetInfo.name}`, assetInfo)

            const moduleName = assetInfo.name
            const moduleId = assetInfo.facadeModuleId
            let newPath = ''

            const getFilePath = (modId, term) => {
                const file = modId.split(term).pop()
                const fileName = file.split('/').pop()
                let filePath = file.replace(fileName, '')

                if (/index/i.test(fileName)) {
                    const modName = filePath.split('/').at(-2) // last 2nd
                    filePath = filePath + modName + '-'
                }

                return filePath
            }

            if (moduleId && /resources\/js\//i.test(moduleId)) {
                // console.log(`Module - ${moduleName}`, moduleId)

                if (/resources\/js\/views\//i.test(moduleId)) {
                    const filePath = getFilePath(moduleId, 'resources/js/views/')

                    newPath = `views/${filePath}`
                } else if (/resources\/js\/core\//i.test(moduleId)) {
                    const filePath = getFilePath(moduleId, 'resources/js/core/')

                    newPath = `core/${filePath}`
                } else {
                    const filePath = getFilePath(moduleId, 'resources/js/')

                    newPath = `${filePath}`
                }
            } else if (moduleId && /resources\/sass\//i.test(moduleId)) {
                console.log(`SASS Module - ${moduleName}`, moduleId)
            }

            return `assets/js/${newPath}[name].[hash].js`
        },

        assetFileNames: (assetInfo) => {
            // console.log(`assetInfo - ${assetInfo.name}`, assetInfo)

            const moduleName = assetInfo.name

            let extType = moduleName.split('.').pop()

            const getFilePath = (modId, term) => {
                const file = modId.split(term).pop()
                const fileName = file.split('/').pop()
                let filePath = file.replace(fileName, '')

                if (/index/i.test(fileName)) {
                    const modName = filePath.split('/').at(-2) // last 2nd
                    filePath = filePath + modName + '-'
                }

                return filePath
            }


            if (/png|jpe?g|svg|gif|tiff|bmp|ico|webp/i.test(extType)) {
                if (/resources\/images\//i.test(moduleName)) {
                    let file = moduleName.split('resources/images/').pop()

                    if (file) {
                        return `assets/images/${file}`
                    }
                }

                extType = 'images'
            } else if (/ttf|woff|woff2|otf/i.test(extType)) {

                return `assets/fonts/[name][extname]`

            } else if (/css|scss|sass/i.test(extType)) {

                if (/resources\/sass\//i.test(moduleName)) {

                    return `assets/sass/[name][extname]`

                } else if (/resources\/js\//i.test(moduleName)) {

                    let file = moduleName.split('resources/js/').pop()

                    if (file) {
                        return `assets/css/${file}`
                    }
                }

                extType = 'css'
            }

            return `assets/${extType}/[name].[hash][extname]`
        },

        // external: ['jspdf'],

        // commonjsOptions: {
        //     exclude: ['jspdf'],
        //     include: []
        // },
    }
}
