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

{ #category : #accessing }
GtVirtualMachineBeacon class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #accessing }
GtVirtualMachineBeacon class >> start [
	self instance start
]

{ #category : #accessing }
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

{ #category : #accessing }
GtVirtualMachineBeacon >> enableSignal: aSignalClass [
	"Enable a given signal type in the vm beacon"

	aSignalClass withAllSubclassesDo: [ :eachSignalClass |
		(eachSignalClass isAbstract not and: [ eachSignalClass signalName notNil ])
			ifTrue: [ self enableSignalNamed: eachSignalClass signalName ] ]
]

{ #category : #accessing }
GtVirtualMachineBeacon >> enableSignalNamed: aString [
	"Enable a given signal type in the vm beacon"

	self primitiveEnableBeaconSignal: aString
]

{ #category : #accessing }
GtVirtualMachineBeacon >> enabledSignals [
	"Return a collection of signal types (as string) that are enabled in the vm beacon"
	<return: #Array of: #String>

	^ self primitiveGetEnabledBeaconSignals
]

{ #category : #initialization }
GtVirtualMachineBeacon >> initialize [
	super initialize.
	
	semaphore := Semaphore new.
	semaphoreIndex := nil
]

{ #category : #accessing }
GtVirtualMachineBeacon >> logLevel: aGtVirtualMachineLogLevel [
	GtVirtualMachine new logLevel: aGtVirtualMachineLogLevel
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
GtVirtualMachineBeacon >> primitiveEnableBeaconSignal: aString [
	<primitive: 'primitiveEnableLogSignal' error: ec>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachineBeacon >> primitiveGetEnabledBeaconSignals [
	<primitive: 'primitiveGetEnabledLogSignals'>
	
	^ self primitiveFailed
]

{ #category : #'private - primitives' }
GtVirtualMachineBeacon >> primitivePollBeacon [
	<primitive: 'primitivePollLogger'>
	
	^ #()
]

{ #category : #'private - primitives' }
GtVirtualMachineBeacon >> primitiveStartBeacon: aSemaphoreIndex [
	<primitive: 'primitiveStartBeacon'>
	
	^ false
]

{ #category : #'private - primitives' }
GtVirtualMachineBeacon >> primitiveStopBeacon [
	<primitive: 'primitiveStopLogger'>
	
	^ false
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
	self registerSemaphore.
	(self primitiveStartBeacon: semaphoreIndex)
		ifFalse: [ self error: 'Could not set beacon logger' ].

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
	self primitiveStopBeacon
		ifFalse: [ self error: 'Could not disable beacon logger' ]
]
