//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTSevenViewController.h"

#import "ZFChart.h"
@interface PPTSevenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate,ZFPieChartDataSource, ZFPieChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
@property (nonatomic, strong) ZFPieChart * pieChart;
@property (weak, nonatomic) IBOutlet UILabel *shuomingLb;
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
@property (nonatomic, assign)NSInteger n;


@property (nonatomic, assign)NSInteger a1;
@property (nonatomic, assign)NSInteger a2;
@property (nonatomic, assign)NSInteger a3;
@property (nonatomic, assign)NSInteger a4;

@property (nonatomic, assign)NSInteger b1;
@property (nonatomic, assign)NSInteger b2;

@end

@implementation PPTSevenViewController

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
    _h=0;
    _i=0;
    _j=0;
    _k=0;
    _l=0;
    _m=0;
    _n=0;
    _a1=0;
    _a2=0;
    _a3=0;
    _a4=0;
    _b1=0;
    _b2=0;
   
    
    
     _typeArr=[[NSMutableArray alloc] init];
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"33"] objectForKey:@"choose"]containsObject:@"1ml"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"33"] objectForKey:@"choose"]containsObject:@"1.5ml"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"33"] objectForKey:@"choose"]containsObject:@"2ml"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"33"] objectForKey:@"choose"]containsObject:@"2.5ml"] ) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"33"] objectForKey:@"choose"]containsObject:@"3ml"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"34"] objectForKey:@"choose"]containsObject:@"1ml"] ) {
                ++_f;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"34"] objectForKey:@"choose"]containsObject:@"2ml"] ) {
                ++_g;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"34"] objectForKey:@"choose"]containsObject:@"3ml"] ) {
                ++_h;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"34"] objectForKey:@"choose"]containsObject:@"5ml"] ) {
                ++_i;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"34"] objectForKey:@"choose"]containsObject:@"10ml"] ) {
                ++_j;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"31"] objectForKey:@"choose"]containsObject:@"动脉采血器"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"31"] objectForKey:@"choose"]containsObject:@"Arterial blood collector"] ) {
                ++_k;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"31"] objectForKey:@"choose"]containsObject:@"注射器"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"31"] objectForKey:@"choose"]containsObject:@"Syringe "] ) {
                ++_l;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"35"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"35"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_m;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"35"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"35"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_n;
            }
            
            
           
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"预设式普通型-带针"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"Pre-set ordinary syringe-with needle "] ) {
                ++_a1;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"预设式普通型-不带针"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"Pre-set ordinary syringe-without needle"] ) {
                ++_a2;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"抽吸式普通型-不带针"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"Suction-type ordinary syringe-without needle"] ) {
                ++_a3;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"预设式-安全型"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"Pre-set safety syringe"] ) {
                ++_a4;
            }

//            _oneArray=[[NSMutableArray alloc] initWithObjects:@"Yes, the pintle was pushed",@"Yes, the pintle was pushed",@"No, the pintle was not pushed",@"No, the pintle was neither pushed",@"No, no gloves, nor hand disinfection",nil];
//            _oneArray=[[NSMutableArray alloc] initWithObjects:@"有推到底，再拉到正确位置",@"有推到底，未拉到正确位置",@"未推到底，有拉到正确位置",@"未推到底，未拉到正确位置",nil];
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"37"] objectForKey:@"choose"]) {
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"37"] objectForKey:@"choose"]containsObject:@"有推到底，再拉到正确位置"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"37"] objectForKey:@"choose"]containsObject:@"Yes, the pintle was pushed to the bottom and then drawn back to the correct position"] ) {
                    ++_b1;
                }
                else{
                
                    ++_b2;
                    
                }

              
                
                
            }

            
            
        }
        
        
        
    }
   
    
    if (_a1!=0) {
        [_typeArr addObject:@"预设式普通型-带针"];
    }
    if (_a2!=0) {
        [_typeArr addObject:@"预设式普通型-不带针"];
    }
    if (_a3!=0) {
        [_typeArr addObject:@"抽吸式普通型-不带针"];
    }
    if (_a4!=0) {
        [_typeArr addObject:@"预设式-安全型"];
    }

    
   // _shuomingLb.text=@"注射器：一次性新配置的抗凝剂。\n动脉采血器的种类：预设、普通。\n对于BD ABG操作规范性";
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(108, 496, 300, 126)];
     _barChart.topicLabel.text = @"ABG";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(395, 496, 300, 126)];
  _barChart2.topicLabel.text = @"注射器";
    
    _barChart2.dataSource = self;
    _barChart2.delegate = self;
   // _barChart2.unit = @"人";
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
    
    
    
    self.pieChart = [[ZFPieChart alloc] initWithFrame:CGRectMake(360,210, 27, 270)];
    self.pieChart.dataSource = self;
    self.pieChart.delegate = self;
    //    self.pieChart.piePatternType = kPieChartPatternTypeForCircle;
        self.pieChart.percentType = kPercentTypeInteger;
    //    self.pieChart.isShadow = NO;
    //    self.pieChart.isAnimated = NO;
    [self.pieChart strokePath];
    _pieChart.tag=103;
    [self.view addSubview:self.pieChart];
    
    NSString*n=@"N=";
    _nLabel.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    long a1=0;
    long a2=0;
    long a3=0;
    long a4=0;
    
    a1=_a+_b+_c+_d+_e;
    a2=_f+_g+_h+_i+_j;
    a3=_m+_n;
    a4=_b1+_b2;
    
    if (a1==0) {
        _a=0;
        _b=0;
        _c=0;
        _d=0;
        _e=0;
        
    }
    else{
    
        
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
        _c=_c*1.0/a1*100;
        _d=_d*1.0/a1*100;
        _e=_e*1.0/a1*100;
     
    
    }
    
    if (a2==0) {
        _f=0;
        _g=0;
        _h=0;
        _i=0;
        _j=0;
    }
    else{
        _f=_f*1.0/a2*100;
        _g=_g*1.0/a2*100;
        _h=_h*1.0/a2*100;
        _i=_i*1.0/a2*100;
        _j=_j*1.0/a2*100;
    
    }
    
    if (a3==0) {
        _m=0;
        _n=0;
    }
    else{
        _m=_m*1.0/a3*100;
        _n=_n*1.0/a3*100;
    
    }
    
    if (a4==0) {
        _b1=0;
        _b2=0;
    }
    else{
        _b1=_b1*1.0/a4*100;
        _b2=_b2*1.0/a4*100;
        
    }

    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_g] stringByAppendingString:@"%"];
    NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_h] stringByAppendingString:@"%"];
    NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_i] stringByAppendingString:@"%"];
     NSString*id10=[[NSString stringWithFormat:@"%ld",(long)_j] stringByAppendingString:@"%"];
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_m] stringByAppendingString:@"%"];
     NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_b1] stringByAppendingString:@"%"];
    
    
     NSString *string = [_typeArr  componentsJoinedByString:@","];
    
    _shuomingLb.text=[[[[[[@"注射器:" stringByAppendingString:id11]stringByAppendingString:@"一次性新配置的抗凝剂。\n动脉采血器的种类："] stringByAppendingString:string]stringByAppendingString:@"\n"] stringByAppendingString:id12] stringByAppendingString:@"对于BD ABG操作规范"];
    
    
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;

    
    
    
    
    if (chart.tag==101) {
        return @[id1,id2,id3,id4,id5];
        
        
    }
    else {
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id6,id7,id8,id9,id10];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        //return @[@"佩戴新手套", @"佩戴旧手套，/n有手消",@"佩戴旧手套，/n没有手消"];
        return @[@"1ml", @"1.5ml",@"2ml",@"2.5ml",@"3ml"];;
    }
    else{
        
        return @[@"1ml", @"2ml",@"3ml",@"5ml",@"10ml"];
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
#pragma mark - ZFPieChartDataSource

- (NSArray *)valueArrayInPieChart:(ZFPieChart *)chart{
    
    NSString*id11=[NSString stringWithFormat:@"%ld",(long)_l];
    NSString*id12=[NSString stringWithFormat:@"%ld",(long)_k];
    
   
    
    
    return @[id11,id12];
}

- (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart{
    return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1)];
}

#pragma mark - ZFPieChartDelegate

- (void)pieChart:(ZFPieChart *)pieChart didSelectPathAtIndex:(NSInteger)index{
    NSLog(@"第%ld个",(long)index);
}

- (CGFloat)radiusForPieChart:(ZFPieChart *)pieChart{
    return 120.f;
}

/** 此方法只对圆环类型(kPieChartPatternTypeForCirque)有效 */
- (CGFloat)radiusAverageNumberOfSegments:(ZFPieChart *)pieChart{
    return 2.f;
}

@end
