//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTSeventeenViewController.h"

#import "ZFChart.h"
@interface PPTSeventeenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;


@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger e;
@property (nonatomic, assign)NSInteger f;
@end

@implementation PPTSeventeenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSUserDefaults *thisArr2 = [NSUserDefaults standardUserDefaults];
    _chooseArr=[[NSMutableArray alloc] init];
    _yangbenArr=[[NSMutableArray alloc] init];
    NSLog(@"%@",[thisArr2 objectForKey:@"thisArr2"]);
    
    _a=0;
    _b=0;
    _c=0;
    _shiwuArr=[[NSMutableArray alloc] init];
    _ershiArr=[[NSMutableArray alloc] init];
    _sanshiArr=[[NSMutableArray alloc] init];
    
    
    
    
    for (int i=0; i<[[thisArr2 objectForKey:@"thisArr2"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] count]; j++) {
            
            
//            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"68"] objectForKey:@"choose"]containsObject:@"≤15分钟"] ) {
//                ++_a;
//            }
//            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"68"] objectForKey:@"choose"]containsObject:@"15-30分钟"] ) {
//                ++_b;
//            }
//            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"68"] objectForKey:@"choose"]containsObject:@"≥30分钟"] ) {
//                ++_c;
//            }
//            
            
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"68"] objectForKey:@"choose"] objectAtIndex:0]) {
                [_chooseArr addObject:[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"68"] objectForKey:@"choose"] ];
            }

            
            
            
        }
        
        
        
    }
    
    NSLog(@"%@",_chooseArr);
    
    
    
    NSString*chooseStr;
    NSString *subfixString;
    
    for (int i=0; i<_chooseArr.count; i++) {
        
        for (int j=0; j<[[_chooseArr objectAtIndex:i] count]; j++) {
        chooseStr=[[_chooseArr objectAtIndex:i] objectAtIndex:j];
        
        if([chooseStr rangeOfString:@"≤15分钟"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:6];
            
            [_shiwuArr addObject:subfixString];
        }
        if([chooseStr rangeOfString:@"15-30分钟"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:8];
            
            [_ershiArr addObject:subfixString];
        }
            if([chooseStr rangeOfString:@"15至30分钟"].location !=NSNotFound)//_roaldSearchText
            {
                subfixString = [chooseStr substringFromIndex:8];
                
                [_ershiArr addObject:subfixString];
            }
        if([chooseStr rangeOfString:@"≥30分钟"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:6];
            
            [_sanshiArr addObject:subfixString];
        }
        
        if([chooseStr rangeOfString:@"抽查样本总数"].location !=NSNotFound)//_roaldSearchText
        {
            
            
           subfixString = [chooseStr substringFromIndex:7];
            
            [_yangbenArr addObject:subfixString];
        
        }
            
            
            
}
                
        
    }
    NSLog(@"%@",_yangbenArr );
    
    NSNumber *sum = [_yangbenArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum);
    _num1.text=[NSString stringWithFormat:@"%@",sum];
    
    NSNumber *sum2 = [_shiwuArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum2);
    _shiwu=[NSString stringWithFormat:@"%@",sum2];

    
    NSNumber *sum3 = [_ershiArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum3);
    _ershi=[NSString stringWithFormat:@"%@",sum3];

    NSNumber *sum4 = [_sanshiArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum4);
    _sanshi=[NSString stringWithFormat:@"%@",sum4];
    
    
   
    NSLog(@"%@",_shiwuArr);
     NSLog(@"%@",_ershiArr);
     NSLog(@"%@",_sanshiArr);
    
    
    
    NSInteger myInteger1 = [sum2 integerValue];
    NSInteger myInteger2 = [sum3 integerValue];
    NSInteger myInteger3 = [sum4 integerValue];
    NSInteger myInteger4 = [sum integerValue];
    _a=[sum2 intValue];
    _b=[sum3 intValue];
    _c=[sum4 intValue];
    
    if (sum2==0) {
        _d=0;
    }
    else{
        _d=myInteger1*1.0/myInteger4*100;
    }
    if (sum3==0) {
        _e=0;
    }
    else{
        _e=myInteger2*1.0/myInteger4*100;
    }
    if (sum3==0) {
        _f=0;
    }
    else{
        _f=myInteger3*1.0/myInteger4*100;
    }
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    
//    NSString*str=[[[[[@"有" stringByAppendingString:id1] stringByAppendingString:@"的样本在15分钟内上机检测,有"]stringByAppendingString:id2]stringByAppendingString:@"的样本在15-30分钟上机检测,上机时间大于30分钟的样本达"]stringByAppendingString:id3] ;
//    NSLog(@"%@",str);
//    _shuomingLb.text=str;
//    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
//    _shuomingLb.numberOfLines = 0;

    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(188, 388, 300, 200)];
    //_barChart.topicLabel.text = @"穿刺采血手法";
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    
    //_barChart.unit = @"份";
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
    _nLb.text=[n stringByAppendingString:[NSString stringWithFormat:@"%lu",[[thisArr2 objectForKey:@"thisArr2"] count]]];
    
    
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    
    NSLog(@"%ld",(long)chart.tag);
//    NSString*id1=[NSString stringWithFormat:@"%ld",(long)_a];
//    NSString*id2=[NSString stringWithFormat:@"%ld",(long)_b];
//    NSString*id3=[NSString stringWithFormat:@"%ld",(long)_c];

//有%的样本在15 分钟内上机检 测, 有%的样本在15- 30分钟上机检 测, 上机时间大于30 分钟的样本达%
    
    long a1=0;
    a1=_a+_b+_c;
    if (a1==0) {
        _a=0;
        _b=0;
        _c=0;
    }else{
        
        _a=_a*1.0/a1*100;
        _b=_b*1.0/a1*100;
        _c=_c*1.0/a1*100;
    }
    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    
    
    NSString*str=[[[[[@"有" stringByAppendingString:id1] stringByAppendingString:@"的样本在15分钟内上机检测,有"]stringByAppendingString:id2]stringByAppendingString:@"的样本在15-30分钟上机检测,上机时间大于30分钟的样本达"]stringByAppendingString:id3] ;
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    
    return @[id1,id2,id3];
    
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    
    
    return @[@"≤15分钟", @"15-30分钟",@"≥30分钟"];
    
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
