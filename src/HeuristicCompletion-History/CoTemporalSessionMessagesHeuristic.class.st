"
I am an heuristic that autocompletes messages based on a session vocabulary.
"
Class {
	#name : 'CoTemporalSessionMessagesHeuristic',
	#superclass : 'CoASTNodeFetcherHeuristic',
	#instVars : [
		'session'
	],
	#category : 'HeuristicCompletion-History',
	#package : 'HeuristicCompletion-History'
}

{ #category : 'requests' }
CoTemporalSessionMessagesHeuristic class >> installSessionInSystem [
	<script>
	"self installSessionInSystem"
	
	| engine builder heuBuilder  newElement |
	engine := CoCompletionEngine new.
	
	builder := CoASTHeuristicsResultSetBuilder new. 
	heuBuilder := CoHeuristicBuilder new. 
	newElement := heuBuilder add: CoTemporalSessionMessagesHeuristic new; build.
	newElement next: builder messageHeuristic.
	engine completionBuilder: ( builder messageHeuristic: newElement ).  

	RubSmalltalkEditor completionEngineInstance: engine.
	RubSmalltalkEditor allInstances do: [ :each | each completionEngine: engine ].
]

{ #category : 'requests' }
CoTemporalSessionMessagesHeuristic >> appliesForNode: aNode inContext: aContext [

	^ aNode isMethod or: [ aNode isMessage ]
]

{ #category : 'requests' }
CoTemporalSessionMessagesHeuristic >> buildFetcherFor: aMessageNode inContext: aContext [
	
	^ CoCollectionFetcher onCollection: 
			( self session words collect: [ :each | (NECSelectorEntry contents: each key node: each value) ])
]

{ #category : 'accessing' }
CoTemporalSessionMessagesHeuristic >> session [
	^ session ifNil: [ session := CoSession current ]
]

{ #category : 'accessing' }
CoTemporalSessionMessagesHeuristic >> session: anObject [
	session := anObject
]
