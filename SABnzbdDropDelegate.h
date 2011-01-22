//
//  SABnzbdDropDelegate.h
//  SABnzbdDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropDelegate.h"
#import "SABnzbdClient.h"


@interface SABnzbdDropDelegate : NSObject <DropDelegate> {
	@private
	NSArray *classArray;
	NSDictionary *options;
	SABnzbdClient *client;
}

@property (retain) SABnzbdClient *client;

@end
