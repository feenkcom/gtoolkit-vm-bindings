Class {
	#name : #GtReferencedObject,
	#superclass : #Object,
	#instVars : [
		'object'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #'as yet unclassified' }
GtReferencedObject >> gtDisplayOn: stream [
	self object gtDisplayOn: stream
]

{ #category : #accessing }
GtReferencedObject >> object [
	^ object
]

{ #category : #accessing }
GtReferencedObject >> object: anObject [
	object := anObject
]

{ #category : #'as yet unclassified' }
GtReferencedObject >> referenceTypeName [
	^ 'Reference'
]
