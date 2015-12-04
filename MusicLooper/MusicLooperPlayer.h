//
//  MusicLooperPlayer.h
//  MusicLooper
//
//  Created by Mac on 29/09/15.
//  Copyright (c) 2015 samuraibonzai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicLooperPlayer : NSObject

@property (nonatomic,setter=setVolume:) float volume;
@property (nonatomic,setter=setSpeed:) float speed;

- (instancetype) init;
- (void)start;
- (void)play;
- (void)mute;

@end
