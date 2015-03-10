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
    [super viewDidLoad];
   
   
   // create page view controller
   self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
   self.pageViewController.dataSource = self;
   
   ViewController * startingViewController = [self viewControllerAtIndex:0];
   NSArray * viewControllers = @[startingViewController];
   [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
   
   self.pageViewController.view.frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height-50-30);
   
   //add to current view
   [self addChildViewController:_pageViewController];
   [self.view addSubview:_pageViewController.view];
   [self.pageViewController didMoveToParentViewController:self];

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

   if (index >= 5) return nil;
   
   ViewController* viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
   viewController.pageIndex = index;
   return viewController;
   

}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
   return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
   return 0;
}

- (IBAction)nextPageButton:(id)sender {
}
@end
