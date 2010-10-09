//
//  SabNZBDDropDelegate.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "DropDelegate.h"


@interface SabNZBDDropDelegate : NSObject <DropDelegate> {
	@private
	NSArray *classArray;
	NSDictionary *options;
}

@end
