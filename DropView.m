//
//  DropView.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DropView.h"


@implementation DropView

@synthesize statusItem;
@synthesize icon;
@synthesize dropDelegate;

- (id)initWithFrame:(NSRect)frame {
	NSLog(@"Init");
    self = [super initWithFrame:frame];
    if (self) {
        statusItem = nil;
		icon = nil;
		isMenuVisible = NO;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
	NSLog(@"Drawing: w:%f h:%f", 
		  [self bounds].size.width,
		  [self bounds].size.height);
	NSLog(@"Image: %@, bounds %@", icon);

	//[statusItem setLength:[icon size].width];
	[statusItem drawStatusBarBackgroundInRect:[self bounds] withHighlight:isMenuVisible];
	NSPoint origin = NSMakePoint(StatusItemViewPaddingWidth, StatusItemViewPaddingHeight);
	
	[icon drawAtPoint:origin fromRect:[self bounds] operation:NSCompositeSourceOver fraction:1.0];
}

- (void)dealloc {
	[statusItem release];
	[icon release];
	[super dealloc];
}

- (void)mouseDown:(NSEvent *)theEvent {
	[[self menu] setDelegate:self];
	[statusItem popUpStatusItemMenu:[self menu]];
	[self setNeedsDisplay:YES];
}

- (void)rightMouseDown:(NSEvent *)theEvent {
	[self mouseDown:theEvent];
}

- (void)menuWillOpen:(NSMenu *)menu {
	isMenuVisible = YES;
	[self setNeedsDisplay:YES];
}

- (void)menuDidClose:(NSMenu *)menu {
	isMenuVisible = NO;
	[menu setDelegate:nil];
	[self setNeedsDisplay:YES];
}

- (void)setIcon:(NSImage *)newIcon {	if (![icon isEqual:newIcon]) {
		[newIcon retain];
		[icon release];
		icon = newIcon;
		[self setNeedsDisplay:YES];
	[statusItem setLength:[statusItem length]];
	}
}

- (NSDragOperation)draggingEntered:(id <NSDraggingInfo>)sender {
	isMenuVisible = YES;
	[self setNeedsDisplay:YES];
	
	//return [sender draggingSourceOperationMask];
	return NSDragOperationCopy;
}

-(void)draggingExited:(id <NSDraggingInfo>)sender {
	isMenuVisible = NO;
	[self setNeedsDisplay:YES];
}

-(void)draggingEnded:(id <NSDraggingInfo>)sender {
	isMenuVisible = NO;
	[self setNeedsDisplay:YES];
	
	NSPasteboard *pasteboard = [sender draggingPasteboard];
	[dropDelegate didDrop:pasteboard];
}

@end
