"
An alternative to {{gtClass:ReferenceFinder}} implemented as a VM primitive.
Approximately ~20x faster.
"
Class {
	#name : #GtReferenceFinder,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtReferenceFinder class >> findAllNeighbours: aStartObject [
	<primitive: 'primitiveReferenceFinderGetNeighbours'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
GtReferenceFinder class >> findAllPathsTo: aTargetObject [
	^ self
		findAllPathsTo: aTargetObject
		from: Smalltalk
]

{ #category : #accessing }
GtReferenceFinder class >> findAllPathsTo: aTargetObject from: aStartObject [ 
	<primitive: 'primitiveReferenceFinderFindAllPaths'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
GtReferenceFinder class >> findPathTo: aTargetObject [
	^ self
		findPathTo: aTargetObject
		from: Smalltalk
]

{ #category : #accessing }
GtReferenceFinder class >> findPathTo: aTargetObject from: aStartObject [
	<primitive: 'primitiveReferenceFinderFindPath'>
	
	^ self primitiveFail
]
