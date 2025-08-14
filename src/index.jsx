import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { RouterProvider } from 'react-router-dom'
import { createRouter } from '@generouted/react-router/client'
import { ThemeProvider, BaseStyles } from '@primer/react'

import './reset.css'
import './globals.css'

import ColorModeSwitcher from './components/ColorModeSwitcher'

const router = createRouter({
    basename: import.meta.env.VITE_BASE_URL,
})

const rootElement = document.getElementById('root')
const root = createRoot(rootElement)

root.render(
    <StrictMode>
        <ThemeProvider colorMode="auto">
            <BaseStyles>
                <ColorModeSwitcher />
                <RouterProvider router={router} />
            </BaseStyles>
        </ThemeProvider>
    </StrictMode>
)
