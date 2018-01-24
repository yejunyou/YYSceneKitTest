//
//  ViewController01.m
//  YYSceneKitTest
//
//  Created by yejunyou on 2018/1/24.
//  Copyright © 2018年 yejunyou. All rights reserved.
//

#import "ViewController01.h"
#import <SceneKit/SceneKit.h>

@interface ViewController01 ()

@property (weak, nonatomic) IBOutlet SCNView *myView;
@end

@implementation ViewController01

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"yizi" withExtension:@"dae"];
    SCNScene *scene = [SCNScene sceneWithURL:url options:nil error:nil];
    
    self.myView.scene = scene;
    self.myView.backgroundColor = [UIColor redColor];
    self.myView.allowsCameraControl = YES;
}

@end
