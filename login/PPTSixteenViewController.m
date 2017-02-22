//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTSixteenViewController.h"

#import "ZFChart.h"
@interface PPTSixteenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
@property (nonatomic, strong) ZFBarChart * barChart3;

@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger e;
@property (nonatomic, assign)NSInteger f;
@property (nonatomic, assign)NSInteger g;


@property (nonatomic, assign)NSInteger h;
@property (nonatomic, assign)NSInteger i;
@property (nonatomic, assign)NSInteger j;

@property (nonatomic, assign)NSInteger o;
@property (nonatomic, assign)NSInteger p;

@end

@implementation PPTSixteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    _a=0;
    _b=0;
    _c=0;
    _d=0;
    _e=0;
    _f=0;
    _g=0;
    _o=0;
    _p=0;
   
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"58"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"58"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"58"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"58"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"61"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"61"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"61"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"61"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_e;
            }
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"否，有混匀，但不达标"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"No, mixing was performed but did not reach the standards"] ) {
                ++_f;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"否，无混匀"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"62"] objectForKey:@"choose"]containsObject:@"No, mixing was not performed"] ) {
                ++_g;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"63"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"63"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_o;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"63"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"63"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_p;
            }
            
            
            
            
            
        }
        
        
        
    }

    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(200, 210, 400, 120)];
    _barChart.topicLabel.text = @"针头是否暴露送检";
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    
    //_barChart.unit = @"人";
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(200, 330, 400, 120)];
    _barChart2.topicLabel.text = @"封闭样本前，是否检查并排空气泡";
    
    _barChart2.dataSource = self;
    _barChart2.delegate = self;
    
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
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(200, 450, 500, 160)];
    _barChart3.topicLabel.text = @"封闭样本后，是否进行正确的混匀步骤";
    
    _barChart3.dataSource = self;
    _barChart3.delegate = self;
    
    // barChart3.unit = @"人";
    //    barChart.xLineValueArray = [NSMutableArray arrayWithObjects:@"50", @"30", nil];
    //    barChart.xLineTitleArray = [NSMutableArray arrayWithObjects:@"医生", @"护士", nil];
    // barChart.yLineMaxValue = 500;
    _barChart3.isAnimated = NO;
    //    self.barChart.isResetAxisLineMinValue = YES;
    _barChart3.isResetAxisLineMaxValue = NO;
    //    self.barChart.isShowAxisLineValue = NO;
    //    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    _barChart3.isShowSeparate = YES;
    
    _barChart3.tag=103;
    //barChart.yLineSectionCount = 10;
    [self.view addSubview:_barChart3];
    [_barChart3 strokePath];
    
    
    
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    long a1=0;
    a1=_o+_p;
    
    
    if (a1==0) {
        _o=0;
        _p=0;
    }
    else{
    
        _o=_o*1.0/a1*100;
        _p=_p*1.0/a1*100;
    }
    
    
    _j=0;
    _h=0;
    _i=0;
    
    
    _j=_a+_b;
    _h=_c+_d;
    _i=_e+_f+_g;
    
    if (_j==0) {
        _a=0;
        _b=0;
    }
    else{
        
        _a=_a*1.0/_j*100;
        _b=_b*1.0/_j*100;
    }
    
    if (_h==0) {
        _c=0;
        _d=0;
    }
    else{
        
        _c=_c*1.0/_h*100;
        _d=_d*1.0/_h*100;
    }
    
    if (_i==0) {
        _e=0;
        _f=0;
        _g=0;
    }
    else{
        
        _e=_e*1.0/_i*100;
        _f=_f*1.0/_i*100;
        _g=_g*1.0/_i*100;
    }

    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_g] stringByAppendingString:@"%"];
     NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_o] stringByAppendingString:@"%"];
    
    
      // 封闭样本前,% 才操作者会检查 并排空气泡, 仅%的样本被正 确混匀
    
    
    _shuomingLb.text=[[[[[[id8 stringByAppendingString:@"采血后将动脉血转移到其他容器/采血管。"]stringByAppendingString:@"\n封闭样本前,"] stringByAppendingString:id3]stringByAppendingString:@"的操作者会检查并排空气泡,仅"] stringByAppendingString:id5] stringByAppendingString:@"的样本被正确混匀。"];
    
    
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;


    if (chart.tag==101) {
        return @[id1,id2];
    }
    else if (chart.tag==102){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id3,id4];
    }
    else{
        
        return @[id5,id6,id7];
    }
    
    
}
- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{
    
    return 70;
}
- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"是", @"否"];
    }
    else if (chart.tag==102){
        
        return @[@"是", @"否"];
    }
    else{
        
        return @[@"是", @"否,有混匀但不达标",@"否，无混匀"];
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
