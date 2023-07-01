require('dotenv').config()

const mariadb = require('mariadb')
const express = require('express')
const cors = require('cors')
const { v4: uuidv4 } = require('uuid');

const app = express()

app.use(express.json())
app.use(cors())

const connectionPool = mariadb.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
})

app.get('/serie', async (req, res) => {
    const results = await connectionPool.query('SELECT * FROM serie ORDER BY id')

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })

    res.send(results)
})

app.post('/seria', async (req, res) => {
    if (!req.body.id) return res.send({ message: 'Podaj id serii w \'id\'' })
    
    const results = await connectionPool.query('SELECT * FROM serie WHERE id=?', [req.body.id])

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })

    res.send(results[0])
})

app.post('/odcinki', async (req, res) => {
    if (!req.body.seria) return res.send({ message: 'Podaj id serii w \'seria\'' })
    
    const results = await connectionPool.query('SELECT * FROM odcinki WHERE seria=? ORDER BY odcinek', req.body.seria)

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })

    res.send(results)
})

app.post('/odcinek', async (req, res) => {
    if (!req.body.seria) return res.send({ message: 'Podaj id serii w \'seria\'' })
    if (!req.body.sezon) return res.send({ message: 'Podaj number sezonu w \'sezon\'' })
    if (!req.body.odcinek) return res.send({ message: 'Podaj number odcinka w \'odcinek\'' })
    
    const results = await connectionPool.query('SELECT * FROM odcinki WHERE seria=? AND odcinek=? AND sezon=? ORDER BY id', [req.body.seria, req.body.odcinek, req.body.sezon])

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })

    res.send(results[0])
})

app.post('/odtwarzacze', async (req, res) => {
    if (!req.body.seria) return res.send({ message: 'Podaj id serii w \'seria\'' })
    if (!req.body.sezon) return res.send({ message: 'Podaj number sezonu w \'sezon\'' })
    if (!req.body.odcinek) return res.send({ message: 'Podaj number odcinka w \'odcinek\'' })

    const results = await connectionPool.query('SELECT * FROM odtwarzacze WHERE seria=? AND odcinek=? AND sezon=? ORDER BY id', [req.body.seria, req.body.odcinek, req.body.sezon])

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })

    res.send(results)
})

app.post('/odtwarzacz', async (req, res) => {
    if (!req.body.id) return res.send({ message: 'Podaj id odtwarzacza w \'id\'' })
    
    const results = await connectionPool.query('SELECT * FROM odtwarzacze WHERE id=? ORDER BY id', [req.body.id])

    if (results.length == 0) return res.status(404).send({ message: 'Not Found' })
    res.send(results[0])
})

//

app.post('/dodaj/odcinek', async (req, res) => {
    if (!req.body.seria) return res.status(400).send({ message: 'Podaj id serii w \'seria\''})
    if (!req.body.tytul_pl) return res.status(400).send({ message: 'Podaj polski tytul w \'tytul_pl\''})
    if (!req.body.tytul_jp) return res.status(400).send({ message: 'Podaj japonski tytul w \'tytul_jp\''})
    if (!req.body.data_premiery) return res.status(400).send({ message: 'Podaj date premiery w \'data_premiery\''})
    if (!req.body.dlugosc_odcinka) return res.status(400).send({ message: 'Podaj dlugosc odcinka w \'dlugosc_odcinka\''})
    if (!req.body.sezon) return res.status(400).send({ message: 'Podaj nr sezonu w \'sezon\''})
    if (!req.body.odcinek) return res.status(400).send({ message: 'Podaj nr odcinka w \'odcinek\''})
    if (!req.body.opis) return res.status(400).send({ message: 'Podaj opis w \'opis\''})

    try {
        const result = await connectionPool.query('INSERT INTO odcinki VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, \'[]\', 0)', [uuidv4(), req.body.seria, req.body.sezon, req.body.odcinek, req.body.opis, req.body.dlugosc_odcinka, req.body.data_premiery, req.body.tytul_pl, req.body.tytul_jp])
        console.log(result)
        res.send({ success: true })
    } catch (e) {
        console.log(e)
        res.status(500).send({ success: false })
    }
})

app.post('/dodaj/odtwarzacz', async (req, res) => {
    if (!req.body.seria) return res.status(400).send({ message: 'Podaj id serii w \'seria\''})
    if (!req.body.sezon) return res.status(400).send({ message: 'Podaj nr sezonu w \'sezon\''})
    if (!req.body.odcinek) return res.status(400).send({ message: 'Podaj nr odcinka w \'odcinek\''})
    if (!req.body.typ) return res.status(400).send({ message: 'Podaj typ odtwarzacza (cda, mega) w \'typ\''})
    if (!req.body.tlumaczenie) return res.status(400).send({ message: 'Podaj tlumaczenie w \'tlumaczenie\''})
    if (!req.body.jakosc) return res.status(400).send({ message: 'Podaj jakosc w \'jakosc\''})
    if (!req.body.link) return res.status(400).send({ message: 'Podaj link do otwarzacza w \'link\''})

    try {
        const result = await connectionPool.query('INSERT INTO odtwarzacze VALUES (?, ?, ?, ?, 0, ?, ?, ?, ?)', [uuidv4(), req.body.link, req.body.seria, req.body.typ, req.body.odcinek, req.body.sezon, req.body.tlumaczenie, req.body.jakosc])
        console.log(result)
        res.send({ success: true })
    } catch (e) {
        console.log(e)
        res.status(500).send({ success: false })
    }
})

app.listen(2806)