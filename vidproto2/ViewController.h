//
//  ViewController.h
//  vidproto2
//
//  Created by Tom Howe on 27/02/2015.
//  Copyright (c) 2015 Tom Howe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "StoryModel.h"

@interface ViewController : UIViewController



// Video and captions
@property NSUInteger pageIndex;


@property (strong, nonatomic) NSMutableDictionary * captions;

@property (strong,nonatomic) NSURL *videoURL;
@property (strong,nonatomic) MPMoviePlayerController *videoController;

@property (strong,nonatomic) NSTimer *videoTimer;



@property (weak, nonatomic) IBOutlet UILabel *caption;

-(void)initVideo;

-(void)timeCallback;
- (IBAction)hitplay:(id)sender;
@end

