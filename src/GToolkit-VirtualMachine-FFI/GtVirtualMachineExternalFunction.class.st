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

{ #category : #accessing }
GtVirtualMachineExternalFunction >> functionName: anObject [
	functionName := anObject asString
]

{ #category : #accessing }
GtVirtualMachineExternalFunction >> moduleName: anObject [
	moduleName := anObject asString
]

{ #category : #printing }
GtVirtualMachineExternalFunction >> printOn: aStream [

	aStream nextPutAll: functionName asString
]
