//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTTwentyViewController.h"

#import "ZFChart.h"
@interface PPTTwentyViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger g;
@property (nonatomic, assign)NSInteger h;
@end

@implementation PPTTwentyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    _a=0;
    _b=0;
    _c=0;
    _d=0;

    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"54"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"54"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"54"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"54"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"55"] objectForKey:@"choose"]containsObject:@"是"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"55"] objectForKey:@"choose"]containsObject:@"YES"]) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"55"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"55"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_d;
            }
          
            
            
            
            
            
        }
        
        
        
    }
    
    _g=_a+_b;
    _h=_c+_d;
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_g]];
    _n2.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_h]];

    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 208, 500, 200)];
    _barChart.topicLabel.text = @"如安全型动脉采血器，采血后是否立即激活安全锁扣";
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    
   // _barChart.unit = @"人";
    //    barChart.xLineValueArray = [NSMutableArray arrayWithObjects:@"50", @"30", nil];
    //    barChart.xLineTitleArray = [NSMutableArray arrayWithObjects:@"医生", @"护士", nil];
    // barChart.yLineMaxValue = 500;
    _barChart.isAnimated = NO;
    //    self.barChart.isResetAxisLineMinValue = YES;
    _barChart.isResetAxisLineMaxValue = NO;
    //    self.barChart.isShowAxisLineValue = NO;
    //    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    _barChart.isShowSeparate = YES;
    _barChart.tag=101;
    //barChart.yLineSectionCount = 10;
    [self.view addSubview:_barChart];
    
    [_barChart strokePath];
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 420, 500, 200)];
    _barChart2.topicLabel.text = @"如安全型动脉采血器，采血后是否正确地激活安全锁扣";
    
    _barChart2.dataSource = self;
    _barChart2.delegate = self;
    //_barChart2.unit = @"人";
    // barChart2.unit = @"人";
    //    barChart.xLineValueArray = [NSMutableArray arrayWithObjects:@"50", @"30", nil];
    //    barChart.xLineTitleArray = [NSMutableArray arrayWithObjects:@"医生", @"护士", nil];
    // barChart.yLineMaxValue = 500;
    _barChart2.isAnimated = NO;
    //    self.barChart.isResetAxisLineMinValue = YES;
    _barChart2.isResetAxisLineMaxValue = NO;
    //    self.barChart.isShowAxisLineValue = NO;
    //    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    _barChart2.isShowSeparate = YES;
    
    
    
    _barChart2.tag=102;
    //barChart.yLineSectionCount = 10;
    [self.view addSubview:_barChart2];
    [_barChart2 strokePath];
    
    
    
    
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    
   
    
    
    NSLog(@"%ld",(long)chart.tag);
    long a1=0;
    long a2=0;
    a1=_a+_b;
    a2=_c+_d;
    
    
    if (a1==0) {
        _a=0;
        _b=0;
    }
    else{
        
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
    }
    
    if (a2==0) {
        _c=0;
        _d=0;
    }
    else{
        
        _c=_c*1.0/a2*100;
        _d=_d*1.0/a2*100;
    }
    
    
    
//    if (a1==0) {
//        a=0;
//         NSString*id5=[[NSString stringWithFormat:@"%ld",(long)a] stringByAppendingString:@"%"];
//        _shuomingLb.text=[[@"采血后立即激活安全锁扣的护理人员中，有" stringByAppendingString:id5] stringByAppendingString:@"激活方式正确"];
//        _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
//        _shuomingLb.numberOfLines = 0;
//    }
//    else{
//        a=a*1.0/a1*100;
//        NSString*id5=[[NSString stringWithFormat:@"%ld",(long)a] stringByAppendingString:@"%"];
//        _shuomingLb.text=[[@"采血后立即激活安全锁扣的护理人员中，有" stringByAppendingString:id5] stringByAppendingString:@"激活方式正确"];
//        _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
//        _shuomingLb.numberOfLines = 0;
//    }
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    
   
     //在使用安全型动 脉采血器的科室 中,安全锁扣激 活的及时率 为%,正确率 为%。
    _shuomingLb.text=[[[@"在使用安全型动脉采血器的科室中,安全锁扣激活的及时率为" stringByAppendingString:id1] stringByAppendingString:@",正确率为"]stringByAppendingString:id3];
            _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
            _shuomingLb.numberOfLines = 0;
    
    if (chart.tag==101) {
        return @[id1,id2];
        
        
    }
    else {
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id3,id4];
    }
    
    
}

- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
    
    return 70;
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"是",@"否"];
        
    }
    else{
        
        return @[@"是",@"否"];
    }
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}

- (NSUInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return -1;
}
- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 0;
}
- (void)barChart:(ZFBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex bar:(ZFBar *)bar popoverLabel:(ZFPopoverLabel *)popoverLabel{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)barIndex);
    
    //可在此处进行bar被点击后的自身部分属性设置,可修改的属性查看ZFBar.h
    bar.barColor = ZFGold;
    bar.isAnimated = YES;
    //    bar.opacity = 0.5;
    [bar strokePath];
    
    //可将isShowAxisLineValue设置为NO，然后执行下句代码进行点击才显示数值
    //    popoverLabel.hidden = NO;
}

- (void)barChart:(ZFBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex popoverLabel:(ZFPopoverLabel *)popoverLabel{
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
    
    //可在此处进行popoverLabel被点击后的自身部分属性设置
    //    popoverLabel.textColor = ZFSkyBlue;
    //    [popoverLabel strokePath];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
