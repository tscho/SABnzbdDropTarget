//
//  DropDelegate.h
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-08.
//  Copyright 2010 Thomas Schoendorfer. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@protocol DropDelegate

- (void)didDrop:(NSPasteboard *)pasteboard;

@end
