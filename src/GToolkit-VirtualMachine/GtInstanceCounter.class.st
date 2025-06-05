Class {
	#name : #GtInstanceCounter,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Core'
}

{ #category : #'as yet unclassified' }
GtInstanceCounter class >> countInstances [
	^ self countInstancesFrom: Smalltalk
]

{ #category : #'as yet unclassified' }
GtInstanceCounter class >> countInstancesFrom: aStartObject [
	| allInstancesCount |
	
	allInstancesCount := self primitiveCountFrom: aStartObject associationClass: Association.
	
	allInstancesCount sort: [ :a :b |a value > b value ].
	^ allInstancesCount asOrderedDictionary
]

{ #category : #'as yet unclassified' }
GtInstanceCounter class >> primitiveCountFrom: aStartObject associationClass: aClass [
	<primitive: 'primitiveInstanceCounterCountAll'>

	^ self primitiveFailed
]
