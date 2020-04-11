'use strict'

const fs = require('fs');

module.exports = async(event, context) => {
  console.log(event);
  console.log(context);
  let writer = await fs.createWriteStream('/tmp/log.txt', {
    flags: 'a' // 'a' means appending (old data will be preserved)
  });

  writer.write(event['body']);
  let buffer = await fs.readFileSync('/tmp/log.txt');
  console.log(buffer.toString());
  const result = buffer.toString();
  return context
    .status(200)
    .succeed(result)
}

