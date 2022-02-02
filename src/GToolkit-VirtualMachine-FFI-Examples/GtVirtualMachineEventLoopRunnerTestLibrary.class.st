Class {
	#name : #GtVirtualMachineEventLoopRunnerTestLibrary,
	#superclass : #FFILibrary,
	#category : #'GToolkit-VirtualMachine-FFI-Examples'
}

{ #category : #accessing }
GtVirtualMachineEventLoopRunnerTestLibrary >> runner [
	^ GtVirtualMachineEventLoopCalloutRunner uniqueInstance
]
