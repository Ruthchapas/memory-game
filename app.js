// Dependencias del servidor
const path = require('node:path')
const express = require('express')
const app = express()

    // Hacemos funcioanl en puerto

process.loadEnvFile()
const PORT = process.env.PORT || 3000

// Indicar la ruta de los ficheros estáticos
app.use(express.static(path.join(__dirname, "public")))

app.get('/', (req, res) => {
    res.sendFile("index.html")
})

app.use((req, res) => {
    res.status(400).send("Página no encontrada")
})

// Indicar el puerto de ejecución (escucha)
app.listen(PORT, () => { console.log(`Servidor funcionando en http://localhost:${PORT}`);})