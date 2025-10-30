Class {
	#name : #SomeTonelLoadInstruction,
	#superclass : #Object,
	#instVars : [
		'kind',
		'name',
		'path',
		'detail'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #'as yet unclassified' }
SomeTonelLoadInstruction >> gtDisplayOn: stream [
	stream
		nextPutAll: 'Load';
		space;
		nextPutAll: kind;
		space;
		nextPutAll: name
]
