//
//  ViewController.m
//  MusicLooper
//
//  Created by Mac on 29/09/15.
//  Copyright (c) 2015 samuraibonzai. All rights reserved.
//

#import "ViewController.h"
#import "MusicLooperPlayer.h"

@interface ViewController ()
{
    MusicLooperPlayer* _mainPlayer;
}

@property (nonatomic,setter=setVolume:) float volume;

@end

@implementation ViewController

-(void) setVolume:(float)volume
{
    self.volumeSlider.value = volume;
    self.volumeSegment.selectedSegmentIndex = (volume*100-1)/25;
    
    _mainPlayer.volume = volume;
    
    _volume = volume;
}

- (IBAction)switchValueChanged:(UISwitch*)sender {
    if( sender.on == NO )
    {
        [_mainPlayer mute];
    }
    else
    {
        [_mainPlayer play];
    }
}

- (IBAction)volumeValueChanged:(UISegmentedControl *)sender {
    self.volume = 0.25f + sender.selectedSegmentIndex*0.25;
}

- (IBAction)sliderVolumeChanged:(UISlider *)sender{
    self.volume = sender.value;
}
- (IBAction)speedValueChanged:(UIStepper *)sender {
    _mainPlayer.speed = 0.5 + (sender.value-1)/3*1.5;
    
    self.speedLabel.text = [NSString stringWithFormat:@"Speed: %.1fx", _mainPlayer.speed];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if( self )
    {
        _mainPlayer = [[MusicLooperPlayer alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    // Do any additional setup after loading the view, typically from a nib.
    [_mainPlayer start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
