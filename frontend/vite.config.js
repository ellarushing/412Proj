import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    host: '127.0.0.1',
    port: 5173,             // your desired port
    strictPort: true,
    proxy: {
      '/auth': {
        target: 'http://127.0.0.1:5001',
        changeOrigin: true,
        secure: false,
        withCredentials: true
      }
    }
  }
})