Class {
	#name : #GtInstanceCounter,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #api }
GtInstanceCounter class >> countInstances [
	^ self countInstancesFrom: Smalltalk
]

{ #category : #api }
GtInstanceCounter class >> countInstancesFrom: aStartObject [
	| allInstancesCount |
	
	allInstancesCount := self primitiveCountFrom: aStartObject associationClass: Association.
	
	allInstancesCount sort: [ :a :b |a value > b value ].
	^ allInstancesCount asOrderedDictionary
]

{ #category : #api }
GtInstanceCounter class >> countInstancesSummary [
	^ GtInstancesCountSummary fromDataDictionary: self countInstances
]

{ #category : #primitives }
GtInstanceCounter class >> primitiveCountFrom: aStartObject associationClass: aClass [
	<primitive: 'primitiveInstanceCounterCountAll'>

	^ self primitiveFailed
]
