Class {
	#name : #SomeVirtualMachineStrings,
	#superclass : #GtBoxerValueBox,
	#classVars : [
		'uniqueInstance'
	],
	#category : #'GToolkit-VirtualMachine-SomeBindings'
}

{ #category : #'as yet unclassified' }
SomeVirtualMachineStrings class >> ffiLibrary [
	^ SomeVirtualMachineLibrary uniqueInstance
]

{ #category : #'as yet unclassified' }
SomeVirtualMachineStrings class >> primRelease: aHandle [
	"Plain pointers must be deleted using delete(), all users must implement a specific method"
	self ffiCall: #(void glamorous_vm_virtual_machine_vec_string_release(void* aHandle))
]

{ #category : #'as yet unclassified' }
SomeVirtualMachineStrings >> asArray [
	| length strings stringBox |
	length := self primGetLength.
	strings := Array new: length.
	stringBox := self ffiLibrary newString: ''.

	1
		to: length
		do: [ :i | 
			(self primPop: stringBox)
				ifTrue: [ strings at: i put: stringBox string ]
				ifFalse: [ self error: 'Failed to get a string' ] ].

	stringBox release.
	^ strings
]

{ #category : #'as yet unclassified' }
SomeVirtualMachineStrings >> primGetLength [
	^ self ffiCall: #(size_t glamorous_vm_virtual_machine_vec_string_len(self))
]

{ #category : #'as yet unclassified' }
SomeVirtualMachineStrings >> primPop: aStringBox [
	^ self ffiCall: #(bool glamorous_vm_virtual_machine_vec_string_pop(self, void* aStringBox))
]
