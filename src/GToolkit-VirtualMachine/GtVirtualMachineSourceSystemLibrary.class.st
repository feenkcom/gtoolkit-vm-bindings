Class {
	#name : #GtVirtualMachineSourceSystemLibrary,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-VirtualMachine-Model'
}

{ #category : #comparing }
GtVirtualMachineSourceSystemLibrary >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name
]

{ #category : #comparing }
GtVirtualMachineSourceSystemLibrary >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash
]

{ #category : #accessing }
GtVirtualMachineSourceSystemLibrary >> name [

	^ name
]

{ #category : #accessing }
GtVirtualMachineSourceSystemLibrary >> name: anObject [

	name := anObject
]

{ #category : #printing }
GtVirtualMachineSourceSystemLibrary >> printOn: aStream [
	"Append a sequence of characters to aStream that identify the receiver."

	super printOn: aStream.
	aStream
		nextPutAll: ' name: ';
		print: name
]
