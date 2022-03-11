Class {
	#name : #GtVirtualMachineDebugSignal,
	#superclass : #GtVirtualMachineLevelSignal,
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #signalling }
GtVirtualMachineDebugSignal class >> signalName [
	^ 'DEBUG'
]
