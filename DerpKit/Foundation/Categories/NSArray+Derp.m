//
//  NSArray+Derp.m
//  DerpKit
//
//  Created by Steve Streza on 10/25/12.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

#import "NSArray+Derp.h"

@implementation NSArray (Derp)

-(NSArray *)derp_arrayByMappingWithHandler:(id (^)(id object, NSUInteger index, BOOL *stop))handler{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
	
	BOOL stop = NO;
	for(NSUInteger index = 0; index < self.count; index++){
		id object = self[index];
		id outObject = handler(object, index, &stop);
		
		if(outObject){
			[array addObject:outObject];
		}
		
		if(stop){
			break;
		}
	}
	return [array copy];
}

-(NSArray *)derp_subarrayByFilteringWithHandler:(BOOL (^)(id object, NSUInteger index, BOOL *stop))handler{
	NSMutableArray *array = [self mutableCopy];
	
	BOOL stop = NO;
	for(NSUInteger index = 0; index < self.count; index++){
		id object = self[index];
		BOOL success = handler(object, index, &stop);
		if(!success){
			[array removeObject:object];
		}
		if(stop){
			break;
		}
	}

	return [array copy];
}

@end
