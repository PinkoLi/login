//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTNineViewController.h"

#import "ZFChart.h"
@interface PPTNineViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger e;
@property (nonatomic, assign)NSInteger f;
@property (nonatomic, assign)NSInteger g;

@property (nonatomic, assign)NSInteger h;
@property(nonatomic,copy)NSString*str1;
@property(nonatomic,copy)NSString*str2;
@end

@implementation PPTNineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _bigArr=[[NSMutableArray alloc] init];
    _str1=[[NSString alloc] init];
    _str2=[[NSString alloc] init];
    
    NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    _a=0;
    _b=0;
    _c=0;
    _d=0;
    _e=0;
    _f=0;
    _g=0;
    _h=0;
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"A"] ) {
                ++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"B"] ) {
                ++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"C"] ) {
                ++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"D"] ) {
                ++_d;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"E"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"F"] ) {
                ++_f;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] objectForKey:@"choose"]containsObject:@"G"] ) {
                ++_g;
            }
            if ([[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"40"] ) {
                ++_h;
            }
            
            
            
            
            
        }
        
        
        
    }

    NSLog(@"%d",_a);
    NSNumber*a1=[NSNumber numberWithInteger:_a];
    NSNumber*a2=[NSNumber numberWithInteger:_b];
    NSNumber*a3=[NSNumber numberWithInteger:_c];
    NSNumber*a4=[NSNumber numberWithInteger:_d];
    NSNumber*a5=[NSNumber numberWithInteger:_e];
    NSNumber*a6=[NSNumber numberWithInteger:_f];
    NSNumber*a7=[NSNumber numberWithInteger:_g];
    
    [_bigArr addObject:a1];
     [_bigArr addObject:a2];
     [_bigArr addObject:a3];
     [_bigArr addObject:a4];
     [_bigArr addObject:a5];
     [_bigArr addObject:a6];
     [_bigArr addObject:a7];
    
    
    NSLog(@"%@",_bigArr);
  
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(188, 208, 500, 200)];
    _barChart.topicLabel.text = @"穿刺采血手法";
    
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
    
    
    
    
    
    
    
    NSString*n=@"N=";
    _nLb.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",_h]];
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
    
   
    long a1=0;
     a1=_a+_b+_c+_d+_e+_f+_g;
    
    if (a1==0) {
        _a=0;
        _b=0;
        _c=0;
        _d=0;
        _e=0;
        _f=0;
        _g=0;
        
       _str1=@"A";
        _str2=@"0%";
        
    }
    else{
        
        
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
        _c=_c*1.0/a1*100;
        _d=_d*1.0/a1*100;
        _e=_e*1.0/a1*100;
        _f=_f*1.0/a1*100;
        _g=_g*1.0/a1*100;
        
        NSLog(@"%@",[_bigArr valueForKeyPath:@"@max.floatValue"]);
        NSLog(@"%@",[_bigArr objectAtIndex:0]);
        
        if ([[_bigArr objectAtIndex:0]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"A";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
        }
       else if ([[_bigArr objectAtIndex:1]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"B";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
        }

      else  if ([[_bigArr objectAtIndex:2]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"C";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
        }

      else  if ([[_bigArr objectAtIndex:3]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"D";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
        }

      else  if ([[_bigArr objectAtIndex:4]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"E";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
        }

     else   if ([[_bigArr objectAtIndex:5]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"F";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
        }
     else  if ([[_bigArr objectAtIndex:6]isEqualToNumber:[_bigArr valueForKeyPath:@"@max.floatValue"]]) {
            _str1=@"G";
            _str2=[[NSString stringWithFormat:@"%ld",(long)_g] stringByAppendingString:@"%"];
         
        }


        
        
    }
    
    
  //CGFloat maxValue = [[_bigArr valueForKeyPath:@"@max.floatValue"] floatValue];
    
    NSLog(@"%@---%@",_str1,_str2);
    
    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_g] stringByAppendingString:@"%"];
    
    
    
    
    
    
    
    //目前观察到的采 血操作中,—— 手法的使用率最 高,达%
    NSString*str=[[[@"目前观察到的采血操作中," stringByAppendingString:_str1] stringByAppendingString:@"手法的使用率最高,达"] stringByAppendingString:_str2];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    
    
        return @[id1,id2,id3,id4,id5,id6,id7];

    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
   
        
        return @[@"A", @"B",@"C",@"D",@"E",@"F",@"G"];
   
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
