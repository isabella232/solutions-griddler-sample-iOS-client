//
//  OpponentModel.h
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
#import "GTLGriddlerGamePlay.h"

/**
 * The purpose of this interaface is to support basic
 * data about a possible opponent. This interface is used
 * for Griddler players as well as Google+ friends
 */
@interface OpponentModel : NSObject

///The player's ID
@property NSString* playerId;
///The url of the player's image
@property NSString* imageUrl;
///Returns YES if the player is a Google+ user
@property BOOL isPlusUser;
///The name to use for display
@property NSString* displayName;
///The cached image that was downloaded using the imageUrl
@property NSData* cachedImage;

///Initialize based upon a Google+ person
- (id)initWithGooglePlusUser:(GTLPlusPerson*)person;

///Initialize based upon a Griddler player
- (id)initWithGriddlerPlayer:(GTLGriddlerPlayer*)player;

@end
