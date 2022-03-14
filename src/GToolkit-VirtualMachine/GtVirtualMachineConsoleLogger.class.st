Class {
	#name : #GtVirtualMachineConsoleLogger,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #'api - logger' }
GtVirtualMachineConsoleLogger class >> startFor: aLoggerSignalClass [
	GtVirtualMachine instance
		enableSignal: aLoggerSignalClass;
		startConsoleLogger
]

{ #category : #'api - logger' }
GtVirtualMachineConsoleLogger class >> stop [
	GtVirtualMachine instance stopLogger
]
