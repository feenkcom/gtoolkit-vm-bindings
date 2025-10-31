Class {
	#name : #SomeTonelLoadPrecondition,
	#superclass : #Object,
	#instVars : [
		'requiredName',
		'requiredKind',
		'reason',
		'dependent'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings-Tonel'
}

{ #category : #accessing }
SomeTonelLoadPrecondition >> dependent [
	^ dependent
]

{ #category : #accessing }
SomeTonelLoadPrecondition >> reason [
	^ reason
]

{ #category : #accessing }
SomeTonelLoadPrecondition >> requiredKind [
	^ requiredKind
]

{ #category : #accessing }
SomeTonelLoadPrecondition >> requiredName [
	^ requiredName
]
