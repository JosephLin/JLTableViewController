//
//  ViewController.m
//  SampleApp
//
//  Created by Joseph Lin on 3/14/12.
//  Copyright (c) 2012 R/GA. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController


- (void)createTableViewDataSource
{
    /* Left Sensor */
    
    JLSectionInfo* leftSensorSection = [JLSectionInfo new];
    leftSensorSection.name = NSLocalizedString(@"LEFT SENSOR", @"Settings: Sensor Info");
    leftSensorSection.objects = [NSMutableArray arrayWithCapacity:2];
    [leftSensorSection.objects addObject:
     [DefaultCellObject objectWithText:@"1"
                            detailText:@"111"
                             imageName:nil
                         accessoryType:UITableViewCellAccessoryNone
                                action:^{
                                    
                                }]];
    
    [leftSensorSection.objects addObject:
     [DefaultCellObject objectWithText:@"2"
                            detailText:@"222"
                             imageName:nil
                         accessoryType:UITableViewCellAccessoryNone
                                action:^{
                                    
                                }]];
    
    
    /* Right Sensor */
    
    JLSectionInfo* rightSensorSection = [JLSectionInfo new];
    rightSensorSection.name = NSLocalizedString(@"RIGHT SENSOR", @"Settings: Sensor Info");
    rightSensorSection.objects = [NSMutableArray arrayWithCapacity:2];
    [rightSensorSection.objects addObject:
     [DefaultCellObject objectWithText:@"3"
                            detailText:@"333"
                             imageName:nil
                         accessoryType:UITableViewCellAccessoryNone
                                action:^{
                                    
                                }]];    
    [rightSensorSection.objects addObject:
     [DefaultCellObject objectWithText:@"4"
                            detailText:@"444"
                             imageName:nil
                         accessoryType:UITableViewCellAccessoryNone
                                action:^{
                                    
                                }]];    
        
    self.sections = [NSMutableArray arrayWithObjects:leftSensorSection, rightSensorSection, nil];
}


@end
