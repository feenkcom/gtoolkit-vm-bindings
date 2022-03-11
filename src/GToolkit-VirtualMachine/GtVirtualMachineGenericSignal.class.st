Class {
	#name : #GtVirtualMachineGenericSignal,
	#superclass : #GtVirtualMachineSignal,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #signalling }
GtVirtualMachineGenericSignal class >> signalName [
	^ nil
]

{ #category : #accessing }
GtVirtualMachineGenericSignal >> name [
	^ name
]

{ #category : #accessing }
GtVirtualMachineGenericSignal >> name: anObject [

	name := anObject
]
