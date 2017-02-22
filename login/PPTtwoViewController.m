//
//  PPTtwoViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTtwoViewController.h"
#import "ZFChart.h"
@interface PPTtwoViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
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
@property (nonatomic, assign)NSInteger n;
@property (nonatomic, assign)NSInteger o;
@end

@implementation PPTtwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _a=0;
    _b=0;
    _c=0;
    _d=0;
    _e=0;
    _f=0;
    _i=0;
    _j=0;
    _k=0;
     NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    _cishu.text=[[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]] stringByAppendingString:@"份"];
    
    NSLog(@"%@",[thisArr objectForKey:@"thisArr"]);
    
    NSString*str=[[NSString alloc] init];
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
     

        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {

            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"]containsObject:@"医生"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"]containsObject:@"Physician"] ) {
                            ++_a;
                }
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"]containsObject:@"护士"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"]containsObject:@"Nurse"] ) {
                ++_b;
            }
            
            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"] lastObject]containsString:@"其他（如技术人员)"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"11"] objectForKey:@"choose"] lastObject]containsString:@"Other (e.g., technician)"]) {
                ++_k;
            }
            
//            str=[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"10"] objectForKey:@"choose"];
//            if ([str containsString:@"其他（如技术人员)"]||[str containsString:@"Other(e.g., technician)"]) {
//                ++_k;
//
//            }
            
            

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"13"] objectForKey:@"choose"]containsObject:@"是"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"13"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"13"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"13"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"14"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"14"] objectForKey:@"choose"]containsObject:@"YES"]  ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"14"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"14"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_f;
            }



        
        }
        
        
        
    }
    NSLog(@"%ld",(long)_a);
    NSLog(@"%ld",(long)_b);
    NSLog(@"%ld",(long)_k);
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(420, 220, 262, 146)];
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(118, 456, 200, 146)];
    _barChart2.topicLabel.text = @"是否核对患者身份";
    
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
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(418, 456, 200, 146)];
     _barChart3.topicLabel.text = @"是否获取最低限度要求";
    
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
    
//   现场观察中,%的 操作者核对了患者 的身份,单通过主 动询问的方式核对 患者全名,并以至 少两种以上的方式 进行患者识别的操 作者仅占%。
    

    
  
   


    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
   
    _i=0;
    _j=0;
    _l=0;

    
    _i=_c+_d;
    _j=_e+_f;
    _l=_a+_b+_k;
    NSLog(@"%ld",(long)_i);
    
    
    if (_l==0) {
        _m=0;
        _n=0;
        _o=0;
    }
    else{
        _m=_a*1.0/_l*100;
        _n=_b*1.0/_l*100;
        _o=_k*1.0/_l*100;
    
    }
    
    if (_i==0) {
        _g=0;
        _h=0;
    }
    else{
        
        _g=_c*1.0/_i*100;
        _h=_d*1.0/_i*100;
    }
    
    if (_j==0) {
        _e=0;
        _f=0;
    }
    else{
        
        _e=_e*1.0/_j*100;
        _f=_f*1.0/_j*100;
    }
    
    NSLog(@"%ld,%ld",(long)_g,(long)_h);
    
    
    
   
    
//    NSString*yisheng=[NSString stringWithFormat:@"%ld",(long)_b];
//    NSString*hushi=[NSString stringWithFormat:@"%ld",(long)_a];
//     NSString*id1=[NSString stringWithFormat:@"%ld",(long)_c];
//     NSString*id2=[NSString stringWithFormat:@"%ld",(long)_d];
    
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    
    
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_g] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_h] stringByAppendingString:@"%"];
    
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_m] stringByAppendingString:@"%"];
    NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_n] stringByAppendingString:@"%"];
    NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_o] stringByAppendingString:@"%"];
   
    
    
    //   现场观察中,%的 操作者核对了患者 的身份,单通过主 动询问的方式核对 患者全名,并以至 少两种以上的方式 进行患者识别的操 作者仅占%。
    
    NSString*str=[[[@"现场观察中," stringByAppendingString:id5]stringByAppendingString:@"的操作者核对了患者的身份,单通过主动询问的方式核对患者全名,并以至少两种以上的方式进行患者识别的操作者仅占"] stringByAppendingString:id3];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    
    
    if (chart.tag==101) {
        return @[id7, id8,id9];
}
    else if (chart.tag==102){
    
        NSLog(@"%ld",(long)chart.tag);
        
    return @[id5,id6];
    }
      else{
   
   return @[id3,id4];
   }
    
  
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"医生", @"护士",@"其他"];
    }
    else if (chart.tag==102){
        
        return @[@"是", @"否"];
    }
    else{
        
        return @[@"是", @"否"];
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
