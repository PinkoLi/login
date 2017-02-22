//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTFourViewController.h"

#import "ZFChart.h"
@interface PPTFourViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
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

@property (nonatomic, assign)NSInteger k;


@property (nonatomic, assign)NSInteger l;

@property (nonatomic, assign)NSInteger m;

@end

@implementation PPTFourViewController

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
    _l=0;
    _m=0;
     
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"20"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"20"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"20"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"20"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_d;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"未评估桡动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"21"] objectForKey:@"choose"]containsObject:@"The blood collection site is not on the radial artery"] ) {
                ++_l;
            }
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_f;
            }
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"未评估股动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"22"] objectForKey:@"choose"]containsObject:@"Evaluation of the femoral artery was not done"] ) {
                ++_m;
            }
            
        }
        
        
        
    }
    
    NSLog(@"%ld,%ld",(long)_c,_d);

    _k=_c+_d+_l;
    
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
    _n3.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    _n2.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_k]];
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(444, 210, 262, 126)];
    // barChart.topicLabel.text = @"xx小学各年级人数";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(444, 350, 262, 126)];
    // barChart.topicLabel.text = @"xx小学各年级人数";
    
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
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(444, 490, 262, 126)];
    // barChart.topicLabel.text = @"xx小学各年级人数";
    
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
    
    
   
    
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    _g=0;
    _h=0;
    _i=0;
    
    _g=_a+_b;
    _h=_c+_d+_l;
    _i=_e+_f+_m;
    
    if (_g==0) {
        _a=0;
        _b=0;
    }
    else{
        
        _a=_a*1.0/_g*100;
        _b=_b*1.0/_g*100;
    }
    
    if (_h==0) {
        _c=0;
        _d=0;
        _l=0;
    }
    else{
        
        _c=_c*1.0/_h*100;
        _d=_d*1.0/_h*100;
        _l=_l*1.0/_h*100;
    }
    
    if (_i==0) {
        _e=0;
        _f=0;
        _m=0;
    }
    else{
        
        _e=_e*1.0/_i*100;
        _f=_f*1.0/_i*100;
        _m=_m*1.0/_i*100;

    }
    
    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
     NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_l] stringByAppendingString:@"%"];
     NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_m] stringByAppendingString:@"%"];
    
//    %的操作者对患者 的采血部位及血 管情况进行了评 估。 仅%的操作者选择 桡动脉采血前进 行了Allen实验。 选择股动脉采血 的操作中,有%做 好了患者隐私的 保护。
    
    NSString*str=[[[[[id1 stringByAppendingString:@"的操作者对患者的采血部位及血管情况进行了评估。仅"]stringByAppendingString:id3] stringByAppendingString:@"的操作者选择桡动脉采血前进行了Allen实验。 选择股动脉采血的操作中,有"] stringByAppendingString:id5] stringByAppendingString:@"做好了患者隐私的保护。"];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    if (chart.tag==101) {
        return @[id1, id2];
    }
    else if (chart.tag==102){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id3, id4,id7];
    }
    else{
        
        return @[id5, id6,id8];
    }
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"是", @"否"];
    }
    else if (chart.tag==102){
        
        return @[@"是", @"否",@"未评估"];
    }
    else{
        
        return @[@"是", @"否",@"未评估"];
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
