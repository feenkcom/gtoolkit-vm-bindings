Class {
	#name : #SomeTonelClassDocument,
	#superclass : #SomeTonelDocument,
	#instVars : [
		'definition',
		'methods',
		'sourcePath'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #views }
SomeTonelClassDocument >> gtMethodsFor: aView [
	<gtView>
	methods ifNil: [ ^ aView empty ].
	^ aView columnedList
		title: 'Methods';
		priority: 5;
		items: [ methods ];
		column: 'Method' text: [ :each | each gtDisplayString ];
		column: 'Category' text: [ :each | each category ]
]

{ #category : #views }
SomeTonelClassDocument >> gtViewFor: aView [
	<gtView>
	^ aView forward
		title: 'Source code';
		priority: 9;
		object: [ sourcePath asFileReference ];
		view: #gtContentsFor:
]

{ #category : #'as yet unclassified' }
SomeTonelClassDocument >> name [
	^ definition name
]
