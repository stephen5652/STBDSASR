//
//  BDMainViewController.m
//  BDSASR_Example
//
//  Created by stephenchen on 2023/12/11.
//

#import "BDMainViewController.h"
#import <BDSASR/BDSEventManager.h>

@interface BDMainViewController ()

@end

@implementation BDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[BDSEventManager createEventManagerWithName:@""] setParameter:@[@""] forKey:@""];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
