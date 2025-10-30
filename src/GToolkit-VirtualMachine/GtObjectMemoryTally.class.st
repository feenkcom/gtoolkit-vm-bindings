Class {
	#name : #GtObjectMemoryTally,
	#superclass : #Object,
	#instVars : [
		'results'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #'private - primitives' }
GtObjectMemoryTally class >> primitiveAnalyzeObjectMemory: aTallyClass associationClass: anAssociationClass tallyDetailsClass: aDetailsClass shouldIncludeDetails: shouldIncludeDetails [
	<primitive: 'primitiveAnalyzeObjectMemory'>
	
	^ self primitiveFailed
]

{ #category : #'instance creation' }
GtObjectMemoryTally class >> systemWideSpaceTally [
	^ self new initializeWith: (self
		primitiveAnalyzeObjectMemory: GtObjectMemoryTallyItem
		associationClass: Association
		tallyDetailsClass: GtObjectMemoryTallyDetails
		shouldIncludeDetails: true)
]

{ #category : #views }
GtObjectMemoryTally >> gtTallyFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Tally';
		priority: 5;
		items: [ results ];
		column: 'Class'
			text: [ :each | each objectsClass ];
		column: 'Byte size'
			text: [ :each | each printObjectsByteSize ];
		column: 'Instances'
			text: [ :each | each printObjectsSize ]
]

{ #category : #initialization }
GtObjectMemoryTally >> initializeWith: anArrayOfTallyItems [
	results := anArrayOfTallyItems
]

{ #category : #accessing }
GtObjectMemoryTally >> results [
	^ results
]
