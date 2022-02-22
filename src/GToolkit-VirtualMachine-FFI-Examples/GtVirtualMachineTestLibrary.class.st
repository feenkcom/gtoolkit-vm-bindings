Class {
	#name : #GtVirtualMachineTestLibrary,
	#superclass : #FFILibrary,
	#category : #'GToolkit-VirtualMachine-FFI-Examples'
}

{ #category : #'accessing - platform' }
GtVirtualMachineTestLibrary >> macLibraryName [
	^ FFIMacLibraryFinder findLibrary: 'libTestLibrary.dylib'
]
