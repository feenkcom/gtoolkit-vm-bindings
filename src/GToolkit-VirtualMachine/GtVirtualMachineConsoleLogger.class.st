Class {
	#name : #GtVirtualMachineConsoleLogger,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-Logger'
}

{ #category : #running }
GtVirtualMachineConsoleLogger class >> startFor: aLoggerSignalClass [
	GtVirtualMachine instance
		enableSignal: aLoggerSignalClass;
		startConsoleLogger
]
