Class {
	#name : #BareFFIType,
	#superclass : #Object,
	#instVars : [
		'value',
		'name'
	],
	#classVars : [
		'Bool',
		'F32',
		'F64',
		'I16',
		'I32',
		'I64',
		'I8',
		'ISize',
		'Int',
		'Long',
		'LongLong',
		'Pointer',
		'SChar',
		'Short',
		'U16',
		'U32',
		'U64',
		'U8',
		'UChar',
		'UInt',
		'ULong',
		'ULongLong',
		'UShort',
		'USize',
		'Void'
	],
	#category : #'GToolkit-VirtualMachine-FFI-BareFFI'
}

{ #category : #accessing }
BareFFIType class >> bool [
	^ Bool
]

{ #category : #accessing }
BareFFIType class >> f32 [
	^ F32
]

{ #category : #accessing }
BareFFIType class >> f64 [
	^ F64
]

{ #category : #accessing }
BareFFIType class >> i16 [
	^ I16
]

{ #category : #accessing }
BareFFIType class >> i32 [
	^ I32
]

{ #category : #accessing }
BareFFIType class >> i64 [
	^ I64
]

{ #category : #accessing }
BareFFIType class >> i8 [
	^ I8
]

{ #category : #'class initialization' }
BareFFIType class >> initialize [
	#(Void Bool U8 I8 U16 I16 U32 I32 U64 I64 USize ISize SChar UChar Short UShort Int UInt Long ULong LongLong ULongLong F32 F64 Pointer) withIndexCollect: [ :each :index |
		self classVarNamed: each put: (self new setName: each value: index - 1) ]
]

{ #category : #accessing }
BareFFIType class >> int [
	^ Int
]

{ #category : #accessing }
BareFFIType class >> isize [
	^ ISize
]

{ #category : #accessing }
BareFFIType class >> long [
	^ Long
]

{ #category : #accessing }
BareFFIType class >> longlong [
	^ LongLong
]

{ #category : #accessing }
BareFFIType class >> pointer [
	^ Pointer
]

{ #category : #accessing }
BareFFIType class >> schar [
	^ SChar
]

{ #category : #accessing }
BareFFIType class >> short [
	^ Short
]

{ #category : #accessing }
BareFFIType class >> u16 [
	^ U16
]

{ #category : #accessing }
BareFFIType class >> u32 [
	^ U32
]

{ #category : #accessing }
BareFFIType class >> u64 [
	^ U64
]

{ #category : #accessing }
BareFFIType class >> u8 [
	^ U8
]

{ #category : #accessing }
BareFFIType class >> uchar [
	^ UChar
]

{ #category : #accessing }
BareFFIType class >> uint [
	^ UInt
]

{ #category : #accessing }
BareFFIType class >> ulong [
	^ ULong
]

{ #category : #accessing }
BareFFIType class >> ulonglong [
	^ ULongLong
]

{ #category : #accessing }
BareFFIType class >> ushort [
	^ UShort
]

{ #category : #accessing }
BareFFIType class >> usize [
	^ USize
]

{ #category : #accessing }
BareFFIType class >> void [
	^ Void
]

{ #category : #printing }
BareFFIType >> gtDisplayOn: stream [
	stream nextPutAll: self name
]

{ #category : #accessing }
BareFFIType >> name [
	^ name
]

{ #category : #initialization }
BareFFIType >> setName: aNameSymbol value: aNumber [
	name := aNameSymbol asSymbol.
	value := aNumber
]

{ #category : #accessing }
BareFFIType >> value [
	^ value
]
