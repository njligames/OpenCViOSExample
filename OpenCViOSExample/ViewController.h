//
//  ViewController.h
//  OpenCViOSExample
//
//  Created by James Folk on 9/5/19.
//  Copyright © 2019 James Folk. All rights reserved.
//

#import <UIKit/UIKit.h>

#include <opencv2/videoio/cap_ios.h>
using namespace cv;

@interface ViewController : UIViewController<CvVideoCameraDelegate>


@end

