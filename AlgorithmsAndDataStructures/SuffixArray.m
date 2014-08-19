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
	NSMutableArray * sortedArrayWithSuffixes = [[NSMutableArray alloc] initWithCapacity:string.length];
	NSMutableArray * arrayWithIndexes = [[NSMutableArray alloc] initWithCapacity:string.length];
	
	for (int i = 0; i < string.length; i++)
	{
		NSRange range = NSMakeRange(i, string.length - i);
		NSString * suffix = [string substringWithRange:range];
		[arrayFromString insertObject:suffix atIndex:i];
		sortedArrayWithSuffixes = [NSMutableArray arrayWithArray:[arrayFromString sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
	}
	
	for (int i = 0; i < string.length; i++)
	{
		[arrayWithIndexes insertObject:[NSNumber numberWithInteger:[arrayFromString indexOfObject:sortedArrayWithSuffixes[i]]] atIndex:i];
	}
	
	self.indexes = arrayWithIndexes;
}

- (void)textFromIndex:(NSInteger )index
{
	
}

@end
