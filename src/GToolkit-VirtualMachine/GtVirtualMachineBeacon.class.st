Class {
	#name : #GtVirtualMachineBeacon,
	#superclass : #Object,
	#instVars : [
		'semaphore',
		'semaphoreIndex',
		'process',
		'signalMap'
	],
	#classInstVars : [
		'instance'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #'api - logger' }
GtVirtualMachineBeacon class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #'api - logger' }
GtVirtualMachineBeacon class >> start [
	self instance start
]

{ #category : #'api - logger' }
GtVirtualMachineBeacon class >> startFor: aLoggerSignalClass [
	GtVirtualMachine instance enableSignal: aLoggerSignalClass.
	self instance start
]

{ #category : #'api - logger' }
GtVirtualMachineBeacon class >> stop [
	self instance stop
]

{ #category : #'private - logger' }
GtVirtualMachineBeacon >> buildSignalMap [
	| aSignalMap |
	
	aSignalMap := Dictionary new.
	
	GtVirtualMachineSignal withAllSubclassesDo: [ :eachSignalClass |
		(eachSignalClass isAbstract not and: [ eachSignalClass signalName notNil ])
			ifTrue: [ aSignalMap at: eachSignalClass signalName put: eachSignalClass ] ].

	^ aSignalMap
]

{ #category : #'private - semaphore' }
GtVirtualMachineBeacon >> deregisterSemaphore [
	Smalltalk unregisterExternalObject: self semaphore.
	semaphoreIndex := nil
]

{ #category : #initialization }
GtVirtualMachineBeacon >> initialize [
	super initialize.
	
	semaphore := Semaphore new.
	semaphoreIndex := nil
]

{ #category : #'private - logger' }
GtVirtualMachineBeacon >> loggerLoop [
	[ 
		self pollLogs.
		self semaphore wait
	] repeat
]

{ #category : #'private - logger' }
GtVirtualMachineBeacon >> pollLogs [
	| newLogs |
	
	newLogs := self primitivePollBeacon.
	newLogs do: [ :eachLog |
		| aSignalName aSignal |
		
		aSignalName := eachLog at: 1.
		aSignal := self signalMap at: aSignalName
			ifPresent: [ :aSignalClass | aSignalClass new ]
			ifAbsent: [ GtVirtualMachineGenericSignal new name: aSignalName ].
		
		aSignal
			fileName: (eachLog at: 2);
			functionName: (eachLog at: 3);
			message: (eachLog at: 4).
		
		aSignal emit ]
]

{ #category : #'private - primitives' }
GtVirtualMachineBeacon >> primitivePollBeacon [
	<primitive: 'primitivePollLogger'>
	
	^ #()
]

{ #category : #'private - semaphore' }
GtVirtualMachineBeacon >> registerSemaphore [
	semaphoreIndex := Smalltalk registerExternalObject: self semaphore
]

{ #category : #'private - semaphore' }
GtVirtualMachineBeacon >> semaphore [
	^ semaphore
]

{ #category : #'private - logger' }
GtVirtualMachineBeacon >> signalMap [
	^ signalMap ifNil: [ signalMap := self buildSignalMap ]
]

{ #category : #accessing }
GtVirtualMachineBeacon >> start [
	self stop.

	self registerSemaphore.
	GtVirtualMachine instance
		startBeacon: semaphoreIndex.

	process := [ self loggerLoop ] newProcess
		priority: Processor userBackgroundPriority - 1;
		name: 'Virtual Machine Logger';
		resume
]

{ #category : #accessing }
GtVirtualMachineBeacon >> stop [
	process ifNotNil: [ :aProcess | aProcess terminate ].
	process := nil.
	self deregisterSemaphore.
	GtVirtualMachine instance stopLogger
]
