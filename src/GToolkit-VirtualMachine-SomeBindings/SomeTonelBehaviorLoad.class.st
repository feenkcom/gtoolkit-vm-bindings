Class {
	#name : #SomeTonelBehaviorLoad,
	#superclass : #SomeTonelLoad,
	#instVars : [
		'order',
		'document'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #views }
SomeTonelBehaviorLoad >> gtDocumentFor: aView [
	<gtView>
	^ aView forward
		title: 'Methods';
		priority: 5;
		object: [ document ];
		view: #gtMethodsFor:
]

{ #category : #'as yet unclassified' }
SomeTonelBehaviorLoad >> name [
	^ document name
]
