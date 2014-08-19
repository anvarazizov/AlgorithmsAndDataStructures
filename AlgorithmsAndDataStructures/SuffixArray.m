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
	
}

@end
