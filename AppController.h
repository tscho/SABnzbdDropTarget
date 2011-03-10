//
//  AppController.h
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-06.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropView.h"


@interface AppController : NSObject {
	IBOutlet DropView *dropView;
	NSStatusItem *statusItem;
	IBOutlet NSMenu *statusMenu;
}

@property (retain) NSStatusItem *statusItem;
@property (assign) IBOutlet NSMenu *statusMenu;
@property (assign) IBOutlet DropView *dropView;

- (void) setupStatusItem;

@end
