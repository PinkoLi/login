//
//  PPTThreeViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/10.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "PPTTenViewController.h"

#import "ZFChart.h"
@interface PPTTenViewController ()<ZFGenericChartDataSource, ZFBarChartDelegate>
@property (nonatomic, strong) ZFBarChart * barChart;
@property (nonatomic, strong) ZFBarChart * barChart2;

@property (nonatomic, strong) ZFBarChart * barChart3;
@property (nonatomic, strong) ZFBarChart * barChart4;
@property (nonatomic, strong) ZFBarChart * barChart5;
@property (nonatomic, strong) ZFBarChart * barChart6;


@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger a2;
@property (nonatomic, assign)NSInteger b2;
@property (nonatomic, assign)NSInteger c2;
@property (nonatomic, assign)NSInteger d2;
@property (nonatomic, assign)NSInteger a3;
@property (nonatomic, assign)NSInteger b3;
@property (nonatomic, assign)NSInteger c3;
@property (nonatomic, assign)NSInteger d3;
@property (nonatomic, assign)NSInteger a4;
@property (nonatomic, assign)NSInteger b4;
@property (nonatomic, assign)NSInteger c4;
@property (nonatomic, assign)NSInteger d4;
@property (nonatomic, assign)NSInteger a5;
@property (nonatomic, assign)NSInteger b5;
@property (nonatomic, assign)NSInteger c5;
@property (nonatomic, assign)NSInteger d5;
@property (nonatomic, assign)NSInteger e;
@property (nonatomic, assign)NSInteger f;
@property (nonatomic, assign)NSInteger g;
@property (weak, nonatomic) IBOutlet UILabel *n1;

@end

@implementation PPTTenViewController

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
    _a2=0;
    _b2=0;
    _c2=0;
    _d2=0;
    _a3=0;
    _b3=0;
    _c3=0;
    _d3=0;
    _a4=0;
    _b4=0;
    _c4=0;
    _d4=0;
    _a5=0;
    _b5=0;
    _c5=0;
    _d5=0;
  
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
//        _twoArray=[[NSMutableArray alloc] initWithObjects:@"桡动脉",@"肱动脉",@"股动脉",@"足背动脉",@"其他部位",nil];
//        _twoArray=[[NSMutableArray alloc] initWithObjects:@"Radial artery",@"Brachial artery",@"Femoral artery",@"Arteria dorsalis pedis",@"Other",nil];
        
       
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            
          
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"桡动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Radial artery"] ) {
                
                
                
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]  ) {
                //++_a;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"] ) {
                //++_b;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"]  ) {
                //++_c;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ) {
                //++_d;
            }
                
                
                
                
                

 }
            
           
            
            
            //2
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"肱动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Brachial artery"] ) {
                
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]  ) {
                    ++_a2;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"] ) {
                    ++_b2;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"]  ) {
                    ++_c2;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ) {
                    ++_d2;
                }
                
            }

            //3
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"股动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Femoral artery"] ) {
                
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]  ) {
                    ++_a3;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"] ) {
                    ++_b3;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"]  ) {
                    ++_c3;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ) {
                    ++_d3;
                }
                
            }
            //4
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"足背动脉"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"]containsObject:@"Arteria dorsalis pedis"] ) {
                
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]  ) {
                    ++_a4;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"] ) {
                    ++_b4;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"]  ) {
                    ++_c4;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ) {
                    ++_d4;
                }
                
            }
            //5
            if ([[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"其他"]||[[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"38"] objectForKey:@"choose"] lastObject]containsString:@"Other"] ) {
                
              
                
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"<30degrees"]  ) {
                    ++_a5;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45degrees"] ) {
                    ++_b5;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90degrees"]  ) {
                    ++_c5;
                }
                if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-4] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j-5] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90degrees"] ) {
                    ++_d5;
                }
                
            }

            
            
            
            
            
            
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"42"] objectForKey:@"choose"]containsObject:@"是"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"42"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                ++_e;
            }
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"42"] objectForKey:@"choose"]containsObject:@"否"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"42"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                ++_f;
            }
            
            if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"＜30度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"YES"] ) {
                           ++_a;
                       }
                       if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"30-45度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"NO"] ) {
                           ++_b;
                       }
           if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"45-90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"YES"] ) {
               ++_c;
           }
           if ([[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"90度"]||[[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"41"] objectForKey:@"choose"]containsObject:@"NO"] ) {
               ++_d;
           }
            
            
            
            
            
        }
        
        
        
        
    }
    
    
    //        _twoArray=[[NSMutableArray alloc] initWithObjects:@"桡动脉",@"肱动脉",@"股动脉",@"足背动脉",@"其他部位",nil];
    
    
    
    _g=_e+_f;
    NSString*n=@"N=";
    _n1.text=[n stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)_g]];

    
    _barChart = [[ZFBarChart alloc] initWithFrame:CGRectMake(65, 228, 235, 150)];
     _barChart.topicLabel.text = @"桡动脉";
    
    
    _barChart.dataSource = self;
    _barChart.delegate = self;
    
   
    _barChart.isAnimated = NO;
   
    _barChart.isResetAxisLineMaxValue = NO;
    
    _barChart.isShowSeparate = YES;
    _barChart.tag=101;
   
//    [self.view addSubview:_barChart];
//
//    [_barChart strokePath];
    
    
    _barChart3 = [[ZFBarChart alloc] initWithFrame:CGRectMake(250, 228, 300, 200)];
    _barChart3.topicLabel.text = @"穿刺角度";
    
    
    _barChart3.dataSource = self;
    _barChart3.delegate = self;
    
    
    _barChart3.isAnimated = NO;
    
    _barChart3.isResetAxisLineMaxValue = NO;
    
    _barChart3.isShowSeparate = YES;
    _barChart3.tag=103;
    
    [self.view addSubview:_barChart3];
    
    [_barChart3 strokePath];
    
    
    
    _barChart4 = [[ZFBarChart alloc] initWithFrame:CGRectMake(535, 228, 235, 150)];
    _barChart4.topicLabel.text = @"股动脉";
    
    
    _barChart4.dataSource = self;
    _barChart4.delegate = self;
    
    
    _barChart4.isAnimated = NO;
    
    _barChart4.isResetAxisLineMaxValue = NO;
    
    _barChart4.isShowSeparate = YES;
    _barChart4.tag=104;
    
//    [self.view addSubview:_barChart4];
//
//    [_barChart4 strokePath];
    
    _barChart5 = [[ZFBarChart alloc] initWithFrame:CGRectMake(65, 470, 235, 150)];
    _barChart5.topicLabel.text = @"足背动脉";
    
    
    _barChart5.dataSource = self;
    _barChart5.delegate = self;
    
    
    _barChart5.isAnimated = NO;
    
    _barChart5.isResetAxisLineMaxValue = NO;
    
    _barChart5.isShowSeparate = YES;
    _barChart5.tag=105;
    
//    [self.view addSubview:_barChart5];
//
//    [_barChart5 strokePath];
    
    
    _barChart6 = [[ZFBarChart alloc] initWithFrame:CGRectMake(300, 470, 235, 150)];
    _barChart6.topicLabel.text = @"其他";
    
    
    _barChart6.dataSource = self;
    _barChart6.delegate = self;
    
    
    _barChart6.isAnimated = NO;
    
    _barChart6.isResetAxisLineMaxValue = NO;
    
    _barChart6.isShowSeparate = YES;
    _barChart6.tag=106;
    
//    [self.view addSubview:_barChart6];
//
//    [_barChart6 strokePath];

    
    
    
    
    
    _barChart2 = [[ZFBarChart alloc] initWithFrame:CGRectMake(270, 470, 200, 160)];
    _barChart2.topicLabel.text = @"一针穿刺成功";
    _barChart2.topicLabel.textAlignment = UITextAlignmentCenter;
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
    
    long a1=0;
    
    long a2=0;
    
    long a3=0;
    long a4=0;
    long a5=0;
    long a6=0;
    
    long a7=0;

   
    
    
    a1=_e+_f;
    a2=_a+_b+_c+_d;
    a3=_a2+_b2+_c2+_d2;
     a4=_a3+_b3+_c3+_d3;
     a5=_a4+_b4+_c4+_d4;
     a6=_a5+_b5+_c5+_d5;
    

  
    
    
    if (a1==0) {
        _e=0;
        _f=0;
    }else{
    
        _e=_e*1.0/a1*100;
        _f=_f*1.0/a1*100;
    
    }
   
    if (a2==0) {
        _a=0;
        _b=0;
        _c=0;
        _d=0;
    }else{
    
        _a=_a*1.0/a2*100;
        _b=_b*1.0/a2*100;
        _c=_c*1.0/a2*100;
        _d=_d*1.0/a2*100;
    }
    if (a3==0) {
        _a2=0;
        _b2=0;
        _c2=0;
        _d2=0;
    }else{
        
        _a2=_a2*1.0/a3*100;
        _b2=_b2*1.0/a3*100;
        _c2=_c2*1.0/a3*100;
        _d2=_d2*1.0/a3*100;
    }
    
    if (a4==0) {
        _a3=0;
        _b3=0;
        _c3=0;
        _d3=0;
    }else{
        
        _a3=_a3*1.0/a4*100;
        _b3=_b3*1.0/a4*100;
        _c3=_c3*1.0/a4*100;
        _d3=_d3*1.0/a4*100;
    }
    
    if (a5==0) {
        _a4=0;
        _b4=0;
        _c4=0;
        _d4=0;
    }else{
        
        _a4=_a4*1.0/a5*100;
        _b4=_b4*1.0/a5*100;
        _c4=_c4*1.0/a5*100;
        _d4=_d4*1.0/a5*100;
    }
    
    if (a6==0) {
        _a5=0;
        _b5=0;
        _c5=0;
        _d5=0;
    }else{
        
        _a5=_a5*1.0/a6*100;
        _b5=_b5*1.0/a6*100;
        _c5=_c5*1.0/a6*100;
        _d5=_d5*1.0/a6*100;
    }

    
    
    
    NSString*id1=[[NSString stringWithFormat:@"%ld",(long)_a] stringByAppendingString:@"%"];
    NSString*id2=[[NSString stringWithFormat:@"%ld",(long)_b] stringByAppendingString:@"%"];
    NSString*id3=[[NSString stringWithFormat:@"%ld",(long)_c] stringByAppendingString:@"%"];
    NSString*id4=[[NSString stringWithFormat:@"%ld",(long)_d] stringByAppendingString:@"%"];
    NSString*id5=[[NSString stringWithFormat:@"%ld",(long)_e] stringByAppendingString:@"%"];
    NSString*id6=[[NSString stringWithFormat:@"%ld",(long)_f] stringByAppendingString:@"%"];
    
    
    NSString*id7=[[NSString stringWithFormat:@"%ld",(long)_a2] stringByAppendingString:@"%"];
    NSString*id8=[[NSString stringWithFormat:@"%ld",(long)_b2] stringByAppendingString:@"%"];
    NSString*id9=[[NSString stringWithFormat:@"%ld",(long)_c2] stringByAppendingString:@"%"];
    NSString*id10=[[NSString stringWithFormat:@"%ld",(long)_d2] stringByAppendingString:@"%"];
    
    NSString*id11=[[NSString stringWithFormat:@"%ld",(long)_a3] stringByAppendingString:@"%"];
    NSString*id12=[[NSString stringWithFormat:@"%ld",(long)_b3] stringByAppendingString:@"%"];
    NSString*id13=[[NSString stringWithFormat:@"%ld",(long)_c3] stringByAppendingString:@"%"];
    NSString*id14=[[NSString stringWithFormat:@"%ld",(long)_d3] stringByAppendingString:@"%"];
    
    NSString*id15=[[NSString stringWithFormat:@"%ld",(long)_a4] stringByAppendingString:@"%"];
    NSString*id16=[[NSString stringWithFormat:@"%ld",(long)_b4] stringByAppendingString:@"%"];
    NSString*id17=[[NSString stringWithFormat:@"%ld",(long)_c4] stringByAppendingString:@"%"];
    NSString*id18=[[NSString stringWithFormat:@"%ld",(long)_d4] stringByAppendingString:@"%"];
    
    NSString*id19=[[NSString stringWithFormat:@"%ld",(long)_a5] stringByAppendingString:@"%"];
    NSString*id20=[[NSString stringWithFormat:@"%ld",(long)_b5] stringByAppendingString:@"%"];
    NSString*id21=[[NSString stringWithFormat:@"%ld",(long)_c5] stringByAppendingString:@"%"];
    NSString*id22=[[NSString stringWithFormat:@"%ld",(long)_d5] stringByAppendingString:@"%"];


    
    //现场观察中,一 针穿刺成功率 为% (是否需要根据 采血部位进行拆 分?)
    NSString*str=[[@"现场观察中,一针穿刺成功率为" stringByAppendingString:id5] stringByAppendingString:@""];
    NSLog(@"%@",str);
    _shuomingLb.text=str;
    _shuomingLb.lineBreakMode = UILineBreakModeWordWrap;
    _shuomingLb.numberOfLines = 0;

    
    
    if (chart.tag==103) {
        return @[id1,id2,id3,id4];
        
        
    }
    else if (chart.tag==101) {
        return @[id7,id8,id9,id10];
        
        
    }
    else if (chart.tag==104) {
        return @[id11,id12,id13,id14];
        
        
    }
    else if (chart.tag==105) {
        return @[id15,id16,id17,id18];
        
        
    }
    else if (chart.tag==106) {
        return @[id19,id20,id21,id22];
        
        
    }

    else {
        
        NSLog(@"%ld",(long)chart.tag);
        
        return @[id5,id6];
    }
    
    
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    
    chart.axisLineNameFont= [UIFont systemFontOfSize:8];
    
    if (chart.tag==102) {
        
         return @[@"是", @"否"];
    }
    
    else{
        
       
         return @[@"＜30度", @"30-45度",@"45-90度",@"90度"];
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
//        popoverLabel.textColor = ZFSkyBlue;
//        [popoverLabel strokePath];
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
