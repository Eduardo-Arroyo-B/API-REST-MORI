const express = require('express')
const morgan = require('morgan')
const products = require('./routes/Products')
const app = express()

// Asignando puerto al servidor
app.set('port', process.env.PORT || 3002)

// Middlewares
app.use(morgan('dev'))

// Routes
app.use('/', products)



// Server
app.listen(app.get('port'), () => {
    console.log((`Server on port: ${app.get('port')}`))
})