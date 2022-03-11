Class {
	#name : #GtVirtualMachineErrorSignal,
	#superclass : #GtVirtualMachineLevelSignal,
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #signalling }
GtVirtualMachineErrorSignal class >> signalName [
	^ 'ERROR'
]
