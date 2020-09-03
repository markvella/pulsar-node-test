const Pulsar = require('pulsar-client');
setTimeout(function() {
(async () => {
  // Create a client
  const client = new Pulsar.Client({
    serviceUrl: 'pulsar://pulsar:6650',
    operationTimeoutSeconds: 30,
  });

  try{
  // Create a producer
  const producer = await client.createProducer({
    topic: 'my-topic'
  });
  


  // Send messages
  for (let i = 0; i < 10; i += 1) {
    const msg = `my-message-${i}`;
    producer.send({
      data: Buffer.from(msg),
    });
    console.log(`Sent message: ${msg}`);
  }
  await producer.flush();

  await producer.close();
  await client.close();
} catch(e){
    
}
})()}, 30000);;