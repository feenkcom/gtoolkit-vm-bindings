Class {
	#name : #SomeTonelTraitDocument,
	#superclass : #SomeTonelDocument,
	#instVars : [
		'definition',
		'methods',
		'sourcePath'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #'as yet unclassified' }
SomeTonelTraitDocument >> name [
	^ definition name
]
