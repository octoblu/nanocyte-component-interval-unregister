ReturnValue = require 'nanocyte-component-return-value'

class IntervalUnregister extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    devices: [config.deviceId]
    topic: 'unregister'
    payload:
      repeat: config.repeat
      nodeId: config.id

module.exports = IntervalUnregister
