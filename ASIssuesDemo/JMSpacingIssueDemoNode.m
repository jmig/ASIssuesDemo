//
//  JMSpacingIssueDemoNode.m
//  ASIssuesDemo
//
//  Created by jmig on 4/12/16.
//  Copyright © 2016 Jmig. All rights reserved.
//

#import "JMSpacingIssueDemoNode.h"

@interface JMSpacingIssueDemoNode ()

@property(nonatomic, strong) ASNetworkImageNode *topImageNode;
@property(nonatomic, strong) ASTextNode *topTextNode;
@property(nonatomic, strong) ASNetworkImageNode *bottomImageNode;
@property(nonatomic, strong) ASTextNode *bottomTextNode;

@end

@implementation JMSpacingIssueDemoNode

- (instancetype)init {
  if (self = [super init]) {
    _topImageNode = [[ASNetworkImageNode alloc] init];
    _topImageNode.URL = [NSURL
        URLWithString:@"https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png"];
    [self addSubnode:_topImageNode];
    _topTextNode = [[ASTextNode alloc] init];
    _topTextNode.attributedString = [[NSAttributedString alloc] initWithString:@"Top Text"];
    [self addSubnode:_topTextNode];

    _bottomImageNode = [[ASNetworkImageNode alloc] init];
    _bottomImageNode.URL = [NSURL
        URLWithString:@"https://assets-cdn.github.com/images/modules/logos_page/GitHub-Mark.png"];
    [self addSubnode:_bottomImageNode];
    _bottomTextNode = [[ASTextNode alloc] init];
    _bottomTextNode.attributedString = [[NSAttributedString alloc] initWithString:@"Bottom Text"];
    [self addSubnode:_bottomTextNode];
  }

  return self;
}

- (void)didLoad {
  [super didLoad];

  self.layer.borderWidth = 1.0;
  self.layer.borderColor = [UIColor blackColor].CGColor;
  self.backgroundColor = [UIColor orangeColor];
  self.topTextNode.backgroundColor = [UIColor yellowColor];
  self.bottomTextNode.backgroundColor = [UIColor redColor];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
  // Top "Row"
  self.topImageNode.preferredFrameSize = CGSizeMake(50, 50);
  self.topTextNode.flexGrow = YES;
  self.topImageNode.spacingAfter = 20.0;

  ASStackLayoutSpec *topStackLayoutSpec =
      [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                              spacing:0
                                       justifyContent:ASStackLayoutJustifyContentStart
                                           alignItems:ASStackLayoutAlignItemsCenter
                                             children:@[self.topImageNode, self.topTextNode]];

  // Bottom "Row" (Same Layout as Top Row)
  self.bottomImageNode.preferredFrameSize = CGSizeMake(50, 50);
  self.bottomTextNode.flexGrow = YES;
  self.bottomImageNode.spacingAfter = 20.0;

  ASStackLayoutSpec *bottomStackLayoutSpec =
      [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                              spacing:0
                                       justifyContent:ASStackLayoutJustifyContentStart
                                           alignItems:ASStackLayoutAlignItemsCenter
                                             children:@[self.bottomImageNode, self.bottomTextNode]];

  // Combine the two horizontal stack layout into one vertical
  ASStackLayoutSpec *tableStackLayoutSpec =
      [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                              spacing:0
                                       justifyContent:ASStackLayoutJustifyContentStart
                                           alignItems:ASStackLayoutAlignItemsStart
                                             children:@[topStackLayoutSpec, bottomStackLayoutSpec]];

  return tableStackLayoutSpec;
}

@end
