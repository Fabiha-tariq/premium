export default {
    strategies: 'injectManifest',
    manifest: false,

    injectManifest: {
        globDirectory: 'public',
        globPatterns: [
            'site/**/*.{js,css,ico}',
        ],
        globIgnores: [
            'assets/**',
            'vendor/**',
            'images/backgrounds/**',
            'images/screenshots/**',
            'site/vendor/**',
            'app-manifest**',
            'site-manifest**',
            'app-sw**',
            'site-sw**'
        ],

        // manifestTransforms: [
        //     (manifestEntries) => {
        //         return {
        //             manifest: manifestEntries.map((entry) => {
        //                 console.log(entry);
        //                 if (! entry.url.startsWith('assets/')) {
        //                     return entry;
        //                     // entry.url = entry.url.replace(/^dist\//i, '');
        //                 }
        //             }),
        //             warnings: []
        //         }
        //     }
        // ],
    },

    // Workbox not applicable if strategies is 'injectManifest'
    // workbox: {
    //     clientsClaim: true,
    //     skipWaiting: true,
    //     globIgnores: [
    //         '/public/assets/**/*',
    //     ],
    //     globPatterns: [
    //         '/public/css/**/*.{css}',
    //         '/public/images/**/*.{ico,png,gif,jpg,svg,xml}',
    //     ],
    //     globStrict: true,
    //     navigateFallback: '/offline',
    // },
}
