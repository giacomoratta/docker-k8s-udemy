const express = require('express')

const app = express()

app.get('/', (req, res) => {
  res.send('Hi there!')
})

const listeningPort = 8080
app.listen(listeningPort, () => {
  console.log('Listening on port', listeningPort)
})