//
//  JLTableViewController.m
//  JLTableViewController
//
//  Created by Joseph Lin on 3/14/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import "JLTableViewController.h"


@implementation JLTableViewController

@synthesize tableView;
@synthesize sections;
@synthesize selectionStyle, textFont, detailTextFont, textColor, detailTextColor;


#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;    
    
    [self createTableViewDataSource];
}

- (void)createTableViewDataSource
{
    
}

- (UITableView*)tableView
{
    if ( !tableView )
    {
        tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:tableView];
    }
    return tableView;
}

- (void)setSections:(NSMutableArray *)theSections
{
    sections = theSections;
    [self.tableView reloadData];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sections count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    JLSectionInfo* sectionInfo = [self.sections objectAtIndex:section];
    return sectionInfo.headerHeight;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:section];
    return [sectionInfo name];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:section];
    JLHeaderView* headerView = [self headerView];

    if ( [sectionInfo name] && headerView )
    {
        headerView.titleLabel.text = [sectionInfo name];
        return headerView;
    }
    else
    {
        return nil;
    }
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:indexPath.section];
    DefaultCellObject* object = [sectionInfo.objects objectAtIndex:indexPath.row];
    
    UITableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier:object.cellIdentifier];
    
    if ( !cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:object.cellStyle reuseIdentifier:object.cellIdentifier];
        cell.selectionStyle = object.selectionStyle;
        
        // Table-wide attributes //
        if ( self.textFont )
            cell.textLabel.font = self.textFont;
        if ( self.detailTextFont )
            cell.textLabel.font = self.detailTextFont;
        if ( self.textColor )
            cell.textLabel.textColor = self.textColor;
        if ( self.detailTextColor )
            cell.textLabel.textColor = self.detailTextColor;
    }
    
    // cell-specific attributes //
    if ( object.textFont )
        cell.textLabel.font = object.textFont;
    if ( object.detailTextFont )
        cell.textLabel.font = object.detailTextFont;
    if ( object.textColor )
        cell.textLabel.textColor = object.textColor;
    if ( object.detailTextColor )
        cell.textLabel.textColor = object.detailTextColor;
    
    cell.imageView.image = [UIImage imageNamed:object.imageName];
    cell.textLabel.text = object.text;
    cell.detailTextLabel.text = object.detailText;    
    
    cell.accessoryType = object.accessoryType;        
    cell.accessoryView = object.accessoryView;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.sections objectAtIndex:indexPath.section];
    DefaultCellObject* object = [sectionInfo.objects objectAtIndex:indexPath.row];
    
    object.action();
}

- (JLHeaderView*)headerView
{
    return nil;
}



@end
