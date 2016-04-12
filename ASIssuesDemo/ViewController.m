//
//  ViewController.m
//  ASIssuesDemo
//
//  Created by jmig on 4/12/16.
//  Copyright © 2016 Jmig. All rights reserved.
//

#import "JMSpacingIssueDemoNode.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  JMSpacingIssueDemoNode *node = [[JMSpacingIssueDemoNode alloc] init];
  [node measure:CGSizeMake(CGRectGetWidth(self.view.bounds), INFINITY)];
  node.frame = CGRectMake(0, 0, node.calculatedSize.width, node.calculatedSize.height);
  CGPoint center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
  node.view.center = center;
  [self.view addSubnode:node];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
