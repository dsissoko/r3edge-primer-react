import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'
import postcssGlobalData from '@csstools/postcss-global-data'
import postcssPresetEnv from 'postcss-preset-env'
import browsers from '@github/browserslist-config'
import { globSync } from 'glob'

export default defineConfig(({ mode }) => {
    const env = loadEnv(mode, process.cwd(), '')
    return {
        base: env.VITE_BASE_URL || '/',
        plugins: [react()],
        server: { port: 1234 },
        css: {
            postcss: {
                plugins: [
                    postcssGlobalData({
                        files: globSync(
                            'node_modules/@primer/primitives/dist/css/**/*.css'
                        ),
                    }),
                    postcssPresetEnv({
                        stage: 2,
                        browsers,
                        // https://preset-env.cssdb.org/features/#stage-2
                        features: {
                            'nesting-rules': {
                                noIsPseudoSelector: true,
                            },
                            'focus-visible-pseudo-class': false,
                            'logical-properties-and-values': false,
                        },
                    }),
                ],
            },
        },
    }
})
