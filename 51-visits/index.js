const express = require('express')
const redis = require('redis')

const app = express()
const client = redis.createClient({

  // instead of a URL, this is enough because Docker will get the requested
  // host which is equal to the container-name, so Docker will reply!
  host: 'redis-server',
  port: 6379

});

client.set('visits', 0)

app.get('/', (req, res) => {

  // crash simulation
  process.exit(0 /* 0=OK, 1+=something went wrong */)

  client.get('visits', (err, visits) => {
    res.send(`Number of visit is ${visits}`)
    client.set('visits', parseInt(visits) + 1)
  })
})

const listeningPort = 8081
app.listen(listeningPort, () => {
  console.log('Listening on port', listeningPort)
})