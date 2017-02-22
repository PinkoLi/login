//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTNineteenViewController.h"

#import "ZFChart.h"
@interface PPTNineteenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@end

@implementation PPTNineteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *thisArr2 = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[thisArr2 objectForKey:@"thisArr2"]);
    
    _a=0;
    _b=0;
    _c=0;

    _d=0;
    
    
    
    
    
    for (int i=0; i<[[thisArr2 objectForKey:@"thisArr2"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"69"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"69"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_a;
            }
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"69"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"69"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_b;
            }
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"70"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"70"] objectForKey:@"choose"]containsObject:@"YES"]  ) {
                ++_c;
            }
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"70"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"70"] objectForKey:@"choose"]containsObject:@"NO"]  ) {
                ++_d;
            }
            
            
            
            
            
        }
        
        
        
    }
    

    
    
    long a=_a+_b;
    long b=_c+_d;
    
    
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",a]];
    _n2.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",b]];

    
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 248, 400, 126)];
    _barChart.topicLabel.text = @"如送检时间≥30分钟，是否冰浴低温保存";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 450, 400, 126)];
    _barChart2.topicLabel.text = @"如冰浴，冰块是否直接接触样本";
    
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

    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];


   // 观察到送检时间 ≥30分钟的样本 中,有%未冰浴低 温保存,有%的样 本冰浴时直接接 触了冰块,易造 成样本的溶血。
    
    NSString*str=[[[[@"观察到送检时间≥30分钟的样本中,有" stringByAppendingString:id2] stringByAppendingString:@"未冰浴低温保存,有"]stringByAppendingString:id3]stringByAppendingString:@"的样本冰浴时直接接触了冰块,易造成样本的溶血。" ] ;
    NSLog(@"%@",str);
    _shuomingLb.text=str;
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
