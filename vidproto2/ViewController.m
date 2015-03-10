//
//  ViewController.m
//  vidproto2
//
//  Created by Tom Howe on 27/02/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController




- (void)viewDidLoad {
   self.captions = [[NSMutableDictionary alloc] init];
   [super viewDidLoad];

   

[self initVideo];
}

-(void) setCaptions:(NSMutableDictionary *)caps{
   self.captions = caps;
}



- (void)didReceiveMemoryWarning {
   [super didReceiveMemoryWarning];
   // Dispose of any resources that can be recreated.
}




- (void)initVideo {
   NSURL *vidUrl = [[NSBundle mainBundle] URLForResource:@"plane" withExtension:@"mov"];
   self.videoURL = vidUrl;
   self.videoController = [[MPMoviePlayerController alloc] init];
   
   [self.videoController setContentURL:self.videoURL];
   self.videoController.movieSourceType = MPMovieSourceTypeFile;
   
   CGFloat w = self.view.bounds.size.width;
   CGFloat h = 9.0f * w / 16.0f;
   [self.videoController.view setFrame:CGRectMake(0, 0, w,h)];
   //[self.videoController.view setFrame:[[self view] bounds]];
   [self.view addSubview:self.videoController.view];
   
   [self.videoController play];
   self.videoController.controlStyle=MPMovieControlStyleDefault;
   [self.videoController setFullscreen:YES];
   
   
   self.videoTimer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timeCallback) userInfo:nil repeats:YES];
}


-(void)timeCallback {
 
      NSLog(@"call");
   
   //NSString * body = [[NSString alloc] init];
   for(NSDictionary *caption in self.captions) {

      if ([caption[@"start"] doubleValue] <self.videoController.currentPlaybackTime && [caption[@"end"] doubleValue] >self.videoController.currentPlaybackTime ) {

   [self.caption setText:caption[@"body"]];
         break;
      }
      
   }


}



- (IBAction)hitplay:(id)sender {
   [self.videoController play];
   NSLog(@"play");

}

@end
