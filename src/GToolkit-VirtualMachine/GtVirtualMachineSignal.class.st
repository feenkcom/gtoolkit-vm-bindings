Class {
	#name : #GtVirtualMachineSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'fileName',
		'functionName',
		'message'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #signalling }
GtVirtualMachineSignal class >> isAbstract [
	^ self == GtVirtualMachineSignal
]

{ #category : #signalling }
GtVirtualMachineSignal class >> signalName [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtVirtualMachineSignal >> fileName [

	^ fileName
]

{ #category : #accessing }
GtVirtualMachineSignal >> fileName: anObject [

	fileName := anObject
]

{ #category : #accessing }
GtVirtualMachineSignal >> functionName [

	^ functionName
]

{ #category : #accessing }
GtVirtualMachineSignal >> functionName: anObject [

	functionName := anObject
]

{ #category : #accessing }
GtVirtualMachineSignal >> message [

	^ message
]

{ #category : #accessing }
GtVirtualMachineSignal >> message: anObject [

	message := anObject
]

{ #category : #printing }
GtVirtualMachineSignal >> printOneLineContentsOn: aStream [
	aStream
		nextPutAll: self fileName asString;
		nextPutAll: ' in ';
		nextPutAll: self functionName asString;
		cr;
		nextPutAll: self message asString
]
