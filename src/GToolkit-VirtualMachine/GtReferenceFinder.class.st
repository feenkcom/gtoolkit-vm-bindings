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
	^ self
		primitiveFindAllPathsTo: aTargetObject
		from: aStartObject
		classes: self primitiveReferencedObjectClasses
]

{ #category : #accessing }
GtReferenceFinder class >> findAllPathsToInstancesOf: aClass [
	^ self
		findAllPathsToInstancesOf: aClass
		length: 10
]

{ #category : #accessing }
GtReferenceFinder class >> findAllPathsToInstancesOf: aClass from: aTargetObject length: aPathLen [
	^ self
		primitiveFindAllPathsToInstancesOf: aClass
		from: aTargetObject
		length: aPathLen
		classes: self primitiveReferencedObjectClasses
]

{ #category : #accessing }
GtReferenceFinder class >> findAllPathsToInstancesOf: aClass length: aPathLength [
	^ self
		findAllPathsToInstancesOf: aClass
		from: Smalltalk
		length: aPathLength
]

{ #category : #accessing }
GtReferenceFinder class >> findPathTo: aTargetObject [
	^ self
		findPathTo: aTargetObject
		from: Smalltalk
]

{ #category : #accessing }
GtReferenceFinder class >> findPathTo: aTargetObject from: aStartObject [
	^ self
		primitiveFindPathTo: aTargetObject
		from: aStartObject
		classes: self primitiveReferencedObjectClasses
]

{ #category : #accessing }
GtReferenceFinder class >> findPathToInstanceOf: aClass [
	^ self
		findPathToInstanceOf: aClass
		from: Smalltalk
]

{ #category : #accessing }
GtReferenceFinder class >> findPathToInstanceOf: aClass from: aTargetObject [
	^ self
		primitiveFindPathToInstanceOf: aClass
		from: aTargetObject
		classes: self primitiveReferencedObjectClasses
]

{ #category : #accessing }
GtReferenceFinder class >> primitiveFindAllPathsTo: aTargetObject from: aStartObject classes: referencedObjectClasses [
	<primitive: 'primitiveReferenceFinderFindAllPaths'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
GtReferenceFinder class >> primitiveFindAllPathsToInstancesOf: aClass from: aTargetObject length: aPathLen classes: referencedObjectClasses [
	<primitive: 'primitiveClassInstanceReferenceFinderFindAllPaths'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
GtReferenceFinder class >> primitiveFindPathTo: aTargetObject from: aStartObject classes: referencedObjectClasses [
	<primitive: 'primitiveReferenceFinderFindPath'>
	
	^ self primitiveFail
]

{ #category : #accessing }
GtReferenceFinder class >> primitiveFindPathToInstanceOf: aClass from: aTargetObject classes: referencedObjectClasses [
	<primitive: 'primitiveClassInstanceReferenceFinderFindPath'>
	
	^ self primitiveFailed
]

{ #category : #accessing }
GtReferenceFinder class >> primitiveReferencedObjectClasses [
	^ {GtReferencedRoot.
		GtReferencedInstanceVariable.
		GtReferencedContextVariable.
		GtReferencedArrayItem}
]
