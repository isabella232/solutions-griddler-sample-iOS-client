//
//  GameModel.h
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

#import <Foundation/Foundation.h>
#import "GTLGriddlerBoard.h"
#import "GTLGriddlerGamePlay.h"

/**
 * The purpose of thie interface is to support exposing
 * data and functionality around a game such as the board
 * configuration and players
 */
@interface GameModel : NSObject

///The Game ID
@property (retain) NSNumber* gameId;
///The board data/configuration
@property (retain) GTLGriddlerBoard *board;
///The list of players
@property (retain) NSArray *players;

///Initialize the game with the ID, board, and players
- (id) init:(NSNumber*)gameId
boardDetail:(GTLGriddlerBoard*)boardDetail
 playerList:(NSArray*)playerList;

///Returns YES if all players have finished the game
- (BOOL)havePlayersFinished;

///Returns YES if it is a single player game
- (BOOL)isSinglePlayerGame;

///Get the current player
- (GTLGriddlerGamePlay*)getCurrentPlayer;

///Get the opponent
- (GTLGriddlerGamePlay*)getOpponent;

///Assign the answers the player solved correctly
- (void)assignAnswersAndTimeLeft:(NSArray*)answers
                        timeLeft:(NSNumber*)timeLeft;



@end
