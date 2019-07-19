//
//  pageViewController.m
//  Photo Editor
//
//  Created by Randi on 7/7/2019.
//  Copyright © 2019 Randi. All rights reserved.
//

#import "pageViewController.h"
#import "welcomePage.h"

@interface pageViewController (){
    NSArray *arrimg;
}

@end

@implementation pageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrimg = [[NSArray alloc]initWithObjects:@"welcome1.jpg",@"welcome2.jpg",@"welcome3.jpg", nil];
    self.dataSource = self;
    welcomePage * vc = (welcomePage *)[self viewcontrollerAtIndex:0];
    NSArray *arr = [NSArray arrayWithObject:vc];
    [self setViewControllers:arr direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)viewcontrollerAtIndex :(NSUInteger)index {
    welcomePage *view1 = [self.storyboard instantiateViewControllerWithIdentifier:@"view"];
    view1.strimg = arrimg[index];   //image count
    view1.valueindex = index;       //index value throught count
    return view1;
}

-(UIViewController *)pageViewController:(UIPageViewController *)
pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSUInteger index = ((welcomePage *)viewController).valueindex;
    if (index == 0 || index ==NSNotFound){
        return nil;
    }
    index --;
    return [self viewcontrollerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)
pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSUInteger index = ((welcomePage *)viewController).valueindex;
    if (index == NSNotFound){
        return nil;
    }
    index++;
    if (index == arrimg.count){
        return nil;
    }
    return [self viewcontrollerAtIndex:index];
}


@end
