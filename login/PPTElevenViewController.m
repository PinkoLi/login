//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTElevenViewController.h"

#import "ZFChart.h"
@interface PPTElevenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
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
@property (nonatomic, assign)NSInteger l;
@property (nonatomic, assign)NSInteger n;


@property (nonatomic, assign)NSInteger m;

@property (nonatomic, assign)NSInteger z;
@end

@implementation PPTElevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _guanchaArr=[[NSMutableArray alloc] init];
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
    _n=0;
    _z=0;
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
      
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            
            if ([[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] ) {
                ++_z;
            }

            
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"<3分钟"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"<3minutes"]) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"3-5分钟"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"3-5minutes"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"5-10分钟"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"5-10minutes"]) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"≥10分钟"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"43"] objectForKey:@"choose"]containsObject:@"≥10minutes"]) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"淤青"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Bruise"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"皮下血肿"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Bleeding"]) {
                ++_f;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"出血"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Local infection"] ) {
                ++_g;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"动脉血管痉挛"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Thrombus"] ) {
                ++_h;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"局部感染"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Pseudoaneurysm"] ) {
                ++_i;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"血栓"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Subcutaneous hematoma"]) {
                ++_j;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"假性动脉瘤"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Arterial vasospasm"] ) {
                ++_k;
            }
            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"] lastObject]containsString:@"其他"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]lastObject]containsString:@"Other"] ) {
                ++_l;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"64"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"46"] objectForKey:@"choose"]containsObject:@"Bruise"] ) {
                ++_n;
            }
            
           
            
            
        }
        
        
        
    }
    
    if (_n!=0) {
           
           NSString*aa=[[@"否" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_e]] stringByAppendingFormat:@"例"];
           [_guanchaArr addObject:aa];
       }
    if (_e!=0) {
        
        NSString*aa=[[@"淤青" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_e]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];
    }
    if (_f!=0) {
        
        NSString*aa=[[@"皮下血肿" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_f]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];

      
    }
    if (_g!=0) {
        
        NSString*aa=[[@"出血" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_g]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];
      
    }
    if (_h!=0) {
        NSString*aa=[[@"动脉血管痉挛" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_h]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];
        
    }
    if (_i!=0) {
        
        NSString*aa=[[@"局部感染" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_i]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];
          }
    if (_j!=0) {
        NSString*aa=[[@"血栓" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_j]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];
       
    }
    if (_k!=0) {
        NSString*aa=[[@"假性动脉瘤" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_k]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];

      
    }
    if (_l!=0) {
        NSString*aa=[[@"其他" stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_l]] stringByAppendingFormat:@"例"];
        [_guanchaArr addObject:aa];

           }

     NSLog(@"%@",_guanchaArr);
    
    

    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 208, 300, 206)];
    _barChart.topicLabel.text = @"采血后按压时间";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(160, 420, 500, 206)];
    _barChart2.topicLabel.text = @"当场是否出现并发症及后续的处理";
    
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
    
    
    
    NSString*n=@"N=";
    _nLb.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",_z]];
    
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    
    
    
    
    
    
    
    long a1=0;
    long a2=0;
    
    a1=_a+_b+_c+_d;
    a2=_n+_e+_f+_g+_h+_i+_j+_k+_l;
    
    if (a1==0) {
        _a=0;
        _b=0;
        _c=0;
        _d=0;
    }else{
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
        _c=_c*1.0/a1*100;
        _d=_d*1.0/a1*100;
    
    }
    
    if (a2==0) {
        _e=0;
        _f=0;
        _g=0;
        _h=0;
        _i=0;
        _j=0;
        _k=0;
        _l=0;
        _n=0;
    }
    else{
        
        _e=_e*1.0/a2*100;
        _f=_f*1.0/a2*100;
        _g=_g*1.0/a2*100;
        _h=_h*1.0/a2*100;
        _i=_i*1.0/a2*100;
        _j=_j*1.0/a2*100;
        _k=_k*1.0/a2*100;
        _l=_l*1.0/a2*100;
        _n=_n*1.0/a2*100;

        
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
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_k] stringByAppendingString:@"%"];
    NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_l] stringByAppendingString:@"%"];
    NSString*id14=[[NSString stringWithFormat:@"%ld",(long)_n] stringByAppendingString:@"%"];

    
    
    if (_a+_b+_c+_d==0) {
        
        _m=0;
    }
    else{
    
        _m=_a*1.0/(_a+_b+_c+_d)*100;
    }
     NSString*id13=[[NSString stringWithFormat:@"%ld",(long)_m] stringByAppendingString:@"%"];
    
    
    //穿刺采血后按压 时间不足3分钟的 比例占 %。 现场共观察到淤 青 例,皮下血肿 例,出血 例,动 脉血管痉挛 例, 局部感染 例,血 栓 例,假性动脉 瘤 例。
    
    
    
     NSString *string = [_guanchaArr  componentsJoinedByString:@","];
    
    
    NSString*str=[[[[@"穿刺采血后按压时间不足3分钟的比例占" stringByAppendingString:id13] stringByAppendingString:@"。现场共观察到"] stringByAppendingString:string] stringByAppendingString:@"。"];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    
    
    if (chart.tag==101) {
        return @[id1,id2,id3,id4];
        
        
    }
    else {
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id14,id5,id6,id7,id8,id9,id10,id11,id12];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    if (chart.tag==101) {
        return @[@"<3分钟", @"3-5分钟",@"5-10分钟",@"≥10分钟"];
        
    }
    else{
        
        return @[@"否",@"淤青",@"皮下血肿",@"出血",@"动脉血管痉挛",@"局部感染",@"血栓",@"假性动脉瘤",@"其他"];
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
