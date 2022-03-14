Class {
	#name : #GtVirtualMachine,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtVirtualMachine class >> instance [
	^ self new
]

{ #category : #'api - logger' }
GtVirtualMachine >> enableSignal: aSignalClass [
	"Enable a given signal type in the vm"

	aSignalClass isClass
		ifFalse: [ ^ self enableSignalNamed: aSignalClass signalName ].

	aSignalClass withAllSubclassesDo: [ :eachSignalClass |
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
GtVirtualMachine >> namedPrimitives [
	^ self primitiveGetNamedPrimitives collect: [ :eachArray |
		GtVirtualMachineNamedPrimitive new
			plugin: eachArray first;
			primitive: eachArray second;
			address: eachArray third ]
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
