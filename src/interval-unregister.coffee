ReturnValue = require 'nanocyte-component-return-value'

class IntervalUnregister extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    devices: [config.deviceId]
    topic: 'unregister-interval'
    payload:
      nodeId: config.id
      nonce: config.nanocyte?.nonce

module.exports = IntervalUnregister
