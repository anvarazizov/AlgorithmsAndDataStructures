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
		_text = text;
		[self createArrayFromString:_text];
	}
	
	return self;
}

- (void)createArrayFromString:(NSString *)string
{
	NSInteger length = string.length;
	NSMutableArray * arrayFromString = [[NSMutableArray alloc] initWithCapacity:length];
	
	for (int index = 0; index < length; ++index)
	{
		[arrayFromString addObject:[NSNumber numberWithInteger:index]];
	}
	
	[arrayFromString sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		return [[self textFromIndex:[obj1 integerValue]] compare:[self textFromIndex:[obj2 integerValue]]];
	}];
	
	self.indexes = arrayFromString;
}

- (NSString *)textFromIndex:(NSInteger )index
{
	NSRange range = NSMakeRange(index, _text.length - index);
	NSString * text = [_text substringWithRange:range];
	
	return text;
}

@end
