const express = require('express')
const prisma = require('src/client/prismaClient')
const router = express.Router()


router.get('/categoria', async (req, res) => {
    const  findCategory = await prisma.categoria.findMany()

    res.json(findCategory)
})

router.get('/Author', async (req, res) => {
    const  findAuthor = await prisma.autor.findMany()

    res.json(findAuthor)
})

router.get('/Titulo', async (req, res) => {
    const  findTitulo = await prisma.titulo.findMany()

    res.json(findTitulo)

})



module.exports = router