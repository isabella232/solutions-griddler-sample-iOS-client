//
//  GameModel.m
//  Griddler
//
//  Copyright 2013 Google Inc. All Rights Reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "GameModel.h"
#import "GTLGriddlerBoard.h"
#import "GTLGriddlerGamePlay.h"
#import "GTLGriddlerPlayer.h"
#import "UserSettingsProvider.h"

@implementation GameModel

@synthesize board;
@synthesize gameId;
@synthesize players;

- (id)init:(NSNumber *)identifier
boardDetail:(GTLGriddlerBoard *)boardDetail
playerList:(NSArray *)playerList{
    
    self = [super init];
    
    self.gameId = identifier;
    self.board = boardDetail;
    self.players = playerList;

    return self;
}

- (BOOL)havePlayersFinished {
    
    BOOL playersFinished = YES;
    
    if(self.players){
        
        for(GTLGriddlerGamePlay *gamePlay in self.players){
            
            if(![gamePlay.finished boolValue]){
                playersFinished = NO;
                break;
            }
        }
    }else{
        playersFinished = NO;
    }
    
    return playersFinished;
}

- (BOOL)isSinglePlayerGame {
    
    if([self.players count] == 1){
        return YES;
    }
    
    return NO;
}


- (GTLGriddlerGamePlay*)getCurrentPlayer {
    
    if(self.players){
        
        UserSettingsProvider *settings = [UserSettingsProvider alloc];
        NSNumber *playerId = [settings getPlayerId];
        
        for(GTLGriddlerGamePlay *gamePlay in self.players){
            
            GTLGriddlerPlayer *player = (GTLGriddlerPlayer *)gamePlay.player;
            NSLog(@"Current Player Id %@ Player Id %@", playerId, player.identifier);
            
            if([player.identifier longLongValue] == [playerId longLongValue]){
                return gamePlay;
            }
        }
    }
    
    return nil;
}

- (GTLGriddlerGamePlay*)getOpponent {
    
    if(self.players){
        
        UserSettingsProvider *settings = [UserSettingsProvider alloc];
        NSNumber *playerId = [settings getPlayerId];
        
        for(GTLGriddlerGamePlay *gamePlay in self.players){
            
            //return the first player who isn't the current player
            //app engine is setup for more than two players but the UI
            //is only expecting 2
            GTLGriddlerPlayer *player = (GTLGriddlerPlayer *)gamePlay.player;
            if([player.identifier longLongValue] != [playerId longLongValue]){
                return gamePlay;
            }
        }
    }
    
    return nil;
}

- (void)assignAnswersAndTimeLeft:(NSArray*)answers
                        timeLeft:(NSNumber *)timeLeft {
    
    GTLGriddlerGamePlay *gamePlay = [self getCurrentPlayer];
    gamePlay.correctAnswers = answers;
    gamePlay.timeLeft = timeLeft;
}

@end
