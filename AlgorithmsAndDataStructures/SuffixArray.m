//
//  SuffixArray.m
//  AlgorithmsAndDataStructures
//
//  Created by Anvar Azizov on 14/08/19.
//  Copyright (c) 2014 Anvar Azizov. All rights reserved.
//

#import "SuffixArray.h"

@interface SuffixArray ()

@end

@implementation SuffixArray

- (id)initWithText:(NSString *)text
{
	if (self = [super init])
	{
		self.text = text;
		[self createArrayFromString:self.text];
	}
	
	return self;
}

- (void)createArrayFromString:(NSString *)string
{
	NSMutableArray * arrayFromString = [[NSMutableArray alloc] initWithCapacity:string.length];

	for (int i = 0; i < string.length; i++)
	{
		NSRange range = NSMakeRange(i, string.length - i);
		NSString * suffix = [string substringWithRange:range];
		[arrayFromString insertObject:suffix atIndex:i];
	}
	
	self.indexes = [arrayFromString sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

- (void)textFromIndex:(NSInteger )index
{
	
}

@end
