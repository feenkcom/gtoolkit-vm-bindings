Class {
	#name : #GtVirtualMachineEventLoopRunnerExamples,
	#superclass : #Object,
	#category : #'GToolkit-VirtualMachine-FFI-Examples'
}

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> ffiNonBlockingCurrentThreadCallWithoutArguments [
	^ self ffiCall: #(void print_current_thread_name()) library: GtVirtualMachineTestLibrary options: #(optNonBlocking)
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> ffiNonBlockingEventLoopCallWithoutArguments [
	^ self ffiCall: #(void print_current_thread_name()) library: GtVirtualMachineTestLibrary options: #(optEventLoop optNonBlocking)
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> nonBlockingCurrentThreadCallWithoutArguments [
	<gtExample>
	
	^ self ffiNonBlockingCurrentThreadCallWithoutArguments
]

{ #category : #examples }
GtVirtualMachineEventLoopRunnerExamples >> nonBlockingEventLoopCallWithoutArguments [
	<gtExample>
	
	^ self ffiNonBlockingEventLoopCallWithoutArguments
]
