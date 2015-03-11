//
//  RootViewController.m
//  vidproto2
//
//  Created by Tom Howe on 10/03/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import "RootViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
   NSLog(@"view loaded");
    [super viewDidLoad];
   // load story
   self.storyModel = [[StoryModel alloc] init];
   NSURL *captionsURL = [[NSBundle mainBundle] URLForResource:@"story2" withExtension:@"json"];
   [self.storyModel loadFromURL:captionsURL];

      NSLog(@"creating pageviewcontroller");
   // create page view controller
   self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
   self.pageViewController.dataSource = self;
   self.pageViewController.delegate = self;
   
   ViewController * startingViewController = [self viewControllerAtIndex:0];
   NSArray * viewControllers = @[startingViewController];
   [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
   
   self.pageViewController.view.frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height-50-30);
   
   //add to current view
   [self addChildViewController:_pageViewController];
   [self.view addSubview:_pageViewController.view];
   [self.pageViewController didMoveToParentViewController:self];
      NSLog(@"end");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
   NSUInteger index = ((ViewController*) viewController).pageIndex;
   
   if (index==0 || index==NSNotFound) { return nil; }
   index --;
   return [self viewControllerAtIndex:index];
   
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
   NSUInteger index = ((ViewController *) viewController).pageIndex;
   if (index==NSNotFound) { return nil; }
   index ++;
   return [self viewControllerAtIndex:index];
}


- (ViewController* )viewControllerAtIndex:(NSUInteger)index {
   NSLog(@"viewcontrolleratindex %d",index);
   if (index >= self.storyModel.chapters.count) return nil;
   
   ViewController* viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
   viewController.pageIndex = index;
   
   //NSLog(@"here %@",[self.storyModel.chapters[index][@"captions"] class]);
   NSMutableDictionary * c = [[NSMutableDictionary alloc]init];
   
   c = self.storyModel.chapters[index];
   
   [viewController setCaptions:c[@"captions"]];
   [viewController setTitle:c[@"title"]];
   [viewController setVidFilename:c[@"vidFilename"]];
   //[self.pageIndicatorLabel setText:self.storyModel.chapters[index][@"title"]];
   return viewController;
   

}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
   if (completed) {
      int index = [self.pageViewController.viewControllers.lastObject pageIndex];
      NSLog(@"completed, index now %d",index);
   [self.pageIndicatorLabel setText:self.storyModel.chapters[index][@"title"]];
   }
}


- (IBAction)nextPageButton:(id)sender {
}
@end
