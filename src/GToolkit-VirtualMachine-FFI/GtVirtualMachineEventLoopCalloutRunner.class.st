Class {
	#name : #GtVirtualMachineEventLoopCalloutRunner,
	#superclass : #TFRunner,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #accessing }
GtVirtualMachineEventLoopCalloutRunner class >> cleanUp [
	uniqueInstance := nil
]

{ #category : #accessing }
GtVirtualMachineEventLoopCalloutRunner class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #executing }
GtVirtualMachineEventLoopCalloutRunner >> doInitialize [
	super doInitialize.
	
	handle := ExternalAddress null
]

{ #category : #executing }
GtVirtualMachineEventLoopCalloutRunner >> executeFunction: aTFExternalFunction withArguments: arguments usingSemaphore: anInteger [ 
	^ self primitiveExecuteFunction: aTFExternalFunction withArguments: arguments usingSemaphore: anInteger
]

{ #category : #executing }
GtVirtualMachineEventLoopCalloutRunner >> invokeFunction: aTFExternalFunction withArguments: aCollection [
	^ ((aTFExternalFunction blocking
		ifTrue: [ TFPooledExternalAsyncCall ]
		ifFalse: [ GtVirtualMachineNonBlockingExternalAsyncCall ])
			forFunction: aTFExternalFunction)
				parameters: aCollection;
				executeOn: self
]

{ #category : #private }
GtVirtualMachineEventLoopCalloutRunner >> primitiveExecuteFunction: aTFExternalFunction withArguments: arguments usingSemaphore: anInteger [ 
	<primitive: 'primitiveEventLoopCallout' error: ec>

	^ self primitiveFailed
]

{ #category : #private }
GtVirtualMachineEventLoopCalloutRunner >> primitivePerformWorkerCall: aTFExternalFunction withArguments: argumentHolder withReturnHolder: aReturnHolder usingSemaphore: anInteger [

	self shouldNotImplement
]

{ #category : #executing }
GtVirtualMachineEventLoopCalloutRunner >> readReturnValueFromTask: anExternalAddress [
	<primitive: 'primitiveExtractReturnValue' error: ec>

	self primitiveFailed
]
