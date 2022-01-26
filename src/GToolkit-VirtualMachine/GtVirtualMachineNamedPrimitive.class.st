Class {
	#name : #GtVirtualMachineNamedPrimitive,
	#superclass : #Object,
	#instVars : [
		'plugin',
		'primitive',
		'address'
	],
	#category : #'GToolkit-VirtualMachine'
}

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> address [

	^ address
]

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> address: anObject [

	address := anObject
]

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> plugin [

	^ plugin
]

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> plugin: anObject [

	plugin := anObject
]

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> primitive [

	^ primitive
]

{ #category : #accessing }
GtVirtualMachineNamedPrimitive >> primitive: anObject [

	primitive := anObject
]

{ #category : #printing }
GtVirtualMachineNamedPrimitive >> printOn: aStream [

	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' primitive: ';
		print: primitive.
	aStream
		nextPutAll: ' address: ';
		print: address.
	aStream
		nextPutAll: ' plugin: ';
		print: plugin
]
