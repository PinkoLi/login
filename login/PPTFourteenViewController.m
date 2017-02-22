//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTFourteenViewController.h"

#import "ZFChart.h"
@interface PPTFourteenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
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

@property (nonatomic, assign)NSInteger aa;
@property (nonatomic, assign)NSInteger bb;

@property (nonatomic, assign)NSInteger cc;

@end

@implementation PPTFourteenViewController

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
    _i=0;
    _j=0;
    _aa=0;
    _bb=0;
    _cc=0;
  
    
    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"53"] objectForKey:@"choose"]containsObject:@"是"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"53"] objectForKey:@"choose"]containsObject:@"YES"]) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"53"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"53"] objectForKey:@"choose"]containsObject:@"NO"]) {
                ++_b;
            }
            
           
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"使用橡胶塞"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"the rubber stopper"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"使用针座帽"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"the needle hub cap"] ) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"两者均用"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"both"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"两者均不用"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"none"] ) {
                ++_f;
            }
            
            
//            _oneArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"No, only the rubber stopper was used",@"No, only the needle hub cap was used",@"No, none was used",nil];
//            _oneArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否，仅用橡胶塞",@"否，仅用针座帽",@"否，两者均不用",nil];
//            _twoArray=[[NSMutableArray alloc] initWithObjects:@"Pre-set ordinary syringe-with needle ",@"Pre-set ordinary syringe-without needle",@"Suction-type ordinary syringe-without needle",@"Pre-set safety syringe",nil];
//            _twoArray=[[NSMutableArray alloc] initWithObjects:@"预设式普通型-带针",@"预设式普通型-不带针",@"抽吸式普通型-不带针",@"预设式-安全型",nil];
//
            
           
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]) {
                
               
                
                ++_cc;
                
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"预设式普通型-带针"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"36"] objectForKey:@"choose"]containsObject:@"Pre-set ordinary syringe-with needle "] ) {
                    
                    
                    //NSLog(@"%@",[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] );
                    
                    for (NSDictionary*str in [[thisArr objectForKey:@"thisArr"] objectAtIndex:i]) {
                        
                        
                        
                        if ([[[str objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"两者均用"]||[[[str objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"both"] ) {
                            
                            
                            
                            
                            
                            ++_aa;
                            
                            
                        }
                        else{
                            
                          //  ++_bb;
                        }

                        
                        
                  
                    }
                    
                    
                    
//                    if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"两者均用"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"both"] ) {
//                        
//                        
//                        
//                        
//                        
//                        ++_aa;
//                        
//                        
//                    }
//                    else{
//                        
//                        ++_bb;
//                    }
                    
                    
                }
                
                else{
                
//                    if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"使用针座帽"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"the needle hub cap"] ) {
//                        
//                        ++_aa;
//                        
//                        
//                    }
//                    else{
//                        
//                        ++_bb;
//                    }

                    for (NSDictionary*str in [[thisArr objectForKey:@"thisArr"] objectAtIndex:i]) {
                        
                        
                        
                        if ([[[str objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"使用针座帽"]||[[[str objectForKey:@"57"] objectForKey:@"choose"]containsObject:@"the needle hub cap"] ) {
                            
                            
                            
                            
                            
                            ++_aa;
                            
                            
                        }
                        else{
                            
                            //  ++_bb;
                        }
                        
                        
                        
                        
                    }
                
                
                }
                
                
                
                
            }
            
            
            
            
           
            
            
        }
        
        
        
    }
    
    _bb=_cc-_aa;
    
    NSLog(@"%ld,%ld",(long)_aa,(long)_cc);
    
    _g=_a+_b;
    _h=_c+_d+_e+_f;
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_g]];
    _n2.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_h]];
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 208, 500, 200)];
    _barChart.topicLabel.text = @"如注射器，采血后是否立即用橡胶塞封闭针头";
    
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
    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(210, 420, 500, 200)];
//    _barChart2.topicLabel.text = @"如动脉采血器，采血后是否使用橡胶塞和针座帽";
    _barChart2.topicLabel.text = @"如使用动脉采血器，采血后正确封闭样本的比例";
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
    
    
    
    
    
    
    
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
    
    long a1=0;
    long a2=0;
    
    a1=_a+_b;
    a2=_aa+_bb;
    
    if (a1==0) {
        _a=0;
        _b=0;
    }else{
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
    
    }
    if (a2==0) {
//        _c=0;
//        _d=0;
//        _e=0;
//        _f=0;
        _aa=0;
        _bb=0;
    }else{
    
//        _c=_c*1.0/a2*100;
//        _d=_d*1.0/a2*100;
//        _e=_e*1.0/a2*100;
//        _f=_f*1.0/a2*100;
        
        _aa=_aa*1.0/a2*100;
        _bb=_bb*1.0/a2*100;
    }
    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
//    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
//    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
//    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
//    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
     NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_aa] stringByAppendingString:@"%"];
     NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_bb] stringByAppendingString:@"%"];
    
    //如使用动脉采血器，采血后正确封闭样本的比例
    
    NSString*str=[[[[@"标本处理,正确封闭样本的比例分别为:" stringByAppendingString:id1]stringByAppendingString:@"(注射器采血)," ] stringByAppendingString:id3] stringByAppendingString:@"(动脉采血器采血)"];
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
        
        //return @[@"是",@"否，仅用橡胶塞",@"否，仅用针座帽",@"否，两者均不用"];
        return @[@"正确",@"错误"];
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
