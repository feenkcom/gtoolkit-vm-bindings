Class {
	#name : #GtVirtualMachineNonBlockingExternalAsyncCall,
	#superclass : #TFExternalAsyncCall,
	#category : #'GToolkit-VirtualMachine-FFI'
}

{ #category : #'private - semaphore' }
GtVirtualMachineNonBlockingExternalAsyncCall >> deregisterSemaphore [
]

{ #category : #operations }
GtVirtualMachineNonBlockingExternalAsyncCall >> doExecuteOn: aRunner [
	aRunner
		executeFunction: function
		withArguments: parameterArray
		usingSemaphore: self semaphoreIndex
]

{ #category : #operations }
GtVirtualMachineNonBlockingExternalAsyncCall >> executeOn: aRunner [
	^ [
			self prepareExecution.
			self doExecuteOn: aRunner ]
		ensure: [ self cleanUp ]
]

{ #category : #initialization }
GtVirtualMachineNonBlockingExternalAsyncCall >> initialize [
]

{ #category : #'private - semaphore' }
GtVirtualMachineNonBlockingExternalAsyncCall >> registerSemaphore [
]

{ #category : #accessing }
GtVirtualMachineNonBlockingExternalAsyncCall >> reset [
]

{ #category : #accessing }
GtVirtualMachineNonBlockingExternalAsyncCall >> semaphore [
	^ nil
]

{ #category : #accessing }
GtVirtualMachineNonBlockingExternalAsyncCall >> semaphoreIndex [
	^ 0
]

{ #category : #'private - validation' }
GtVirtualMachineNonBlockingExternalAsyncCall >> validateFunction [
	super validateFunction.
	
	function definition returnType resolvedType isVoid
		ifFalse: [ 'Non-blocking call must not return anything!' ].
]
