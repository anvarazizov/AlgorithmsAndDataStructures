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

#pragma mark – 3-way sorting methods

- (void)threeWaySortArray:(NSMutableArray *)array
{
	NSInteger leftIndex = 1;
	NSInteger rightIndex = array.count - 1;
	[self sortArray:array withLeft:leftIndex andRight:rightIndex];
}

- (void)sortArray:(NSMutableArray *)array withLeft:(NSInteger )left andRight:(NSInteger )right
{
	NSInteger i = left - 1;
	NSInteger j = right;
	NSInteger p = left - 1;
	NSInteger q = right;
	
	if (right <= left)
		return;
	
	id v = array[right];
	
	for (; ;)
	{
		while ([array[++i] compare:v] == NSOrderedAscending);
		while ([v compare:array[--j]] == NSOrderedAscending)
			if (j == left) break;
		if (i >= j) break;
		
		[array exchangeObjectAtIndex:i withObjectAtIndex:j];
		
		if ([array[i] compare:v] == NSOrderedSame)
		{
			p++;
			[array exchangeObjectAtIndex:p withObjectAtIndex:i];
		}
		
		if ([v compare:array[j]] == NSOrderedSame)
		{
			q--;
			[array exchangeObjectAtIndex:j withObjectAtIndex:q];
		}
	}
	
	[array exchangeObjectAtIndex:i withObjectAtIndex:right];
	
	j = i - 1;
	i = i + 1;
	
	for (int k = left; k < p; k++)
	{
		[array exchangeObjectAtIndex:k withObjectAtIndex:j--];
	}
	
	for (int k = right - 1; k > q; k--, i++)
	{
		[array exchangeObjectAtIndex:i withObjectAtIndex:k];
	}
	
	[self sortArray:array withLeft:left andRight:j];
	[self sortArray:array withLeft:i andRight:right];
}

@end
