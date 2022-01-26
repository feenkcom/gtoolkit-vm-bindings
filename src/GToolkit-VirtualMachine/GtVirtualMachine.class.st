Class {
	#name : #GtVirtualMachine,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine'
}

{ #category : #'api - accessing' }
GtVirtualMachine >> namedPrimitives [
	^ self primNamedPrimitives collect: [ :eachArray |
		GtVirtualMachineNamedPrimitive new
			plugin: eachArray first;
			primitive: eachArray second;
			address: eachArray third ]
]

{ #category : #'private - primitives' }
GtVirtualMachine >> primNamedPrimitives [
	<primitive: 'get_named_primitives'>
	
	^ #()
]
