ReturnValue = require 'nanocyte-component-return-value'
IntervalUnregister = require '../src/interval-unregister'

describe 'IntervalUnregister', ->
  beforeEach ->
    @sut = new IntervalUnregister

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      beforeEach ->
        @result = @sut.onEnvelope
          message: 'whaaa?'
          config:
            repeat: 1000
            id: 'the-node-uuid'
            deviceId: 'some-hardcoded-uuid'
            nanocyte:
              nonce: 'no-nce'

      it 'should return a message', ->
        expect(@result).to.deep.equal
          devices: ['some-hardcoded-uuid']
          topic: 'unregister-interval'
          payload:
            nodeId: 'the-node-uuid'
            nonce: 'no-nce'

    describe 'when called with an envelope, the envelope strikes back', ->
      beforeEach ->
        @result = @sut.onEnvelope
          message: '¿huuuuh!?'
          config:
            repeat: 1001
            id: 'the-edon-uuid'
            deviceId: 'some-softcoded-uuid'
            nanocyte:
              nonce: 'noncense'

      it 'should return a message', ->
        expect(@result).to.deep.equal
          devices: ['some-softcoded-uuid']
          topic: 'unregister-interval'
          payload:
            nodeId: 'the-edon-uuid'
            nonce: 'noncense'
