Class {
	#name : #GtVirtualMachineSymbolNotFoundError,
	#superclass : #Error,
	#instVars : [
		'symbolName',
		'moduleName'
	],
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #accessing }
GtVirtualMachineSymbolNotFoundError >> description [
	^ String streamContents: [ :aStream |
		aStream
			nextPutAll: 'Could not find ';
			nextPutAll: symbolName printString;
			nextPutAll: ' in ';
			nextPutAll: moduleName printString ]
]

{ #category : #accessing }
GtVirtualMachineSymbolNotFoundError >> moduleName [

	^ moduleName
]

{ #category : #accessing }
GtVirtualMachineSymbolNotFoundError >> moduleName: anObject [

	moduleName := anObject
]

{ #category : #accessing }
GtVirtualMachineSymbolNotFoundError >> symbolName [

	^ symbolName
]

{ #category : #accessing }
GtVirtualMachineSymbolNotFoundError >> symbolName: anObject [

	symbolName := anObject
]
