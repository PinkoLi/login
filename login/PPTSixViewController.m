//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTSixViewController.h"

#import "ZFChart.h"
@interface PPTSixViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
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

@property (nonatomic, assign)NSInteger o;
@property (nonatomic, assign)NSInteger p;
@property (nonatomic, assign)NSInteger q;

@property (nonatomic, assign)NSInteger aa;
@property (nonatomic, assign)NSInteger bb;
@property (nonatomic, copy)NSString*jiujing;
@property(nonatomic,strong)NSMutableArray*jiujingArr;
@end

@implementation PPTSixViewController

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
    _aa=0;
    _bb=0;
    _jiujingArr=[[NSMutableArray alloc] init];
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"26"] objectForKey:@"text"]) {
                _jiujing=[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"26"] objectForKey:@"text"];
                [_jiujingArr addObject:_jiujing];
            }
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"24"] objectForKey:@"choose"]containsObject:@"是"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"24"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"24"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"24"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_b;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"30"] objectForKey:@"choose"]containsObject:@"是"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"30"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_aa;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"30"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"30"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_bb;
            }

            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"酒精（乙醇)"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"Alcohol (ethanol)"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"碘伏"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"Idophor "]) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"碘酊"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"Iodine tincture "]) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"氯己定"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"Chlorhexidine "] ) {
                ++_o;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"丙乙醇"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"]containsObject:@"isopropanol "]) {
                ++_p;
            }
            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"] lastObject]containsString:@"非以上，请描述"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"25"] objectForKey:@"choose"] lastObject]containsString:@"If none of the above, please specify"] ) {
                ++_q;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"由内向外画圈"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"Circling inside out"] ) {
                ++_f;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"由外向内画圈"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"Circling outside in"] ) {
                ++_g;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"一次性向上/下擦涂皮肤表面"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"Rub the skin surface upwards/downwards once"] ) {
                ++_h;
            }

            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"反复涂抹"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]containsObject:@"Wipe repeatedly"] ) {
                ++_i;
            }

            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"] lastObject]containsString:@"非以上，请描述"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"27"] objectForKey:@"choose"]lastObject]containsString:@"If none of the above, please specify"] ) {
                ++_j;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"29"] objectForKey:@"choose"]containsObject:@"≥30秒"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"29"] objectForKey:@"choose"]containsObject:@"≥30seconds"]) {
                ++_k;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"29"] objectForKey:@"choose"]containsObject:@"<30秒"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"29"] objectForKey:@"choose"]containsObject:@"<30seconds"]) {
                ++_l;
            }

            
          
            
            
        }
        
        
        
    }
    
    
    NSLog(@"%@",_jiujingArr);
    NSLog(@"%ld,%ld",(long)_a,(long)_b);
    
//    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
//    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
//    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
//    NSString*str=[[[[[[[@"观察到采血部位消毒剂的种类有:酒精" stringByAppendingString:id1] stringByAppendingString:@","] stringByAppendingString:@"碘伏"] stringByAppendingString:id2] stringByAppendingString:@"     有"] stringByAppendingString:id3] stringByAppendingString:@"操作者不会对接触采血区域的手指再次使用消毒剂进行消毒"];
//    _shuomingLb.text=str;
//    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
//    _shuomingLb.numberOfLines = 0;
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(110, 208, 250, 126)];
    _barChart.topicLabel.text = @"     是否对采血部位消毒";
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    
  //  _barChart.unit = @"人";
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(369, 208, 340, 126)];
   _barChart2.topicLabel.text = @"消毒种类";
    
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
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(110, 362, 350, 250)];
    _barChart3.topicLabel.text = @"消毒方式";
    
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
    
    
    _barChart4 = [[ZFBarChart alloc] initWithFrame:CGRectMake(460, 362, 250, 250)];
    _barChart4.topicLabel.text = @"        消毒后等待干燥时间";
    
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
    
    
    
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr objectForKey:@"thisArr"] count]]];
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    long a1=0;
    long a2=0;
     long a3=0;
     long a4=0;
    long a5=0;
    
    
    a1=_a+_b;
    a2=_c+_d+_e+_o+_p+_q;
    a3=_f+_g+_h+_i+_j;
    a4=_k+_l;
    a5=_aa+_bb;
    
    if (a1==0) {
        _a=0;
        _b=0;
    }
    else{
    
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
    }
    
    if (a5==0) {
        _aa=0;
        _bb=0;
    }
    else{
        
        _aa=_aa*1.0/a5*100;
        _bb=_bb*1.0/a5*100;
    }

    
    if (a2==0) {
        _c=0;
        _d=0;
        _e=0;
        _o=0;
        _p=0;
        _q=0;
    }
    else{
    
        _c=_c*1.0/a2*100;
        _d=_d*1.0/a2*100;
        _e=_e*1.0/a2*100;
        _o=_o*1.0/a2*100;
        _p=_p*1.0/a2*100;
        _q=_q*1.0/a2*100;
        
    
    }
    
    if (a3==0) {
        _f=0;
        _g=0;
        _h=0;
        _i=0;
        _j=0;
    }else{
        _f=_f*1.0/a3*100;
        _g=_g*1.0/a3*100;
        _h=_h*1.0/a3*100;
        _i=_i*1.0/a3*100;
        _j=_j*1.0/a3*100;
    
    
    }
    
    if (a4==0) {
        _k=0;
        _l=0;
    }else{
        _k=_k*1.0/a4*100;
        
        _l=_l*1.0/a4*100;
    }
    
    
    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c]stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d]stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e]stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f]stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_g]stringByAppendingString:@"%"];
    NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_h]stringByAppendingString:@"%"];
    NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_i]stringByAppendingString:@"%"];
    NSString*id10=[[NSString stringWithFormat:@"%ld",(long)_j]stringByAppendingString:@"%"];
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_k]stringByAppendingString:@"%"];
     NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_l]stringByAppendingString:@"%"];
    
    NSString*id13=[[NSString stringWithFormat:@"%ld",(long)_o]stringByAppendingString:@"%"];
    NSString*id14=[[NSString stringWithFormat:@"%ld",(long)_p]stringByAppendingString:@"%"];
    NSString*id15=[[NSString stringWithFormat:@"%ld",(long)_q]stringByAppendingString:@"%"];
    
    
     NSString*id16=[[NSString stringWithFormat:@"%ld",(long)_bb]stringByAppendingString:@"%"];
    
    NSNumber *sum = [_jiujingArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum);
    
    NSInteger myInteger1 = [sum integerValue];
    
    if (_jiujingArr.count==0) {
         NSInteger myInteger2=0;
        
         _jiujing=[NSString stringWithFormat:@"%ld",(long)myInteger2];
        
    }
    else{
    
        NSInteger myInteger2=myInteger1/_jiujingArr.count;
         _jiujing=[NSString stringWithFormat:@"%ld",(long)myInteger2];
    }
    
    
    
    NSLog(@"%@",_jiujing);
   
    
    
    if ([_jiujing isEqualToString:@"0"]) {
        NSString*str=[[[[[@"观察到采血部位消毒剂的种类有" stringByAppendingString:@"碘伏"] stringByAppendingString:id4] stringByAppendingString:@"\n有"] stringByAppendingString:id16] stringByAppendingString:@"操作者不会对接触采血区域的手指再次使用消毒剂进行消毒"];
        _shuomingLb.text=str;
        _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
        _shuomingLb.numberOfLines = 0;
    }
    else{
    
        NSString*str=[[[[[[[[[[@"观察到采血部位消毒剂的种类有:酒精" stringByAppendingString:id3] stringByAppendingString:@" "] stringByAppendingString:@"碘伏"] stringByAppendingString:id4] stringByAppendingString:@" 其中酒精的浓度为"] stringByAppendingString:_jiujing] stringByAppendingString:@"%。"]stringByAppendingString:@"\n有"] stringByAppendingString:id16] stringByAppendingString:@"操作者不会对接触采血区域的手指再次使用消毒剂进行消毒"];
        _shuomingLb.text=str;
        _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
        _shuomingLb.numberOfLines = 0;
    }
    
    
    
//    NSString*str=[[[[[[[@"观察到采血部位消毒剂的种类有:酒精" stringByAppendingString:id3] stringByAppendingString:@"，"] stringByAppendingString:@"碘伏"] stringByAppendingString:id4] stringByAppendingString:@"\n有"] stringByAppendingString:id2] stringByAppendingString:@"操作者不会对接触采血区域的手指再次使用消毒剂进行消毒"];
//    _shuomingLb.text=str;
//    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
//    _shuomingLb.numberOfLines = 0;
    
    
    if (chart.tag==101) {
        return @[id1,id2];
    }
    else if (chart.tag==102){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id3,id4,id5,id13,id14,id15];
    }else if (chart.tag==103){
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id6,id7,id8,id9,id10];
    }
    else{
        
        return @[id11,id12];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"是", @"否"];
    }
    else if (chart.tag==102){
        
        return @[@"酒精", @"碘伏",@"碘酊",@"氯己定",@"丙乙醇",@"其他"];
    }
    else if (chart.tag==103){
        
        return @[@"由内向外画圈", @"由外向内画圈",@"一次性向上/下擦涂",@"反复涂抹",@"其他"];
    }
    else{
        
        return @[@"≥30秒", @"<30秒"];
    }
}

- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFMagenta];
}

- (CGFloat)paddingForGroupsInBarChart:(ZFBarChart *)barChart{

    
        return 20;
    

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
