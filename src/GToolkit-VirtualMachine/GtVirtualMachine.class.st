Class {
	#name : #GtVirtualMachine,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtVirtualMachine class >> instance [
	<gtExample>
	<script: 'self instance inspect'>

	^ self new
]

{ #category : #'api - logger' }
GtVirtualMachine >> enableSignal: aSignalClassOrSigalOrAnnouncementSet [
	"Enable a given signal type in the vm"
	
	aSignalClassOrSigalOrAnnouncementSet isString
		ifTrue: [ ^ self enableSignalNamed: aSignalClassOrSigalOrAnnouncementSet ].
	
	aSignalClassOrSigalOrAnnouncementSet isCollection
		ifTrue: [ ^ aSignalClassOrSigalOrAnnouncementSet do: [ :eachSignal | self enableSignal: eachSignal ] ].

	aSignalClassOrSigalOrAnnouncementSet isClass
		ifFalse: [ ^ self enableSignalNamed: aSignalClassOrSigalOrAnnouncementSet signalName ].

	aSignalClassOrSigalOrAnnouncementSet withAllSubclassesDo: [ :eachSignalClass |
		(eachSignalClass isAbstract not and: [ eachSignalClass signalName notNil ])
			ifTrue: [ self enableSignalNamed: eachSignalClass signalName ] ]
]

{ #category : #'api - logger' }
GtVirtualMachine >> enableSignalNamed: aString [
	"Enable a given signal type in the vm"

	self primitiveEnableLogSignal: aString
]

{ #category : #'api - logger' }
GtVirtualMachine >> enabledSignals [
	"Return a collection of signal types (as string) that are enabled in the vm beacon"
	<return: #Array of: #String>

	^ self primitiveGetEnabledLogSignals
]

{ #category : #'api - accessing' }
GtVirtualMachine >> eventLoopWaker: anExternalAddressThunk function: anExternalAddressFunction [
	"Assign an event loop waker. When virtual machine runs in the worker (non-main) thread
	it needs a way to wake up an event loop and process events or event loop callouts.
	If an event loop waker is not assigned the virtual machine has to wait for a ui event (like mouse movement)
	to start processing event loop callouts.

	The waker function must be a pointer to the external C function in the following form:
		extern ""C"" fn(waker_thunk: *const c_void, event: u32) -> bool
		
	The first argument that is passed to the waker function is a pointer to the thunk,
	which is the first argument of this method. An event is a number that may help the event loop
	to differentiate between wake up sources. The virtual machine passes `0` as an event"

	self
		assert: [ anExternalAddressThunk isExternalAddress ]
		description: [ 'A waker argument must be an external address' ].
		
	self
		assert: [ anExternalAddressFunction isExternalAddress ]
		description: [ 'A waker function must be an external address' ].
	
	self
		primitiveSetEventLoopWakerThunk: anExternalAddressThunk
		function: anExternalAddressFunction
]

{ #category : #'api - accessing' }
GtVirtualMachine >> namedPrimitives [
	^ self primitiveGetNamedPrimitives collect: [ :eachArray |
		GtVirtualMachineNamedPrimitive new
			plugin: eachArray first;
			primitive: eachArray second;
			address: eachArray third ]
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveAppInfo [
	<primitive: #primitiveAppInfo>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveEnableLogSignal: aString [
	<primitive: 'primitiveEnableLogSignal' error: ec>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveGetEnabledLogSignals [
	<primitive: 'primitiveGetEnabledLogSignals'>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveGetNamedPrimitives [
	<primitive: 'primitiveGetNamedPrimitives'>
	
	^ #()
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveSetEventLoopWakerThunk: anExternalAddressThunk function: anExternalAddressFunction [
	<primitive: 'primitiveSetEventLoopWaker' error: ec>
	
	^ false
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveStartBeacon: aSemaphoreIndex [
	<primitive: 'primitiveStartBeacon'>
	
	^ false
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveStartConsoleLogger [
	<primitive: 'primitiveStartConsoleLogger'>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveStopLogger [
	<primitive: 'primitiveStopLogger'>
	
	^ false
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveVirtualMachineInfo [
	<primitive: #primitiveVirtualMachineInfo>
	
	^ self primitiveFailed
]

{ #category : #'api - logger' }
GtVirtualMachine >> startBeacon: aSemaphoreIndex [
	(self primitiveStartBeacon: aSemaphoreIndex)
		ifFalse: [ self error: 'Could not start beacon logger' ].
]

{ #category : #'api - logger' }
GtVirtualMachine >> startConsoleLogger [
	self primitiveStartConsoleLogger
]

{ #category : #'api - logger' }
GtVirtualMachine >> stopLogger [
	self primitiveStopLogger
		ifFalse: [ self error: 'Could not stop a logger' ]
]

{ #category : #'private - primitives' }
GtVirtualMachine >> totalFullGCTimeMicroseconds [
	"Answer the total time in microseconds spent in full GCs since startup (read-only)."
	<primitive: #'primitiveFullGarbageCollectorMicroseconds'>

	^ Smalltalk vm totalFullGCTime * 1000
]

{ #category : #accessing }
GtVirtualMachine >> totalGCTimeMicroseconds [
	^ self totalFullGCTimeMicroseconds + self totalScavengeGCTimeMicroseconds.
]

{ #category : #'private - primitives' }
GtVirtualMachine >> totalScavengeGCTimeMicroseconds [
	"Answer the total time in microseconds spent in scavenge GCs since startup (read-only)."
	<primitive: #'primitiveScavengeGarbageCollectorMicroseconds'>

	^ Smalltalk vm totalIncrementalGCTime * 1000
]
