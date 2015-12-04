//
//  MusicLooperPlayer.m
//  MusicLooper
//
//  Created by Mac on 29/09/15.
//  Copyright (c) 2015 samuraibonzai. All rights reserved.
//

#import "MusicLooperPlayer.h"
@import AVFoundation;

@interface MusicLooperPlayer ()
{
    NSMutableArray* _audioPlayers;
    BOOL _isPlaying;
}

@end

@implementation MusicLooperPlayer

- (instancetype) init
{
    self = [super init];
    
    if(self)
    {
        _audioPlayers = [NSMutableArray new];
        
        NSArray* names = @[@"sound1", @"sound2", @"sound3", @"sound4"];
        
        for (NSString* name in names)
        {
            NSString* path = [[NSBundle mainBundle] pathForResource:name ofType:@"wav"];
            NSURL* url = [NSURL URLWithString:path];
            
            NSError* error;
            
            AVAudioPlayer* player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
            player.enableRate = YES;
            player.numberOfLoops = -1;
            
            [_audioPlayers addObject:player];
        }
        
        _isPlaying = NO;
        self.volume = 1.0f;
    }
    
    return self;
}

- (void) setVolume:(float)volume
{
    _volume = volume;
    
    if( _isPlaying )
    {
        for( AVAudioPlayer* aPlayer in _audioPlayers )
        {
            aPlayer.volume = volume;
        }
    }
}

- (void) setSpeed:(float)speed
{
    for( AVAudioPlayer* aPlayer in _audioPlayers )
    {
        aPlayer.rate = speed;
    }
    
    _speed = speed;
}

- (void) start
{
    for( AVAudioPlayer* aPlayer in _audioPlayers )
    {
        [aPlayer play];
        aPlayer.volume = 0.0;
    }
}

- (void) play
{
    for( AVAudioPlayer* aPlayer in _audioPlayers )
    {
        aPlayer.volume = self.volume;
    }
    
    _isPlaying = YES;
}

- (void) mute
{
    for( AVAudioPlayer* aPlayer in _audioPlayers )
    {
        aPlayer.volume = 0.0f;
    }
    
    _isPlaying = NO;
}

@end
