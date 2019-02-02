toolbuilder
buildWith: toolBuilder
	| window |
	window := toolBuilder pluggableWindowSpec new
		model: self;
		label: #titleText;
		extent: 280@100;
		children:
			{toolBuilder pluggableListSpec new
				name: #dropTarget;
				model: self;
				list: #dropTargetItems;
				dropAccept: #wantsDraggedObject:;
				dropItem: #dropObject:;
				dragItem: #dropTargetDragItem:;
				frame: (LayoutFrame fractions: (0 @ 0 corner: 1 @ 1) offsets: (0 @ 0 corner: 0 @ -25))
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #acceptButton;
				model: self;
				label: #acceptText;
				action: #accept;
				enabled: #hasObject;
				frame: (LayoutFrame fractions: (0@1 corner: 1/2 @ 1) offsets: (0 @ -25 corner: 0 @ 0));
				yourself.
			toolBuilder pluggableButtonSpec new
				name: #cancelButton;
				model: self;
				label: #cancelText;
				action: #cancel;
				frame: (LayoutFrame fractions: (1/2 @ 1 corner: 1 @ 1) offsets: (0 @ -25 corner: 0 @ 0));
				yourself};
		yourself.
	^ toolBuilder build: window