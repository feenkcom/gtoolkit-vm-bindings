Class {
	#name : #GtVirtualMachineLogger,
	#superclass : #Object,
	#instVars : [
		'semaphore',
		'semaphoreIndex',
		'process'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #accessing }
GtVirtualMachineLogger class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
GtVirtualMachineLogger class >> logDebug [
	self logLevel: GtVirtualMachineLogLevel debug
]

{ #category : #accessing }
GtVirtualMachineLogger class >> logError [
	self logLevel: GtVirtualMachineLogLevel error
]

{ #category : #accessing }
GtVirtualMachineLogger class >> logLevel: aGtVirtualMachineLogLevel [
	self instance logLevel: aGtVirtualMachineLogLevel
]

{ #category : #accessing }
GtVirtualMachineLogger class >> logNone [
	self logLevel: GtVirtualMachineLogLevel none
]

{ #category : #accessing }
GtVirtualMachineLogger class >> logTrace [
	self logLevel: GtVirtualMachineLogLevel trace
]

{ #category : #accessing }
GtVirtualMachineLogger class >> start [
	self instance start
]

{ #category : #accessing }
GtVirtualMachineLogger class >> stop [
	self instance stop
]

{ #category : #'private - semaphore' }
GtVirtualMachineLogger >> deregisterSemaphore [
	Smalltalk unregisterExternalObject: self semaphore.
	semaphoreIndex := nil
]

{ #category : #initialization }
GtVirtualMachineLogger >> initialize [
	super initialize.
	
	semaphore := Semaphore new.
	semaphoreIndex := nil
]

{ #category : #accessing }
GtVirtualMachineLogger >> logLevel: aGtVirtualMachineLogLevel [
	GtVirtualMachine new logLevel: aGtVirtualMachineLogLevel
]

{ #category : #'private - logger' }
GtVirtualMachineLogger >> loggerLoop [
	[ 
		self pollLogs.
		self semaphore wait
	] repeat
]

{ #category : #'private - logger' }
GtVirtualMachineLogger >> pollLogs [
	| newLogs |
	
	newLogs := self primitivePollBeaconLogger.
	newLogs do: [ :eachLog |
		(GtVirtualMachineSignal new
			fileName: (eachLog at: 1);
			functionName: (eachLog at: 2);
			message: (eachLog at: 3)) emit ]
]

{ #category : #'private - primitives' }
GtVirtualMachineLogger >> primitivePollBeaconLogger [
	<primitive: 'primitivePollBeaconLogger'>
	
	^ #()
]

{ #category : #'private - primitives' }
GtVirtualMachineLogger >> primitiveRemoveBeaconLogger [
	<primitive: 'primitiveRemoveBeaconLogger'>
	
	^ false
]

{ #category : #'private - primitives' }
GtVirtualMachineLogger >> primitiveSetBeaconLogger: aSemaphoreIndex [
	<primitive: 'primitiveSetBeaconLogger'>
	
	^ false
]

{ #category : #'private - semaphore' }
GtVirtualMachineLogger >> registerSemaphore [
	semaphoreIndex := Smalltalk registerExternalObject: self semaphore
]

{ #category : #'private - semaphore' }
GtVirtualMachineLogger >> semaphore [
	^ semaphore
]

{ #category : #accessing }
GtVirtualMachineLogger >> start [
	self registerSemaphore.
	(self primitiveSetBeaconLogger: semaphoreIndex)
		ifFalse: [ self error: 'Could not set beacon logger' ].

	process := [ self loggerLoop ] newProcess
		priority: Processor userBackgroundPriority - 1;
		name: 'Virtual Machine Logger';
		resume
]

{ #category : #accessing }
GtVirtualMachineLogger >> stop [
	process ifNotNil: [ :aProcess | aProcess terminate ].
	process := nil.
	self deregisterSemaphore.
	self primitiveRemoveBeaconLogger
		ifFalse: [ self error: 'Could not disable beacon logger' ]
]
