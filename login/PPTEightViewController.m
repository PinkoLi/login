//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTEightViewController.h"

#import "ZFChart.h"
@interface PPTEightViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate,ZFGenericChartDataSource, ZFHorizontalBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart3;
@property (nonatomic, strong) ZFHorizontalBarChart * barChart2;
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

@end

@implementation PPTEightViewController

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
    _m=0;
    _n=0;
    
    
   
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"动脉穿刺采血"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"静脉穿刺采血"] ) {
                ++_a;

                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"桡动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Radial artery"] ) {
                    ++_h;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"肱动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Brachial artery"]) {
                    ++_i;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"股动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Femoral artery"]) {
                    ++_j;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"足背动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Arteria dorsalis pedis"]) {
                    ++_k;
                }
                if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"其他"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"头皮动脉"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"股静脉"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"PICC"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"静脉留置针"]  ) {
                    ++_l;
                }
                
            }
            
            
         

            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"动脉导管采血"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"静脉导管采血"] ) {
                ++_b;
                
                
                NSLog(@"%@",[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]);
                
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"桡动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Radial artery"] ) {
                    ++_c;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"肱动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Brachial artery"]) {
                    ++_d;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"股动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Femoral artery"]) {
                    ++_e;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"足背动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-1] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Arteria dorsalis pedis"]) {
                    ++_f;
                }
                if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"其他"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"头皮动脉"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"股静脉"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"PICC"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"静脉留置针"]  ) {
                    ++_g;
                }

                
            }
            
            
            
            
            
        }
        
        
        
    }
    
    
    long a1=0;
    long a2=0;
    a1=_a;
    a2=_b;
    
    long a4=0;
    long a5=0;
    long a6=0;
    
    //
    //    _j=0;
    //    _k=0;
    //    _l=0;
    
    a4=_a+_b;
    a5=_c+_h;
    
    if (a4==0||a5==0) {
        
        
        a6=0;
    }else{
        a6=a5*1.0/a4*100;
    }
    NSString*id10=[[NSString stringWithFormat:@"%ld",(long)a6] stringByAppendingString:@"%"];
    
    
    NSString*str=[[@"桡动脉采血是CLSI和AARC推荐的首选动脉采血部位,有" stringByAppendingString:id10] stringByAppendingString:@"的操作者选择了在桡动脉采血"];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;


    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(382, 220, 320, 220)];
    _barChart.topicLabel.text = [[@"导管采血" stringByAppendingString:@"N="]stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)a2]];
    
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
    
    
    
    _barChart2 = [[ZFHorizontalBarChart alloc] initWithFrame:CGRectMake(120,300, 200, 200)];
    _barChart2.dataSource = self;
    _barChart2.delegate = self;
//   _barChart2.topicLabel.text = @"导管采血";
   // _barChart2.unit = @"人";
    _barChart2.topicLabel.textColor = ZFPurple;
    //    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    //    self.barChart.isResetAxisLineMinValue = YES;
    //    self.barChart.isShowSeparate = YES;
    //    self.barChart.backgroundColor = ZFPurple;
    //    self.barChart.unitColor = ZFWhite;
    //    self.barChart.axisColor = ZFWhite;
    //    self.barChart.axisLineNameColor = ZFWhite;
    //    self.barChart.axisLineValueColor = ZFWhite;
    //    self.barChart.isShowAxisLineValue = NO;
    //    self.barChart.isAnimated = NO;
    _barChart2.tag=102;
    [self.view addSubview:_barChart2];
    [_barChart2 strokePath];
    
    
    
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(382, 440, 320, 160)];
    // barChart.topicLabel.text = @"xx小学各年级人数";
    _barChart3.topicLabel.text = [[@"穿刺采血" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)a1]];
    _barChart3.dataSource = self;
    _barChart3.delegate = self;
    
    //_barChart3.unit = @"人";
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
    _nLb.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
}




#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    long a1=0;
    long a2=0;
    long a3=0;
    
    a1=_a+_b;
    a2=_c+_d+_e+_f+_g;
    a3=_h+_i+_j+_k+_l;
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
        _e=0;
        _f=0;
        _g=0;
    }
    else{
        _c=_c*1.0/a2*100;
        _d=_d*1.0/a2*100;
        _e=_e*1.0/a2*100;
        _f=_f*1.0/a2*100;
        _g=_g*1.0/a2*100;
        
    }

    if (a3==0) {
        _h=0;
        _i=0;
        _j=0;
        _k=0;
        _l=0;
    }
    else{
        _h=_h*1.0/a3*100;
        _i=_i*1.0/a3*100;
        _j=_j*1.0/a3*100;
        _k=_k*1.0/a3*100;
        _l=_l*1.0/a3*100;
        
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
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_j] stringByAppendingString:@"%"];
    NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_k] stringByAppendingString:@"%"];
    NSString*id13=[[NSString stringWithFormat:@"%ld",(long)_l] stringByAppendingString:@"%"];

    
    
   // 桡动脉采血 是CLSI和AARC 推荐的首选动脉 采血部位, 有%的操作者选 择了在桡动脉采 血
    
   
    if (chart.tag==101) {
        return @[id3,id4,id5,id6,id7];
        
        
    }else if (chart.tag==103){
    
        return @[id8,id9,id11,id12,id13];
    }
    else {
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id2,id1];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"桡动脉", @"肱动脉",@"股动脉",@"足背动脉",@"其他"];
      
    }else if (chart.tag==103){
    
         return @[@"桡动脉", @"肱动脉",@"股动脉",@"足背动脉",@"其他"];    }
    else{
        
        return @[@"导管采血", @"穿刺采血"];
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
#pragma mark - ZFGenericChartDataSource


- (void)horizontalBarChart:(ZFHorizontalBarChart *)barChart didSelectBarAtGroupIndex:(NSInteger)groupIndex barIndex:(NSInteger)barIndex horizontalBar:(ZFHorizontalBar *)horizontalBar popoverLabel:(ZFPopoverLabel *)popoverLabel{
    //特殊说明，因传入数据是3个subArray(代表3个类型)，每个subArray存的是6个元素(代表每个类型存了1~6年级的数据),所以这里的groupIndex是第几个subArray(类型)
    //eg：三年级第0个元素为 groupIndex为0，barIndex为2
    NSLog(@"第%ld个颜色中的第%ld个",(long)groupIndex,(long)barIndex);
    
    //可在此处进行bar被点击后的自身部分属性设置
    //    horizontalBar.barColor = ZFYellow;
    //    horizontalBar.isAnimated = YES;
    //    horizontalBar.opacity = 0.5;
    //    [horizontalBar strokePath];
    
    //可将isShowAxisLineValue设置为NO，然后执行下句代码进行点击才显示数值
    //    popoverLabel.hidden = NO;
}

- (void)horizontalBarChart:(ZFHorizontalBarChart *)barChart didSelectPopoverLabelAtGroupIndex:(NSInteger)groupIndex labelIndex:(NSInteger)labelIndex popoverLabel:(ZFPopoverLabel *)popoverLabel{
    //理由同上
    NSLog(@"第%ld组========第%ld个",(long)groupIndex,(long)labelIndex);
    
    //可在此处进行popoverLabel被点击后的自身部分属性设置
    //    popoverLabel.textColor = ZFSkyBlue;
    //    [popoverLabel strokePath];
}
- (CGFloat)barHeightInHorizontalBarChart:(ZFHorizontalBarChart *)barChart{

    return 40;
}
@end
