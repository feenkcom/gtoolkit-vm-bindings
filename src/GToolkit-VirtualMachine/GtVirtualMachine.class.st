Class {
	#name : #GtVirtualMachine,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #'api - accessing' }
GtVirtualMachine >> logLevel: aGtVirtualMachineLogLevel [
	(self primitiveSetLogLevel: aGtVirtualMachineLogLevel value)
		ifFalse: [ self error: 'Failed to set the log level to ', aGtVirtualMachineLogLevel printString ]
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
GtVirtualMachine >> primitiveGetNamedPrimitives [
	<primitive: 'primitiveGetNamedPrimitives'>
	
	^ #()
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primitiveSetLogLevel: aLogLevel [
	"Set a desired log level which can be one of the following:
	None = 0,
	Error = 1,
	Warn = 2,
	Info = 3,
	Debug = 4,
	Trace = 5"
	<primitive: 'primitiveSetLogLevel'>
	
	^ false
]
