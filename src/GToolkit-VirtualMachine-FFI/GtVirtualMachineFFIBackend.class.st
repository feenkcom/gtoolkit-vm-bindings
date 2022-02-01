Class {
	#name : #GtVirtualMachineFFIBackend,
	#superclass : #TFFIBackend,
	#type : #bytes,
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #accessing }
GtVirtualMachineFFIBackend class >> priority [
	^ 20
]

{ #category : #'private - ffi' }
GtVirtualMachineFFIBackend >> calloutAPIClass [
	^ GtVirtualMachineCalloutAPI
]
