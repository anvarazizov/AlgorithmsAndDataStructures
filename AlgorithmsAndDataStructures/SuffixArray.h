//
//  SuffixArray.h
//  AlgorithmsAndDataStructures
//
//  Created by Anvar Azizov on 14/08/19.
//  Copyright (c) 2014 Anvar Azizov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuffixArray : NSObject

@property (nonatomic, strong) NSString * text;
@property (nonatomic, strong) NSArray * indexes;

- (id)initWithText:(NSString *)text;
- (void)textFromIndex:(NSInteger )index;

@end
