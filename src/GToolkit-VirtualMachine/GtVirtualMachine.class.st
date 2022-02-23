Class {
	#name : #GtVirtualMachine,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine'
}

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
