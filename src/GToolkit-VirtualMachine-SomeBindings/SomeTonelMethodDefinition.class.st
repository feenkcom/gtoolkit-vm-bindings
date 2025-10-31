Class {
	#name : #SomeTonelMethodDefinition,
	#superclass : #SomeTonelDefinition,
	#instVars : [
		'className',
		'methodType',
		'selector',
		'header',
		'body',
		'source',
		'category',
		'rawMetadata'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #accessing }
SomeTonelMethodDefinition >> category [
	^ category
]

{ #category : #'as yet unclassified' }
SomeTonelMethodDefinition >> gtDisplayOn: stream [
	stream
		nextPutAll: className.
		
	self isClassSide
		ifTrue: [ stream space; nextPutAll: 'class' ].
		
	stream
		space;
		nextPutAll: '>>';
		space.
		
	stream
		nextPutAll: '#';
		nextPutAll: selector
]

{ #category : #'as yet unclassified' }
SomeTonelMethodDefinition >> isClassSide [
	^ methodType = 'class'
]

{ #category : #'as yet unclassified' }
SomeTonelMethodDefinition >> isInstanceSide [
	^ methodType = 'instance'
]
