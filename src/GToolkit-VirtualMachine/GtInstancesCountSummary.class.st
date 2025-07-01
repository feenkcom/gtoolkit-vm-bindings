Class {
	#name : #GtInstancesCountSummary,
	#superclass : #Object,
	#instVars : [
		'items'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #'instance creation' }
GtInstancesCountSummary class >> fromDataDictionary: aDictionary [ 
	^ self new
		initializeFromDataDictionary: aDictionary 
]

{ #category : #views }
GtInstancesCountSummary >> gtItemsFor: aView [
	<gtView>
	items ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Items';
		items: [ items ];
		column: 'Class' text: [ :each | each targetClassName ];
		column: 'Number of Instances' text: [ :each | each instancesCount ]
]

{ #category : #initialization }
GtInstancesCountSummary >> initializeFromDataDictionary: aDictionary [ 
	items := aDictionary associations collect: [ :assoc |
		GtInstanceCountSummary new 
			targetClassName: (assoc key
				ifNotNil: [ :aClass | aClass name ]) ;
			instancesCount: assoc value ]
]

{ #category : #printing }
GtInstancesCountSummary >> printOn: aStream [ 
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream 
			print: self totalClassesCount;
			<< ' classes; ';
			print: self totalInstancesCount;
			<< ' instances' ]
]

{ #category : #accessing }
GtInstancesCountSummary >> totalClassesCount [
	^ items size
]

{ #category : #accessing }
GtInstancesCountSummary >> totalInstancesCount [
	^ items sumNumbers: [ :each | each instancesCount ]
]
