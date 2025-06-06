Class {
	#name : #GtReferencedInstanceVariable,
	#superclass : #GtReferencedObject,
	#instVars : [
		'instVarIndex'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtReferencedInstanceVariable >> instVarIndex [
	^ instVarIndex
]

{ #category : #accessing }
GtReferencedInstanceVariable >> instVarIndex: anObject [
	instVarIndex := anObject
]

{ #category : #'as yet unclassified' }
GtReferencedInstanceVariable >> referenceTypeName [
	^ 'Inst.var'
]
