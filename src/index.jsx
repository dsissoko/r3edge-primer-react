import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import { ThemeProvider, BaseStyles } from '@primer/react'

import './reset.css'
import './globals.css'

import ColorModeSwitcher from './components/ColorModeSwitcher'
import Playground from './pages/index.jsx'

const rootElement = document.getElementById('root')
const root = createRoot(rootElement)

root.render(
    <StrictMode>
        <ThemeProvider colorMode="auto">
            <BrowserRouter basename={import.meta.env.VITE_BASE_URL}>
                <BaseStyles>
                    <ColorModeSwitcher />
                    <Routes>
                        <Route path="/" element={<Playground />} />
                        {/* Ajoutez vos futures routes ici */}
                    </Routes>
                </BaseStyles>
            </BrowserRouter>
        </ThemeProvider>
    </StrictMode>
)