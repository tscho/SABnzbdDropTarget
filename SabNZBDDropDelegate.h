//
//  SabNZBDDropDelegate.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropDelegate.h"
#import "SabNZBDClient.h"


@interface SabNZBDDropDelegate : NSObject <DropDelegate> {
	@private
	NSArray *classArray;
	NSDictionary *options;
	SabNZBDClient *client;
}

@property (retain) SabNZBDClient *client;

@end
