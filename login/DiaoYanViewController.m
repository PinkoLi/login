//
//  DiaoYanViewController.m
//  login
//
//  Created by 茶茶漾 on 16/8/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "DiaoYanViewController.h"
#import "ZFChart.h"
#import "SSCheckBoxView.h"
@interface DiaoYanViewController ()
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define Start_X 40.0f           // 第一个按钮的X坐标
#define Start_Y 300.0f           // 第一个按钮的Y坐标
#define Width_Space 10.0f        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height 30.0f    // 高
#define Button_Width 240.0f      // 宽


@property (nonatomic, assign)NSInteger a;
@property (nonatomic, assign)NSInteger b;
@property (nonatomic, assign)NSInteger c;
@property (nonatomic, assign)NSInteger d;
@property (nonatomic, assign)NSInteger e;
@end

@implementation DiaoYanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
      NSUserDefaults *keshiArr = [NSUserDefaults standardUserDefaults];
     NSUserDefaults *thisArr = [NSUserDefaults standardUserDefaults];
    //NSLog(@"%@",[thisArr objectForKey:@"thisArr"]);
    
    

    _ksArr=[[NSMutableArray alloc] init];

    _keshi=[[NSMutableArray alloc] init];
    _keshi2=[[NSMutableArray alloc] init];
    _keshi3=[[NSMutableArray alloc] init];

     _dongmaiArr=[[NSMutableArray alloc] init];
    _dongmaiArr2=[[NSMutableArray alloc] init];
     _dongmaiArr3=[[NSMutableArray alloc] init];
     _dongmaiArr4=[[NSMutableArray alloc] init];
    _zhusheArr=[[NSMutableArray alloc] init];
    _zhusheArr2=[[NSMutableArray alloc] init];
    _zhusheArr3=[[NSMutableArray alloc] init];
    _zhusheArr4=[[NSMutableArray alloc] init];
    _typeArr=[[NSMutableArray alloc] init];
    _typeArr2=[[NSMutableArray alloc] init];
    _typeArr3=[[NSMutableArray alloc] init];
    _typeArr4=[[NSMutableArray alloc] init];
     _fangshiArr=[[NSMutableArray alloc] init];
     _pinlvArr=[[NSMutableArray alloc] init];
     _pinlvArr2=[[NSMutableArray alloc] init];
     _pinlvArr3=[[NSMutableArray alloc] init];
     _pinlvArr4=[[NSMutableArray alloc] init];
    
    _ksArr=[NSMutableArray arrayWithArray:[keshiArr objectForKey:@"keshiArr"]];
  //  [_ksArr addObject:@"其他"];
    
    
    
    
    
    for (int i=0; i<[_ksArr count]; i++) {
        
            
            if ([[_ksArr objectAtIndex:i] isEqualToString:@"重症"]||[[_ksArr objectAtIndex:i] isEqualToString:@"急症"]||[[_ksArr objectAtIndex:i] isEqualToString:@"呼吸"]||[[_ksArr objectAtIndex:i] isEqualToString:@"麻醉"]||[[_ksArr objectAtIndex:i] isEqualToString:@"其他"]) {
                
                [_keshi2 addObject:[_ksArr objectAtIndex:i]];
            }
        }
    
    
    
    
    NSArray *result = [_keshi2 valueForKeyPath:@"@distinctUnionOfObjects.self"];
        
       //[_keshi2 addObjectsFromArray:_keshi];
    _keshi3=[NSMutableArray arrayWithArray:result];
    [_keshi3 addObject:@"其他"];


    
    
  
    
#pragma 第一个问题
    
   
    int a=0;
    
//    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
//
//
//
//        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
//
//
//            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]) {
//
//                [_keshi addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"keshi"] objectForKey:@"keshi"]];
//            }
//
//
//
//
//
//
//        }
//    }
//
//     NSLog(@"%@",_keshi);
//
//
//    for (NSString*str in _keshi) {
//
//        if (![str isEqualToString:@"重症"]&&![str isEqualToString:@"急症"]&&![str isEqualToString:@"呼吸"]&&![str isEqualToString:@"麻醉"]) {
//            [_keshi2 addObject:@"其他"];
//        }
//    }
//
//    [_keshi2 addObjectsFromArray:_keshi];
//
//    NSLog(@"%@",_keshi2);
    
    
    
    for (int i=0; i<[_keshi3 count ]; i++) {
        
  
            
//            if ([_keshi2 containsObject:[[keshiArr objectForKey:@"keshiArr"] objectAtIndex:i]]) {
//                a=1;
//            }
//            else{
//
//
//                a=0;
//
//            }
        

        
        
        
                NSInteger index = i % 1;
                NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width-130 + Width_Space) + 169, page* (Button_Height + Height_Space+20)+276, Button_Width-130, Button_Height) style:kSSCheckBoxViewStyleMono checked:0];
        NSString *a1 = [_keshi3 objectAtIndex:i];
        
//        a1=[a1 stringByReplacingOccurrencesOfString:@"重症"withString:@"ICU"];
//        a1=[a1 stringByReplacingOccurrencesOfString:@"急症"withString:@"Emergency"];
//        a1=[a1 stringByReplacingOccurrencesOfString:@"呼吸"withString:@"Respiratory"];
//        a1=[a1 stringByReplacingOccurrencesOfString:@"麻醉"withString:@"Anaesthesia"];
        
//        if ([a1 isEqualToString:@"重症"]) {
//            a1=@"重症";
//            [cb setText:a1];
//
//        }
//        else if([a1 isEqualToString:@"急症"]){
//
//        a1=@"急症";
//            [cb setText:a1];
//
//        }
//        else if([a1 isEqualToString:@"呼吸"]){
//
//            a1=@"呼吸";
//            [cb setText:a1];
//
//        }
//        else if([a1 isEqualToString:@"麻醉"]){
//
//            a1=@"麻醉";
//            [cb setText:a1];
//
//        }
//        else if([a1 isEqualToString:@"其他"]){
//
//            a1=@"其他";
//            [cb setText:a1];
//
//        }
//        else{
//
//
//        }
       
        [cb setText:a1];

        
        cb.enabled=NO;
        
        [self.view addSubview:cb];

        
        
       // [cb setStateChangedTarget:self selector:@selector(change6:)];
       
       // [self.view addSubview:cb];
        
        
        
        
        
        
    }
    

    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"3.2"] objectForKey:@"choose"]) {
                
                NSLog(@"%@",[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"3.2"] objectForKey:@"choose"]);
                
                
                [_dongmaiArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"3.2"] objectForKey:@"choose"]];
            }
            
            
            
        }
        
        
    }
    
    NSLog(@"%@",_dongmaiArr);
    
    
    
    
    
    
    NSString*maoshengStr;
    
    for (int i=0; i<_dongmaiArr.count; i++) {
      
        for (int j=0; j<[[_dongmaiArr objectAtIndex:i]count]; j++) {
            
            maoshengStr=[[_dongmaiArr objectAtIndex:i] objectAtIndex:j];
            
            
            if([maoshengStr rangeOfString:@"1ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_dongmaiArr2 addObject:@"1ml"];
            }
            if([maoshengStr rangeOfString:@"1.5ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_dongmaiArr2 addObject:@"1.5ml"];
            }
            if([maoshengStr rangeOfString:@"2ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_dongmaiArr2 addObject:@"2ml"];
            }
            if([maoshengStr rangeOfString:@"2.5ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_dongmaiArr2 addObject:@"2.5ml"];
            }
            if([maoshengStr rangeOfString:@"3ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_dongmaiArr2 addObject:@"3ml"];
            }
            
        }
       
        
    }
    
    
    
    for (NSString *str in _dongmaiArr2) {
        if (![_dongmaiArr3 containsObject:str]) {
            [_dongmaiArr3 addObject:str];
        }
    }

    
 
//    NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch|NSNumericSearch|
//    NSWidthInsensitiveSearch|NSForcedOrderingSearch;
//    NSComparator sort = ^(NSString *obj1,NSString *obj2){
//        NSRange range = NSMakeRange(0,obj1.length);
//        return [obj1 compare:obj2 options:comparisonOptions range:range];
//    };
//    NSArray *resultArray2 = [_dongmaiArr2 sortedArrayUsingComparator:sort];
//    NSLog(@"字符串数组排序结果%@",resultArray2);
    
    
    
   
    
//    NSComparator finderSort = ^(id string1,id string2){
//        
//        if ([string1 integerValue] > [string2 integerValue]) {
//            return (NSComparisonResult)NSOrderedDescending;
//        }else if ([string1 integerValue] < [string2 integerValue]){
//            return (NSComparisonResult)NSOrderedAscending;
//        }
//        else
//            return (NSComparisonResult)NSOrderedSame;
//    };
//    
//    //数组排序：
//    NSArray *resultArray = [_dongmaiArr2 sortedArrayUsingComparator:finderSort];
//    _dongmaiArr3=[NSMutableArray arrayWithArray:resultArray];

    
    NSStringCompareOptions comparisonOptions = NSNumericSearch;
    NSComparator sort = ^(NSString *obj1,NSString *obj2){
        NSRange range = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions range:range];
    };
    NSArray *resultArray = [_dongmaiArr3 sortedArrayUsingComparator:sort];
    _dongmaiArr4=[NSMutableArray arrayWithArray:resultArray];

    
    if (_dongmaiArr4.count>=4) {
        [_dongmaiArr4 exchangeObjectAtIndex:0 withObjectAtIndex:1];
        [_dongmaiArr4 exchangeObjectAtIndex:2 withObjectAtIndex:3];
    }
   
    
    
    
//    
//    NSSet *set = [NSSet setWithArray:_dongmaiArr2];
//    NSArray *sortDesc = @[[[NSSortDescriptor alloc] initWithKey:nil ascending:YES]];
//    NSArray *sortSetArray = [set sortedArrayUsingDescriptors:sortDesc];
//    _dongmaiArr3=[NSMutableArray arrayWithArray:sortSetArray];
    
    NSLog(@"%@",_dongmaiArr4);
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"3.1"] objectForKey:@"choose"]) {
                
                [_zhusheArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"3.1"] objectForKey:@"choose"]];
            }
            
            
            
        }
    }
    
    NSLog(@"%@",_zhusheArr);
    
    
    
    NSString*maoshengStr2;
    
    for (int i=0; i<_zhusheArr.count; i++) {
        
        for (int j=0; j<[[_zhusheArr objectAtIndex:i]count]; j++) {
            
            maoshengStr2=[[_zhusheArr objectAtIndex:i] objectAtIndex:j];
            
            
            if([maoshengStr2 rangeOfString:@"1ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_zhusheArr2 addObject:@"1ml"];
            }
            if([maoshengStr2 rangeOfString:@"2ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_zhusheArr2 addObject:@"2ml"];
            }
            if([maoshengStr2 rangeOfString:@"3ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_zhusheArr2 addObject:@"3ml"];
            }
            if([maoshengStr2 rangeOfString:@"5ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_zhusheArr2 addObject:@"5ml"];
            }
            if([maoshengStr2 rangeOfString:@"10ml"].location !=NSNotFound)//_roaldSearchText
            {
                [_zhusheArr2 addObject:@"10ml"];
            }
            
        }
        
        
    }
    
    NSLog(@"%@",_zhusheArr2);
    

    for (NSString *str in _zhusheArr2) {
        if (![_zhusheArr3 containsObject:str]) {
            [_zhusheArr3 addObject:str];
        }
    }

    
    NSStringCompareOptions comparisonOptions2 = NSNumericSearch;
    NSComparator sort2 = ^(NSString *obj1,NSString *obj2){
        NSRange range2 = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions2 range:range2];
    };
    NSArray *resultArray2 = [_zhusheArr3 sortedArrayUsingComparator:sort2];
    _zhusheArr4=[NSMutableArray arrayWithArray:resultArray2];

    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.1"] objectForKey:@"choose"]) {
                
                
                
                
                [_typeArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.1"] objectForKey:@"choose"]];
            }
            
            
            
        }
    }
    
    
    NSString*maoshengStr3;
    
    
   

    
    for (int i=0; i<_typeArr.count; i++) {
        
        for (int j=0; j<[[_typeArr objectAtIndex:i]count]; j++) {
            
            maoshengStr3=[[_typeArr objectAtIndex:i] objectAtIndex:j];
            
            
            if(([maoshengStr3 rangeOfString:@"肝素钠溶液"].location !=NSNotFound)||([maoshengStr3 rangeOfString:@"Heparin sodium aqueous"].location !=NSNotFound))//_roaldSearchText
            {
                [_typeArr2 addObject:@"肝素钠溶液"];
            }
            if(([maoshengStr3 rangeOfString:@"肝素锂溶液"].location !=NSNotFound)||([maoshengStr3 rangeOfString:@"Heparin lithium aqueous"].location !=NSNotFound))//_roaldSearchText
            {
                [_typeArr2 addObject:@"肝素锂溶液"];
            }
            if(([maoshengStr3 rangeOfString:@"冻干肝素+生理盐水"].location !=NSNotFound)||([maoshengStr3 rangeOfString:@"Freeze-dried heparin + normal saline"].location !=NSNotFound))//_roaldSearchText
            {
                [_typeArr2 addObject:@"冻干肝素+生理盐水"];
            }
        }
        
        
    }

    
    for (NSString *str in _typeArr2) {
        if (![_typeArr3 containsObject:str]) {
            [_typeArr3 addObject:str];
        }
    }
    
    
    NSStringCompareOptions comparisonOptions3 = NSNumericSearch;
    NSComparator sort3 = ^(NSString *obj1,NSString *obj2){
        NSRange range3 = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions3 range:range3];
    };
    NSArray *resultArray3 = [_typeArr3 sortedArrayUsingComparator:sort3];
    _typeArr4=[NSMutableArray arrayWithArray:resultArray3];
    
    
    
#pragma 第二个问题
    
    
    NSMutableArray*oneArray=[[NSMutableArray alloc] initWithObjects:@"动脉采血器",@"注射器",nil];
    NSMutableArray*panduan=[[NSMutableArray alloc] init];
   
    
   
  
    if (_dongmaiArr4.count!=0) {
       
        [panduan addObject:[NSNumber numberWithInt:1]];
    }
    else{
    
        [panduan addObject:[NSNumber numberWithInt:0]];
    }
    if (_zhusheArr4.count!=0) {
          [panduan addObject:[NSNumber numberWithInt:1]];
    }
    else{
    
        [panduan addObject:[NSNumber numberWithInt:0]];
    
    }
    
    NSLog(@"%@",panduan);
    
    NSNumber* c;
   
    
    for (int i=0; i<[oneArray count ]; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 1;
        NSInteger page = i / 1;
        
         c=[panduan objectAtIndex:i];
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width-130 + Width_Space) + 409, page* (Button_Height + Height_Space+100)+276, Button_Width-50, Button_Height) style:kSSCheckBoxViewStyleGlossy checked:[c integerValue]];
        
        
        NSLog(@"%@",[panduan objectAtIndex:i]);

        
        
        NSString *a1 = [oneArray objectAtIndex:i];
        
        [cb setText:a1];
        cb.enabled=NO;
        
        
        // [cb setStateChangedTarget:self selector:@selector(change6:)];
        
        [self.view addSubview:cb];
        
        
        
        
        
        
    }

    
    
    
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.2"] objectForKey:@"choose"]) {
                
                [_fangshiArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.2"] objectForKey:@"choose"]];
            }
            
            
            
        }
    }
    for (int i=0; i<[[thisArr objectForKey:@"thisArr"] count]; i++) {
        
        
        
        for (int j=0; j<[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] count]; j++) {
            
            
            if ([[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.3"] objectForKey:@"choose"]) {
                
                [_pinlvArr addObject:[[[[[thisArr objectForKey:@"thisArr"] objectAtIndex:i] objectAtIndex:j] objectForKey:@"5.3"] objectForKey:@"choose"]];
            }
            
            
            
        }
    }
    
    
    
    
    NSString*maoshengStr4;
    
    
    
    
    
    for (int i=0; i<_pinlvArr.count; i++) {
        
        for (int j=0; j<[[_pinlvArr objectAtIndex:i]count]; j++) {
            
            maoshengStr4=[[_pinlvArr objectAtIndex:i] objectAtIndex:j];
            
            
            if(([maoshengStr4 rangeOfString:@"一次一配"].location !=NSNotFound)||([maoshengStr4 rangeOfString:@"Prepared for single use"].location !=NSNotFound))//_roaldSearchText
            {
                [_pinlvArr2 addObject:@"一次一配"];
            }
            if(([maoshengStr4 rangeOfString:@"一配多次使用"].location !=NSNotFound)||([maoshengStr4 rangeOfString:@" Prepared for multiple use"].location !=NSNotFound))//_roaldSearchText
            {
                [_pinlvArr2 addObject:@"一配多次使用"];
            }
            if(([maoshengStr4 rangeOfString:@"其他"].location !=NSNotFound)||([maoshengStr4 rangeOfString:@"Other"].location !=NSNotFound))//_roaldSearchText
            {
                [_pinlvArr2 addObject:@"其他"];
            }
        }
        
        
    }
    
    NSLog(@"%@",_pinlvArr2);
    
    
    
    for (NSString *str in _pinlvArr2) {
        if (![_pinlvArr3 containsObject:str]) {
            [_pinlvArr3 addObject:str];
        }
    }
    
    
    NSStringCompareOptions comparisonOptions4 = NSNumericSearch;
    NSComparator sort4 = ^(NSString *obj1,NSString *obj2){
        NSRange range4 = NSMakeRange(0,obj1.length);
        return [obj1 compare:obj2 options:comparisonOptions4 range:range4];
    };
    NSArray *resultArray4 = [_pinlvArr3 sortedArrayUsingComparator:sort4];
    _pinlvArr4=[NSMutableArray arrayWithArray:resultArray4];

    
    
    
    
   
    
//     NSSet *set = [NSSet setWithArray:_dongmaiArr];
//    NSLog(@"%@",set);
    
    NSLog(@"%@",_zhusheArr);
    NSLog(@"%@",_typeArr);
    
    
    
    
    
    NSString *string = [_dongmaiArr4  componentsJoinedByString:@","];
    NSString *string2 = [_zhusheArr4  componentsJoinedByString:@","];
     NSString *string3 = [_typeArr4 componentsJoinedByString:@","];
    NSString *string4 = [[_fangshiArr objectAtIndex:0] componentsJoinedByString:@","];
 
    
    
    NSString *string5 = [_pinlvArr4  componentsJoinedByString:@","];
    //NSMutableString *string6 = [[NSMutableString alloc]initWithString:string5] ;
//    NSRange range = NSMakeRange(0, [string6 length]);
//    [string6 replaceOccurrencesOfString:@"(" withString:@" " options:NSCaseInsensitiveSearch range:range];
//     [string6 replaceOccurrencesOfString:@"Other" withString:@"其他 " options:NSCaseInsensitiveSearch range:range];
    
//    if ([string3 isEqualToString:@"Heparin sodium aqueous"]) {
//        string3=@"肝素钠溶液";
//    }
//   else if ([string3 isEqualToString:@"Heparin lithium aqueous"]) {
//        string3=@"肝素锂溶液";
//    }
//   else if ([string3 isEqualToString:@"Freeze-dried heparin + normal saline"]) {
//        string3=@"冻干肝素+生理盐水";
//    }
    
    
    _dongmaiLb.text=string;
    
    
    _zhusheLb.text=string2;
    _type.text=string3;
    _fangshi.text=string4;
    _pinlv.text=string5;
    
    _dongmaiLb.lineBreakMode = UILineBreakModeWordWrap;
    _dongmaiLb.numberOfLines = 0;
    _zhusheLb.lineBreakMode = UILineBreakModeWordWrap;
    _zhusheLb.numberOfLines = 0;
    _type.lineBreakMode = UILineBreakModeWordWrap;
    _type.numberOfLines = 0;
    _fangshi.lineBreakMode = UILineBreakModeWordWrap;
    _fangshi.numberOfLines = 0;
    _pinlv.lineBreakMode = UILineBreakModeWordWrap;
    _pinlv.numberOfLines = 0;
    
    
    
    
    
    

    
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
