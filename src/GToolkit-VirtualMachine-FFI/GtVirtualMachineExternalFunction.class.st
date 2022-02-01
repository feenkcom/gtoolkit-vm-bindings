Class {
	#name : #GtVirtualMachineExternalFunction,
	#superclass : #TFExternalFunction,
	#instVars : [
		'blocking'
	],
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #accessing }
GtVirtualMachineExternalFunction >> blocking [
	^ blocking
]

{ #category : #accessing }
GtVirtualMachineExternalFunction >> blocking: anObject [

	blocking := anObject
]
