Class {
	#name : #GtObjectMemoryTallyItem,
	#superclass : #Object,
	#instVars : [
		'class',
		'amountOfObjects',
		'totalByteSize',
		'detailsPerSpace'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtObjectMemoryTallyItem >> analyzedClassName [
	^ class name
]

{ #category : #accessing }
GtObjectMemoryTallyItem >> detailsPerSpace [
	^ detailsPerSpace
]

{ #category : #views }
GtObjectMemoryTallyItem >> gtDetailsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Details';
		priority: 5;
		items: [ {'Class' -> class.
				'Size of instances' -> self printObjectsByteSize.
				'Number of instances' -> self printObjectsSize } ];
		column: 'Property' text: [ :each | each key ];
		column: 'Value' text: [ :each | each value ];
		send: [ :each | each value ]
]

{ #category : #views }
GtObjectMemoryTallyItem >> gtSpaceDetailsFor: aView [
	<gtView>
	
	detailsPerSpace ifNil: [ ^ aView empty ].
	
	^ aView columnedList
		title: 'Per space';
		priority: 7;
		items: [ detailsPerSpace ];
		column: 'Space'
		text: [ :each | each printSpaceName ];
		column: 'Byte size'
			text: [ :each | each printObjectsByteSize ];
		column: 'Instances'
			text: [ :each | each printObjectsSize ]
]

{ #category : #accessing }
GtObjectMemoryTallyItem >> objectsByteSize [
	^ totalByteSize
]

{ #category : #accessing }
GtObjectMemoryTallyItem >> objectsClass [
	^ class
]

{ #category : #accessing }
GtObjectMemoryTallyItem >> objectsSize [
	^ amountOfObjects
]

{ #category : #printing }
GtObjectMemoryTallyItem >> printObjectsByteSize [
	^ totalByteSize humanReadableSISizeString
]

{ #category : #printing }
GtObjectMemoryTallyItem >> printObjectsSize [
	^ (String streamContents: [ :s | amountOfObjects printSeparatedBy: $' every: 3 signed: false on: s ])
]
