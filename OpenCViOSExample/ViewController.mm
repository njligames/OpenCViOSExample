//
//  ViewController.m
//  OpenCViOSExample
//
//  Created by James Folk on 9/5/19.
//  Copyright © 2019 James Folk. All rights reserved.
//

//https://docs.opencv.org/2.4/doc/tutorials/ios/video_processing/video_processing.html#opencviosvideoprocessing

#import "ViewController.h"

#include <opencv2/imgproc.hpp>

@interface ViewController ()
{
    IBOutlet UIImageView* imageView;
    IBOutlet UIButton* button;
    
    CvVideoCamera* videoCamera;
}
@property (nonatomic, retain) CvVideoCamera* videoCamera;

@end

@implementation ViewController

- (IBAction)actionStart:(id)sender
{
    [self.videoCamera start];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    self.videoCamera.defaultAVCaptureDevicePosition = AVCaptureDevicePositionFront;
    self.videoCamera.defaultAVCaptureSessionPreset = AVCaptureSessionPreset352x288;
    self.videoCamera.defaultAVCaptureVideoOrientation = AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    self.videoCamera.grayscaleMode = NO;
    
    self.videoCamera = [[CvVideoCamera alloc] initWithParentView:imageView];
    self.videoCamera.delegate = self;
    
   
}

- (void)viewWillAppear:(BOOL)animated
{
     [self.videoCamera start];
}
#pragma mark - Protocol CvVideoCameraDelegate

#ifdef __cplusplus
- (void)processImage:(Mat&)image;
{
    // Do some OpenCV stuff with the image
    Mat image_copy;
    cvtColor(image, image_copy, CV_BGRA2BGR);
    


    // invert image
    bitwise_not(image_copy, image_copy);
    cvtColor(image_copy, image, CV_BGR2BGRA);
}
#endif

@end
