//
//  BasicCellObject.m
//  JLTableViewController
//
//  Created by Joseph Lin on 3/9/12.
//  Copyright (c) 2012 Joseph Lin. All rights reserved.
//

#import "DefaultCellObject.h"


@implementation DefaultCellObject

@synthesize text, detailText, imageName;
@synthesize accessoryView, accessoryType;
@synthesize action;
@synthesize cellIdentifier, cellStyle;
@synthesize selectionStyle, textFont, detailTextFont, textColor, detailTextColor;


+ (id)objectWithText:(NSString*)text detailText:(NSString*)detailText imageName:(NSString*)imageName accessoryType:(UITableViewCellAccessoryType)accessoryType action:(void (^)(void))action
{
    DefaultCellObject* object = [[DefaultCellObject alloc] init];
    object.text = text;
    object.detailText = detailText;
    object.imageName = imageName;
    object.accessoryType = accessoryType;
    object.action = action;
    return object;
}

- (NSString*)cellIdentifier
{
    if ( !cellIdentifier )
    {
        switch (self.cellStyle)
        {
            case UITableViewCellStyleSubtitle:
                cellIdentifier = @"UITableViewCellStyleSubtitle";
                break;
                
            case UITableViewCellStyleValue1:
                cellIdentifier = @"UITableViewCellStyleValue1";
                break;
                
            case UITableViewCellStyleValue2:
                cellIdentifier = @"UITableViewCellStyleValue2";
                break;
                
            case UITableViewCellStyleDefault:
            default:
                cellIdentifier = @"UITableViewCellStyleDefault";
                break;
        }
    }
    return cellIdentifier;
}

- (UITableViewCellStyle)cellStyle
{
    if ( !cellStyle )
    {
        // "UITableViewCellStyleDefault" is equal to "UITableViewCellStyleValue1"
        // with detailText == nil.
        cellStyle = UITableViewCellStyleValue1;
    }
    return cellStyle;
}



@end

