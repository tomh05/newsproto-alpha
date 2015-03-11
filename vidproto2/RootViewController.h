//
//  RootViewController.h
//  vidproto2
//
//  Created by Tom Howe on 10/03/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface RootViewController : UIViewController <UIPageViewControllerDataSource,UIPageViewControllerDelegate>


@property (strong, nonatomic) StoryModel *storyModel;

@property (strong,nonatomic) UIPageViewController* pageViewController;

@property (weak, nonatomic) IBOutlet UILabel *pageIndicatorLabel;

- (IBAction)nextPageButton:(id)sender;

@end
