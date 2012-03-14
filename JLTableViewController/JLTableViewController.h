//
//  JLTableViewController.h
//  JLTableViewController
//
//  Created by Joseph Lin on 3/14/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JLHeaderView.h"
#import "JLSectionInfo.h"
#import "DefaultCellObject.h"


@interface JLTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView* tableView;
@property (nonatomic, strong) NSMutableArray* sections;

// Table-wide attributes //
@property (nonatomic) UITableViewCellSelectionStyle selectionStyle;
@property (nonatomic, strong) UIFont* textFont;
@property (nonatomic, strong) UIFont* detailTextFont;
@property (nonatomic, strong) UIColor* textColor;
@property (nonatomic, strong) UIColor* detailTextColor;

// Sub-classes can override this method to provide custom header view.
- (JLHeaderView*)headerView;

- (void)createTableViewDataSource;

@end
