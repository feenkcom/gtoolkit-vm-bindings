Class {
	#name : #GtVirtualMachineCalloutAPI,
	#superclass : #TFCalloutAPI,
	#classInstVars : [
		'CompileMutex'
	],
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #accessing }
GtVirtualMachineCalloutAPI class >> compileMutex [

	^ CompileMutex ifNil: [ CompileMutex := Mutex new ]
]

{ #category : #'instance creation' }
GtVirtualMachineCalloutAPI >> newBuilder [
	^ GtVirtualMachineCalloutMethodBuilder calloutAPI: self
]
