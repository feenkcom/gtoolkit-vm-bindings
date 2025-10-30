Class {
	#name : #GtObjectMemoryTallyDetails,
	#superclass : #Object,
	#instVars : [
		'spaceType',
		'amountOfObjects',
		'totalByteSize',
		'byteSizeDetails'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #views }
GtObjectMemoryTallyDetails >> gtSizeDetailsFor: aView [
	<gtView>
	
	^ aView columnedList
		title: 'Size details';
		priority: 7;
		items: [ byteSizeDetails ];
		column: 'Total'
			text: [ :each | (each key * each value) humanReadableSISizeString ];
		column: 'Byte size'
			text: [ :each | each key ];
		column: 'Instances of that size'
			text: [ :each | each value ]
]

{ #category : #testing }
GtObjectMemoryTallyDetails >> isEden [
	^ spaceType = 0
]

{ #category : #testing }
GtObjectMemoryTallyDetails >> isOld [
	^ spaceType = 2
]

{ #category : #testing }
GtObjectMemoryTallyDetails >> isPast [
	^ spaceType = 1
]

{ #category : #accessing }
GtObjectMemoryTallyDetails >> objectsByteSize [
	^ totalByteSize
]

{ #category : #accessing }
GtObjectMemoryTallyDetails >> objectsSize [
	^ amountOfObjects
]

{ #category : #printing }
GtObjectMemoryTallyDetails >> printObjectsByteSize [
	^ totalByteSize humanReadableSISizeString
]

{ #category : #printing }
GtObjectMemoryTallyDetails >> printObjectsSize [
	^ (String streamContents: [ :s | amountOfObjects printSeparatedBy: $' every: 3 signed: false on: s ])
]

{ #category : #printing }
GtObjectMemoryTallyDetails >> printSpaceName [
	^ self spaceType asString capitalized
]

{ #category : #accessing }
GtObjectMemoryTallyDetails >> spaceType [
	self isEden
		ifTrue: [ ^ #eden ].
	self isPast
		ifTrue: [ ^ #past ].
	self isOld
		ifTrue: [ ^ #old ].
	^ #unknown
]
