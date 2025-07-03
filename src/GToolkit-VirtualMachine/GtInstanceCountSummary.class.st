Class {
	#name : #GtInstanceCountSummary,
	#superclass : #Object,
	#instVars : [
		'targetClassName',
		'instancesCount'
	],
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #accessing }
GtInstanceCountSummary >> instancesCount [
	^ instancesCount
]

{ #category : #accessing }
GtInstanceCountSummary >> instancesCount: anInteger [
	instancesCount := anInteger
]

{ #category : #printing }
GtInstanceCountSummary >> printOn: aStream [ 
	super printOn: aStream.
	
	aStream parenthesize: [
		aStream 
			<< self targetClassName;
			<< ': ';
			print: self instancesCount;
			<< ' instances' ]
]

{ #category : #accessing }
GtInstanceCountSummary >> targetClassName [
	^ targetClassName
]

{ #category : #accessing }
GtInstanceCountSummary >> targetClassName: aClassName [
	targetClassName := aClassName
]
