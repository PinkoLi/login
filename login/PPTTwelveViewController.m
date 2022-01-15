//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTTwelveViewController.h"

#import "ZFChart.h"
@interface PPTTwelveViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;
@property (nonatomic, strong) ZFBarChart * barChart3;
@property (nonatomic, strong) ZFBarChart * barChart4;
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


@property (nonatomic, assign)NSInteger o;
@property (nonatomic, assign)NSInteger p;

@property (nonatomic, assign)NSInteger a1;
@property (nonatomic, assign)NSInteger a2;
@property (nonatomic, assign)NSInteger a3;

@end

@implementation PPTTwelveViewController

#define MAX(a,b,c) (a>b?(a>c?a:c):(b>c?b:c))


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[thisArr objectForKey:@"thisArr"]);
    NSArray*department=[NSArray arrayWithArray: [thisArr objectForKey:@"thisArr"]];

    
    
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
    
   
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
      
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"47"] objectForKey:@"choose"]containsObject:@"开放式"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"47"] objectForKey:@"choose"]containsObject:@"Open"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"47"] objectForKey:@"choose"]containsObject:@"封闭式"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"47"] objectForKey:@"choose"]containsObject:@"Closed"] ) {
                ++_b;
            }
            
            
          
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"48"] objectForKey:@"choose"]containsObject:@"≤4天"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"48"] objectForKey:@"choose"]containsObject:@"≤4days"]  ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"48"] objectForKey:@"choose"]containsObject:@">4天"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"48"] objectForKey:@"choose"]containsObject:@">4days"]  ) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"49"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"49"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"49"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"49"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_f;
            }
            
          
            
//             if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"导管采血"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"39"] objectForKey:@"choose"]containsObject:@"By catheter"] ) {
                 
               
                 
                 
                 
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"桡动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Radial artery"] ) {
                ++_g;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"肱动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Brachial artery"] ) {
                ++_h;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"股动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Femoral artery"] ) {
                ++_i;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"足背动脉"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Arteria dorsalis pedis"]) {
                ++_j;
            }
            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"其他部位"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"头皮动脉"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"股静脉"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"PICC"] ||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"静脉留置针"]  ) {
                ++_k;
            }

            
//}
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"52"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"52"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_o;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"52"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"52"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_p;
            }
            
           
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"50"] objectForKey:@"choose"]containsObject:@"<5ml"] ) {
                ++_a1;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"50"] objectForKey:@"choose"]containsObject:@"5-10ml"] ) {
                ++_a2;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"50"] objectForKey:@"choose"]containsObject:@">10ml"] ) {
                ++_a3;
            }

            
            
            
            
        }
        
        
        
    }
    
    
    NSLog(@"%ld,%ld,%ld",(long)_a1,(long)_a2,(long)_a3);

    NSLog(@"%ld",MAX(_a1, _a2, _a3));
    
    
    long aa1=0;
    long aa2=0;
    long aa3=0;
    long aa4=0;
    
    aa1=_g+_h+_i+_j+_k;
    aa2=_c+_d;
    aa3=_a+_b;
    aa4=_e+_f;
    
    
    
//    [[@"留置时间" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_a]];
    
    
    //_barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(124, 248, 262, 126)];
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(124, 482, 262, 126)];
    _barChart.topicLabel.text =  [[@"导管类型" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)aa3]];
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(419, 248, 262, 186)];
     _barChart2.topicLabel.text =  [[@"留置时间" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)aa2]];
    
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
    
    
    //_barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(124, 482, 262, 126)];
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(419, 482, 262, 126)];
    _barChart3.topicLabel.text =  [[@"是否弃去废液" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)aa4]];
    
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
    
    _barChart4 = [[ZFBarChart alloc] initWithFrame:CGRectMake(114, 248, 282, 186)];
    //_barChart4 = [[ZFBarChart alloc] initWithFrame:CGRectMake(419, 482, 262, 126)];
    _barChart4.topicLabel.text =  [[@"留置部位" stringByAppendingString:@"N="] stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)aa1]];
    
    _barChart4.dataSource = self;
    _barChart4.delegate = self;
    
    // barChart3.unit = @"人";
    //    barChart.xLineValueArray = [NSMutableArray arrayWithObjects:@"50", @"30", nil];
    //    barChart.xLineTitleArray = [NSMutableArray arrayWithObjects:@"医生", @"护士", nil];
    // barChart.yLineMaxValue = 500;
    _barChart4.isAnimated = NO;
    //    self.barChart.isResetAxisLineMinValue = YES;
    _barChart4.isResetAxisLineMaxValue = NO;
    //    self.barChart.isShowAxisLineValue = NO;
    //    self.barChart.valueLabelPattern = kPopoverLabelPatternBlank;
    _barChart4.isShowSeparate = YES;
    
    _barChart4.tag=104;
    //barChart.yLineSectionCount = 10;
    [self.view addSubview:_barChart4];
    [_barChart4 strokePath];
    
    
    
    
    
//    NSString*n=@"N=";
//    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
     NSLog(@"%ld",MAX(_a1, _a2, _a3));
    
    
    NSString*str;
    long a4;
    long aa=0;
    a4=0;
    a4=_a1+_a2+_a3;
    
    if (a4==0) {
        str=@"<5ml";
    }else{
    
    if (MAX(_a1, _a2, _a3)==_a1) {
        str=@"<5ml";
        aa=_a1;
    }
    else if(MAX(_a1, _a2, _a3)==_a2){
    
    str=@"5-10ml";
        aa=_a2;
    }
    else{
     str=@">10ml";
        aa=_a3;
    }
}
    
    NSLog(@"%ld,%ld,%ld",(long)_a1,(long)_a2,(long)_a3);
    
    
    NSLog(@"%ld",(long)MAX(_a1, _a2, _a3));
    
    
    
    if (a4==0) {
        aa=0;
    }
    else{
        aa=aa*1.0/a4*100;
    
    }

    
    
    
    
    
    long a2=0;
    a2=_o+_p;
    
    if (a2==0) {
        _o=0;
        _p=0;
    }
    else{
        _o=_o*1.0/a2*100;
         _p=_p*1.0/a2*100;
    }
    
    
    NSLog(@"%ld",(long)chart.tag);
    _l=0;
    _m=0;
    _n=0;
    long a1=0;
    
    _l=_a+_b;
    _m=_c+_d;
    _n=_e+_f;
    a1=_k+_g+_h+_i+_j;
    
    if (_l==0) {
        _a=0;
        _b=0;
    }
    else{
        
        _a=_a*1.0/_l*100;
        _b=_b*1.0/_l*100;
    }
    
    if (_m==0) {
        _c=0;
        _d=0;
    }
    else{
        
        _c=_c*1.0/_m*100;
        _d=_d*1.0/_m*100;
    }
    
    if (_n==0) {
        _e=0;
        _f=0;
    }
    else{
        
        _e=_e*1.0/_n*100;
        _f=_f*1.0/_n*100;
    }
    if (a1==0) {
        _k=0;
        _g=0;
        _h=0;
        _i=0;
        _j=0;
    }else{
        _k=_k*1.0/a1*100;
        _g=_g*1.0/a1*100;
        _h=_h*1.0/a1*100;
        _i=_i*1.0/a1*100;
        _j=_j*1.0/a1*100;
        
        
    }

    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_g]stringByAppendingString:@"%"];
    NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_h]stringByAppendingString:@"%"];
    NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_i]stringByAppendingString:@"%"];
    NSString*id10=[[NSString stringWithFormat:@"%ld",(long)_j]stringByAppendingString:@"%"];
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_k]stringByAppendingString:@"%"];
    NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_o]stringByAppendingString:@"%"];
    NSString*id13=[[NSString stringWithFormat:@"%ld",(long)aa]stringByAppendingString:@"%"];


    _shuomingLb.text=[[[[[id12 stringByAppendingString:@"采血后对导管进行冲洗。"]stringByAppendingString:@"\n如有弃去稀释液，大部分的操作人员("]stringByAppendingString:id13 ] stringByAppendingString:@")选择弃去的废液容量为"] stringByAppendingString:str];
    
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    
    
    
    if (chart.tag==101) {
        return @[id1,id2];
    }
    else if (chart.tag==102){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id3,id4];
    }else if (chart.tag==103){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id5,id6];
    }
    else{
        
        return @[id7,id8,id9,id10,id11];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"开放式", @"封闭式"];
    }
    else if (chart.tag==102){
        
        return @[@"≤4天", @"＞4天"];
    }
    else if (chart.tag==103){
        
        return @[@"是", @"否"];
    }
    else{
        
         return @[@"桡动脉", @"肱动脉",@"股动脉",@"足背动脉",@"其他"];
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
