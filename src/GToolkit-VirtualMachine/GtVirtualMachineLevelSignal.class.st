Class {
	#name : #GtVirtualMachineLevelSignal,
	#superclass : #GtVirtualMachineSignal,
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #testing }
GtVirtualMachineLevelSignal class >> isAbstract [
	^ self == GtVirtualMachineLevelSignal
]
