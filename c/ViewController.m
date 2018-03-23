//
//  ViewController.m
//  c
//
//  Created by 李长来 on 2017/3/17.
//  Copyright © 2017年 sankai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//二分法查找某数
- (NSInteger)searchValueWithArray:(NSArray *)array value:(NSNumber *)value{
    NSArray *values = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *tNumber1 = (NSNumber *)obj1;
        NSNumber *tNumber2 = (NSNumber *)obj2;
        if ([tNumber1 integerValue] > [tNumber2 integerValue]) {
            return NSOrderedDescending;
        }
        if ([tNumber1 integerValue] < [tNumber2 integerValue]) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    NSLog(@"%@",values);
    NSInteger low = 0,high = [values count],mid;
    while (low <= high) {
        mid = (low + high)/2;
        NSLog(@"%ld",mid);
        if ([values[mid] integerValue] == [value integerValue]) {
            return mid;
        }
        if ([values[mid] integerValue] > [value integerValue]) {
            high = mid - 1;
        }else{
            low = mid + 1;
        }
    }
    return -1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSInteger index = [self searchValueWithArray:@[@(4),@(2),@(7),@(5),@(8),@(9),@(13),@(15),@(16)] value:@(7)];
    NSLog(@"index:%ld",index);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
