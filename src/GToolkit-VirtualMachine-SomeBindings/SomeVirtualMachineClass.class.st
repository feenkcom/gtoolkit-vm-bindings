Class {
	#name : #SomeVirtualMachineClass,
	#superclass : #GtBoxerValueBox,
	#classVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings'
}

{ #category : #'as yet unclassified' }
SomeVirtualMachineClass class >> ffiLibrary [
	^ SomeVirtualMachineLibrary uniqueInstance
]

{ #category : #'as yet unclassified' }
SomeVirtualMachineClass class >> primRelease: aHandle [
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	
]
