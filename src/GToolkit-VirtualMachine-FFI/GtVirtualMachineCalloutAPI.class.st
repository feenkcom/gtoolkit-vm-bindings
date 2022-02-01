Class {
	#name : #GtVirtualMachineCalloutAPI,
	#superclass : #TFCalloutAPI,
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #'instance creation' }
GtVirtualMachineCalloutAPI >> newBuilder [
	^ GtVirtualMachineCalloutMethodBuilder calloutAPI: self
]
