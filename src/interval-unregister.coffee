ReturnValue = require 'nanocyte-component-return-value'

class IntervalUnregister extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope

    devices: [config.deviceId]
    topic: 'unregister-interval'
    payload:
      nodeId: config.id

module.exports = IntervalUnregister
