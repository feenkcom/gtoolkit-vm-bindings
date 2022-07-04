Class {
	#name : #GtVirtualMachineSourceLibrary,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-VirtualMachine-Model'
}

{ #category : #accessing }
GtVirtualMachineSourceLibrary >> name [

	^ name
]

{ #category : #accessing }
GtVirtualMachineSourceLibrary >> name: anObject [

	name := anObject
]

{ #category : #printing }
GtVirtualMachineSourceLibrary >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]
