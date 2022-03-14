Class {
	#name : #GtVirtualMachineGenericSignal,
	#superclass : #GtVirtualMachineSignal,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #'instance creation' }
GtVirtualMachineGenericSignal class >> named: aString [
	^ self new name: aString
]

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

{ #category : #signalling }
GtVirtualMachineGenericSignal >> signalName [
	^ self name
]
