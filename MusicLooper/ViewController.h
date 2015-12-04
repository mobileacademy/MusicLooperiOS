//
//  ViewController.h
//  MusicLooper
//
//  Created by Mac on 29/09/15.
//  Copyright (c) 2015 samuraibonzai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *volumeSegment;
@property (weak, nonatomic) IBOutlet UILabel *speedLabel;

@end

