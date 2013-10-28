//
//  OpponentModel.m
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

#import "OpponentModel.h"
#import "GTLGriddlerPlayer.h"
#import "GTLGriddlerGamePlay.h"

@implementation OpponentModel

@synthesize playerId;
@synthesize imageUrl;
@synthesize isPlusUser;
@synthesize displayName;
@synthesize cachedImage;

- (id)initWithGooglePlusUser:(GTLPlusPerson*)person{
    
    self = [super init];
    
    self.playerId = person.identifier;
    self.imageUrl = person.image.url;
    self.isPlusUser = YES;
    self.displayName = person.nickname ?: person.displayName;
    
    return self;
}

- (id)initWithGriddlerPlayer:(GTLGriddlerPlayer*)player{
    
    self = [super init];
    
    self.playerId = [player.identifier stringValue];
    self.imageUrl = nil;
    self.isPlusUser = NO;
    self.displayName = player.nickname;
    
    return self;
}

@end
