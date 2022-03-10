Class {
	#name : #GtVirtualMachineLogLevel,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #accessing }
GtVirtualMachineLogLevel class >> debug [
	^ GtVirtualMachineDebugLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel class >> error [
	^ GtVirtualMachineErrorLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel class >> info [
	^ GtVirtualMachineInfoLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel class >> none [
	^ GtVirtualMachineNoneLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel class >> trace [
	^ GtVirtualMachineTraceLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel class >> warning [
	^ GtVirtualMachineWarningLogLevel new
]

{ #category : #accessing }
GtVirtualMachineLogLevel >> value [
	^ self subclassResponsibility
]
