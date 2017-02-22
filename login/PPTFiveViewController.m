//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTFiveViewController.h"

#import "ZFChart.h"
@interface PPTFiveViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate,ZFPieChartDataSource, ZFPieChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
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


@property (nonatomic, strong) ZFPieChart * pieChart;
@end

@implementation PPTFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    _a=0;
    _b=0;
    _c=0;
    _d=0;
    _e=0;
    _k=0;
    
    int z=0;
    
  
    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        ++z;
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"是，佩戴新手套"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"Yes, new gloves"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"是，佩戴旧手套，有手消"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"Yes,but old gloves,with the hands disinfected"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"是，佩戴旧手套，没有手消"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"Yes,but old gloves,without hands disinfected"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"否，不带手套，有手消"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"No,no gloves,but with hand disinfection"] ) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"否，不带手套，没有手消"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"23"] objectForKey:@"choose"]containsObject:@"No,no gloves,nor hand disinfection"] ) {
                ++_e;
            }
            
            
            
            
            
        }
        
        
        
    }
    NSLog(@"%ld",(long)_e);
    
    _f=_a+_b+_c;
    _g=_d+_e;
  
    
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_f]];
    
    
    _n2.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_g]];
    
    
    if ((_f+_g)==0) {
        
        _h=0;
        _i=0;
    }
    else{
        _h=_f*1.0/(_f+_g)*100;
        _i=_g*1.0/(_f+_g)*100;
    }
    
    if (_f==0) {
        _j=0;
    }
    else{
       _j=_a*1.0/_f*100;
    
    }
    if (_g==0) {
        _k=0;
    }
    else{
         _k=_d*1.0/_g*100;
        
    }
    
    
    
     NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_h] stringByAppendingString:@"%"];
     NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_i] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_j] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_k] stringByAppendingString:@"%"];
   
    NSString*str=[[[[[[[id1 stringByAppendingString:@"有佩戴手套，其中"] stringByAppendingString:id3] stringByAppendingString:@"为佩戴新手套。"] stringByAppendingString:id2] stringByAppendingString:@"没有佩戴手套的人员中，"] stringByAppendingString:id4] stringByAppendingString:@"有手消。"];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
//    int a1=(_a+_b+_c)/z;
//    int a2=_a/z;
//     int a3=(_d+_e)/z;
//    if (a3!=0) {
//        int a4=_d/a3;
//       _str4 = [NSString stringWithFormat:@"%2d%%",a4*100];
//    }
//    else{
//        int a4=0;
//        _str4=@"%0";
//    
//    }
    
    
//    NSString *str = [NSString stringWithFormat:@"%2d%%",a1*100];
//     NSString *str2 = [NSString stringWithFormat:@"%2d%%",a2*100];
//     NSString *str3 = [NSString stringWithFormat:@"%2d%%",a3*100];
//    
//    
//    NSLog(@"%@ %@ %@ ",str,str2,str3);
    
    
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(155, 220, 380, 200)];
    _barChart.topicLabel.text = @"佩戴手套";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(165, 420, 300, 200)];
     _barChart2.topicLabel.text = @"未佩戴手套";
    
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
    
    
   
    
    self.pieChart = [[ZFPieChart alloc] initWithFrame:CGRectMake(580,520, 27, 30)];
    self.pieChart.dataSource = self;
    self.pieChart.delegate = self;
    //    self.pieChart.piePatternType = kPieChartPatternTypeForCircle;
        self.pieChart.percentType = kPercentTypeInteger;
    //    self.pieChart.isShadow = NO;
    //    self.pieChart.isAnimated = NO;
    [self.pieChart strokePath];
    _pieChart.tag=103;
    [self.view addSubview:self.pieChart];
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    long a1=0;
    long a2=0;
    a1=_a+_b+_c;
    a2=_d+_e;
    
    
    if (a1==0) {
        _a=0;
        _b=0;
        _c=0;
    }
    else{
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
        _c=_c*1.0/a1*100;
    
    
    }
    if (a2==0) {
        _e=0;
        _d=0;
    }else{
    
        _e=_e*1.0/a2*100;
        _d=_d*1.0/a2*100;
    }
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    
    if (chart.tag==101) {
        
        

        return @[id1,id2,id3];
        
      
    }
    else {
        
  
        
        return @[id4,id5];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"佩戴新手套", @"佩戴旧手套，有手消",@"佩戴旧手套没有手消"];
        //return nil;
    }
    else{
        
        return @[@"不戴手套，有手消", @"不戴手套，没手消"];
    }
    }

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}
 - (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{

    return 60;
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


#pragma mark - ZFPieChartDataSource

- (NSArray *)valueArrayInPieChart:(ZFPieChart *)chart{
    
    
    NSString*id1=[NSString stringWithFormat:@"%ld",(long)_h] ;
    NSString*id2=[NSString stringWithFormat:@"%ld",(long)_i] ;
    
    
    
    return @[id1,id2];
}

- (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart{
    return @[ZFColor(71, 204, 255, 1), ZFColor(253, 203, 76, 1)];
}

#pragma mark - ZFPieChartDelegate

- (void)pieChart:(ZFPieChart *)pieChart didSelectPathAtIndex:(NSInteger)index{
    NSLog(@"第%ld个",(long)index);
}

- (CGFloat)radiusForPieChart:(ZFPieChart *)pieChart{
    return 90.f;
}

/** 此方法只对圆环类型(kPieChartPatternTypeForCirque)有效 */
- (CGFloat)radiusAverageNumberOfSegments:(ZFPieChart *)pieChart{
    return 2.f;
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
