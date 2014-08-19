//
//  SuffixesTableViewController.m
//  AlgorithmsAndDataStructures
//
//  Created by Anvar Azizov on 14/08/19.
//  Copyright (c) 2014 Anvar Azizov. All rights reserved.
//

#import "SuffixesTableViewController.h"
#import "SuffixArray.h"

@interface SuffixesTableViewController ()

@property (nonatomic, strong) SuffixArray * suffixArray;

@end

@implementation SuffixesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.suffixArray = [[SuffixArray alloc] initWithText:@"tintinnabulation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.suffixArray.indexes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString * cellIdentifier = @"tableCell";
	
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
	cell.textLabel.text = [self.suffixArray textFromIndex:[indexPath row]];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Suffix index is %@", self.suffixArray.indexes[indexPath.row]];
    
    return cell;
}

@end
