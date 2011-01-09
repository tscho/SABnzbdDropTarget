//
//  SabNZBD.m
//  SabNZBDDropTarget
//
//  Created by Thomas Schoendorfer on 10-10-13.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SabNZBD.h"


@implementation SabNZBD

@synthesize host;
@synthesize apiKey;

- (id)initWithConnectionDetails:(NSString *)host apiKey:(NSString *)apiKey {
	if(self = [super init]) {
		[self setHost:host];
		[self setApiKey:apiKey];
	}
	
	return self;
}

- (BOOL)addNzb:(NSURL *)url {
	NSURL *requestUrl = [[NSURL alloc] initWithString:
						 [NSString stringWithFormat:@"%@/api?mode=addurl&name=%@&apikey=%@",
							host,
							[url description],
							apiKey]];
	
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
	NSHTTPURLResponse *response = [NSHTTPURLResponse alloc];
	NSError *error = [NSError alloc];
	
	[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

	return [response statusCode] == 200;
}
@end