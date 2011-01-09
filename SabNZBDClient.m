//
//  SabNZBD.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SabNZBDClient.h"


@implementation SabNZBDClient

@synthesize host;
@synthesize apiKey;

- (id)initWithConnectionDetails:(NSURL *)withHost withApiKey:(NSString *)withApiKey {
	if(self = [super init]) {
		[self setHost:[withHost retain]];
		[self setApiKey:[withApiKey retain]];
	}
	return self;
}

- (BOOL)addNzb:(NSURL *)url {
	NSURL *requestUrl = [[NSURL alloc] initWithString:
						 [NSString stringWithFormat:@"%@/api?mode=addurl&name=%@&apikey=%@",
							[host description],
							[[url description] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],
							apiKey]];
	
	NSLog(@"Request URL: %@", requestUrl);
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSHTTPURLResponse *response = [NSHTTPURLResponse alloc];
	NSError *error = [NSError alloc];
	
	[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

	//NSLog(@"Error: %@", error);
	NSLog(@"Got response %d", [response statusCode]);
	return [response statusCode] == 200;
}

-(void) dealloc {
	[host release];
	[apiKey release];
	[super dealloc];
}
@end
