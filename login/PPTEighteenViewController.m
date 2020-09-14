//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTEighteenViewController.h"

#import "ZFChart.h"
@interface PPTEighteenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
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


@property(copy,nonatomic)NSString*jingMai;
@property(copy,nonatomic)NSString*qiPao;
@property(copy,nonatomic)NSString*ningXue;
@property(copy,nonatomic)NSString*yangBen;
@property(copy,nonatomic)NSString*wuXiao;
@property(copy,nonatomic)NSString*xinXi;
@property(copy,nonatomic)NSString*pianshao;
@property(copy,nonatomic)NSString*shijian;

@end

@implementation PPTEighteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *thisArr2 = [NSUserDefaults standardUserDefaults];
    
    NSLog(@"%@",[thisArr2 objectForKey:@"thisArr2"]);
    
    _a=0;
    _b=0;
    _c=0;
    _e=0;
    _f=0;
    _d=0;
    _i=0;
    _j=0;
    _allArr=[[NSMutableArray alloc] init];
     _chooseArr=[[NSMutableArray alloc] init];
      _yangbenArr=[[NSMutableArray alloc] init];
    _jingMaiArr=[[NSMutableArray alloc] init];
    _qiPaoArr=[[NSMutableArray alloc] init];
    _ningXueArr=[[NSMutableArray alloc] init];
    _yangBenArr=[[NSMutableArray alloc] init];
    _wuXiaoArr=[[NSMutableArray alloc] init];
    _xinXiArr=[[NSMutableArray alloc] init];
    _pianshaoArr=[[NSMutableArray alloc] init];
    _shijianArr=[[NSMutableArray alloc] init];
    _zongshu=[[NSMutableArray alloc] init];

    
    
    
    
    for (int i=0; i<[[thisArr2 objectForKey:@"thisArr2"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] count]; j++) {
            
//            NSString*str=[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"text1"];
//          
//           // int allStr=[str intValue];
//            NSLog(@"%@",[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"text1"]);
            
           
           // [_allArr addObject:str];
            
         
           
            
            if ([[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"choose"] ) {
                
              
                    
            [_chooseArr addObject:[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"choose"]];
                
                
            }
            
            
            if ([[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"text1"] ) {
                [_yangbenArr addObject:[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"67"] objectForKey:@"text"]];
            }
            
           
            
            
            
            
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"71"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"71"] objectForKey:@"choose"]containsObject:@"YES"]  ) {
                ++_g;
            }
            
            if ([[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"71"] objectForKey:@"choose"]containsObject:@"否"] ||[[[[[[thisArr2 objectForKey:@"thisArr2"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"71"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_h;
            }
            
           
            
        }
        
        
        
    }
    
    NSLog(@"%@",_chooseArr);
    
    NSString*chooseStr;
      NSString *subfixString;
    
    for (int i=0; i<_chooseArr.count; i++) {
        
        for (int j=0; j<[[_chooseArr objectAtIndex:i] count]; j++) {
   
        chooseStr=[[_chooseArr objectAtIndex:i] objectAtIndex:j];
            
            if([chooseStr rangeOfString:@"抽查样本总数"].location !=NSNotFound)//_roaldSearchText
                   {
                       subfixString = [chooseStr substringFromIndex:7];
                       
                       [_zongshu addObject:subfixString];
                       
                       
                   }
        
        if([chooseStr rangeOfString:@"不合格样本气泡"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:8];
            
            [_qiPaoArr addObject:subfixString];
            
            
        }
        if([chooseStr rangeOfString:@"不合格样本凝血"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:8];
            
            [_ningXueArr addObject:subfixString];
            
        }
        if([chooseStr rangeOfString:@"不合格样本静脉血混入"].location !=NSNotFound)//_roaldSearchText
        {
           // ++_c;
            
            
            subfixString = [chooseStr substringFromIndex:11];
            
            [_jingMaiArr addObject:subfixString];
            
        }
        if([chooseStr rangeOfString:@"不合格样本无标识"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:9];
            
            [_yangBenArr addObject:subfixString];
        }
        if([chooseStr rangeOfString:@"不合格样本无检验单"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:10];
            
            [_wuXiaoArr addObject:subfixString];
        }
        if([chooseStr rangeOfString:@"不合格样本标识与检验单信息不一致"].location !=NSNotFound)//_roaldSearchText
        {
            subfixString = [chooseStr substringFromIndex:17];
            
            [_xinXiArr addObject:subfixString];
        }
            
            if([chooseStr rangeOfString:@"不合格样本样本血量偏少：使用1ml采血器时血量<0.5ml，3ml采血器血量<1ml"].location !=NSNotFound)//_roaldSearchText
            {
                subfixString = [chooseStr substringFromIndex:43];
                
                [_pianshaoArr addObject:subfixString];
            }
            if([chooseStr rangeOfString:@"不合格样本检测单未标记采血时间"].location !=NSNotFound)//_roaldSearchText
            {
                subfixString = [chooseStr substringFromIndex:16];
                
                [_shijianArr addObject:subfixString];
            }
            
            
            
 }
        
    }
    
    NSLog(@"%@",_yangbenArr);
    
    
    NSNumber *sum = [_zongshu valueForKeyPath:@"@sum.floatValue"];
    
  
    NSLog(@"%@",sum);
    _num1.text=[NSString stringWithFormat:@"%@",sum];
    
    
    NSNumber *sum2 = [_jingMaiArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum2);
    _jingMai=[NSString stringWithFormat:@"%@",sum2];
    
    
    
    NSNumber *sum3 = [_qiPaoArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum3);
    _qiPao=[NSString stringWithFormat:@"%@",sum3];
    
    NSNumber *sum4 = [_ningXueArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum4);
    _ningXue=[NSString stringWithFormat:@"%@",sum4];
    
    
    NSNumber *sum5 = [_yangBenArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum5);
    _yangBen=[NSString stringWithFormat:@"%@",sum5];
    
    NSNumber *sum6 = [_wuXiaoArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum6);
    _wuXiao=[NSString stringWithFormat:@"%@",sum6];
    
    NSNumber *sum7 = [_xinXiArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum7);
    _xinXi=[NSString stringWithFormat:@"%@",sum7];
    
    
    NSNumber *sum8 = [_pianshaoArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum8);
    _pianshao=[NSString stringWithFormat:@"%@",sum8];
    
    NSNumber *sum9 = [_shijianArr valueForKeyPath:@"@sum.floatValue"];
    
    
    NSLog(@"%@",sum9);
    _shijian=[NSString stringWithFormat:@"%@",sum9];
    


    int aaa=([sum2 intValue]+[sum3 intValue]+[sum4 intValue]+[sum5 intValue]+[sum6 intValue]+[sum7 intValue]+[sum8 intValue]+[sum9 intValue]);
    
      _num2.text=[NSString stringWithFormat:@"%d",aaa];
    
    _a=[sum2 intValue];
    _b=[sum3 intValue];
    _c=[sum4 intValue];
    _d=[sum5 intValue];
    _e=[sum6 intValue];
    _f=[sum7 intValue];
    _i=[sum8 intValue];
    _j=[sum9 intValue];
    
    
    NSLog(@"%ld,%ld,%ld,%ld,%ld,%ld,%ld,%ld",(long)_a,(long)_b,(long)_c,(long)_d,(long)_e,(long)_f,(long)_i,(long)_j);
    
    
    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(188, 388, 500, 200)];
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
    
    long a1=0;
    a1=_g+_h;
    
    
    if (a1==0) {
        _h=0;
        _g=0;
    }
    else{
        _h=_h*1.0/a1*100;
         _g=_g*1.0/a1*100;
    }
    
    
    long a2=0;
    a2=_a+_b+_c+_d+_e+_f+_i+_j;
    if (a2==0) {
        _a=0;
        _b=0;
        _c=0;
        _d=0;
        _e=0;
        _f=0;
        _i=0;
        _j=0;
    }else{
        _a=_a*1.0/a2*100;
        _b=_b*1.0/a2*100;
        _c=_c*1.0/a2*100;
        _d=_d*1.0/a2*100;
        _e=_e*1.0/a2*100;
        _f=_f*1.0/a2*100;
        _i=_i*1.0/a2*100;
        _j=_j*1.0/a2*100;
    
    }

    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c]stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_h] stringByAppendingString:@"%"];
     NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_i] stringByAppendingString:@"%"];
     NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_j] stringByAppendingString:@"%"];

    _shuomingLb.text=[[@"有" stringByAppendingString:id7] stringByAppendingString:@"的样本上机检测前没有再次混匀。"];
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;
    

    
//    return @[_qiPao,_ningXue,_jingMai,_yangBen,_wuXiao,_xinXi];
    
     return @[id2,id3,id1,id4,id5,id6,id8,id9];
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    
    
    return @[@"气泡", @"凝血",@"静脉血混入",@"样本无标识",@"无检验单",@"信息不一致",@"样本血量偏少",@"未标记时间"];
    
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
