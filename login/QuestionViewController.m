//
//  QuestionViewController.m
//  login
//
//  Created by 茶茶漾 on 16/7/1.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "QuestionViewController.h"
#import "LMComBoxView.h"
#import "LMContainsLMComboxScrollView.h"
#import "SSCheckBoxView.h"
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "UIHelpers.h"
@interface QuestionViewController ()<LMComBoxViewDelegate>{

//    LMContainsLMComboxScrollView *bgScrollView;
//     LMContainsLMComboxScrollView *bgScrollView2;
//    LMContainsLMComboxScrollView *bgScrollView3;
//    LMContainsLMComboxScrollView *bgScrollView4;
//    LMComBoxView *comBox;
//    LMComBoxView *comBox2;
//    LMComBoxView *comBox3;
//    LMComBoxView *comBox4;

}
@property (strong, nonatomic) MBProgressHUD *hud;
//@property(strong ,nonatomic )NSMutableDictionary*dict;
//@property(strong ,nonatomic )NSMutableArray*type;
//@property(strong ,nonatomic )NSMutableArray*arr1;
//@property(strong ,nonatomic )NSMutableArray*arr11;
//@property(strong ,nonatomic )NSMutableArray*arr12;
//@property(strong ,nonatomic )NSMutableArray*arr13;
//@property(strong ,nonatomic )NSMutableArray*arr14;
//@property(strong ,nonatomic )NSMutableArray*arr2;
//@property(strong ,nonatomic )NSDictionary*parameters;

@property(nonatomic,strong)SSCheckBoxView *cb;
//@property(nonatomic,strong)SSCheckBoxView *cb2;
//@property(nonatomic,strong)SSCheckBoxView *cb3;
//@property(nonatomic,strong)SSCheckBoxView *cb4;
//@property(nonatomic,strong)SSCheckBoxView *cb5;
//@property(nonatomic,strong)SSCheckBoxView *cb6;
//@property(nonatomic,strong)SSCheckBoxView *cb7;
//@property(nonatomic,strong)SSCheckBoxView *cb8;
//@property(nonatomic,strong)SSCheckBoxView *cb9;
//@property(nonatomic,strong)SSCheckBoxView *cb10;
//@property(nonatomic,strong)SSCheckBoxView *cb11;
//@property(nonatomic,strong)SSCheckBoxView *cb12;
//@property(nonatomic,strong)SSCheckBoxView *cb13;
//@property(nonatomic,strong)SSCheckBoxView *cb14;
//@property(nonatomic,strong)SSCheckBoxView *cb15;
//@property(nonatomic,strong)SSCheckBoxView *cb16;
//@property(nonatomic,strong)SSCheckBoxView *cb17;
//@property(nonatomic,strong)SSCheckBoxView *cb18;
//@property(nonatomic,strong)SSCheckBoxView *cb19;
//@property(nonatomic,strong)SSCheckBoxView *cb20;
//@property(nonatomic,strong)SSCheckBoxView *cb21;
//@property(nonatomic,strong)SSCheckBoxView *cb22;
//@property(nonatomic,strong)SSCheckBoxView *cb23;
//@property(nonatomic,strong)SSCheckBoxView *cb24;
//@property(nonatomic,strong)SSCheckBoxView *cb25;
//
//@property(nonatomic,strong)SSCheckBoxView *cb26;
//@property(nonatomic,strong)SSCheckBoxView *cb27;
//@property(nonatomic,strong)SSCheckBoxView *cb28;
//@property(nonatomic,strong)SSCheckBoxView *cb29;
//@property(nonatomic,strong)SSCheckBoxView *cb30;
//@property(nonatomic,strong)SSCheckBoxView *cb31;
//
//@property(nonatomic,strong)SSCheckBoxView *cb32;
//@property(nonatomic,strong)SSCheckBoxView *cb33;
//@property(nonatomic,strong)SSCheckBoxView *cb34;
//@property(nonatomic,strong)SSCheckBoxView *cb35;
//@property(nonatomic,strong)SSCheckBoxView *cb36;
//@property(nonatomic,strong)SSCheckBoxView *cb37;
//
//@property(nonatomic,strong)SSCheckBoxView *cb38;
//@property(nonatomic,strong)SSCheckBoxView *cb39;
//
//@property(nonatomic,strong)SSCheckBoxView *cb40;
//@property(nonatomic,strong)SSCheckBoxView *cb41;
//@property(nonatomic,strong)SSCheckBoxView *cb42;
//@property(nonatomic,strong)SSCheckBoxView *cb43;
//
//@property(nonatomic,strong)UITextField*textField;
//@property(nonatomic,strong)UITextField*textField2;
//@property(nonatomic,strong)UITextField*textField3;
//@property(nonatomic,strong)UITextField*textField4;
//@property(nonatomic,strong)UITextField*textField5;
//@property(nonatomic,strong)UITextField*textField6;
//@property(nonatomic,strong)UITextField*textField7;
//@property(nonatomic,strong)UITextField*textField8;
//@property(nonatomic,strong)UITextField*textField9;
//@property(nonatomic,strong)UITextField*textField10;
//
//@property (strong, nonatomic)  UIScrollView *scrollView;
//@property(nonatomic,strong)NSString*xuanze1;
//@property(nonatomic,strong)NSString*xuanze2;
@end

@implementation QuestionViewController
#define kDropDownListTag 1000

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",_host);
   
    _timeNow = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc)userInfo:nil repeats:YES];

   // _type=[NSMutableArray arrayWithCapacity:10];
    
  
    
    
    UIImageView* bgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"组-6.png"]];
    bgview.frame = CGRectMake(0, 0, 1024, 768);
    [self.view addSubview:bgview];
    
    
//    _scrollView.pagingEnabled=NO;
//    _scrollView.showsVerticalScrollIndicator = NO;
//    
//    _scrollView.showsHorizontalScrollIndicator = YES;
//    _scrollView.directionalLockEnabled = YES;
//    _scrollView = [[UIScrollView alloc] init];
//    _scrollView.frame = CGRectMake(0, 0, 1024, 768);
//    CGSize newSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+1600);
//    [_scrollView setContentSize:newSize];
//    
//    //[_scrollView setBackgroundColor:[UIColor clearColor]];
//    [_scrollView setContentOffset:CGPointMake(0,0)];
//  
//    [self.view addSubview:_scrollView];
    
    
    
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    
//   
//    [sessionManager GET:@"http://netkq.webbsn.com/roche/index.php/Api/xedni" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        NSLog(@"%lld", downloadProgress.totalUnitCount);
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        //_dict=[[NSMutableDictionary alloc] init];
//        
//        _dict=[responseObject[0]objectForKey:@"content"];
//        NSLog(@"%@",_dict);
//        [self crate];
//        
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
//    
//    
//    
//    NSLog(@"%@",_bianhao);
    


}

- (void)timerFunc
{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateFormat:@"YY-MM-dd HH:mm:ss"];
    
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    
    _timeLabel.text= timestamp;
    
    
}
//-(void)crate{
//     // [_l_timeButton setBackgroundColor:UIColorFromRGB(0xd0d0d0)];
//
//
//
//    UILabel*label1=[[UILabel alloc] initWithFrame:CGRectMake(153, 66, 412 , 48) ];
//        label1.backgroundColor = [UIColor clearColor];
//    
//        label1.text =@"1.科室:";
//        //设置标签文本字体和字体大小
//        label1.font = [UIFont fontWithName:@"Arial" size:20];
//        [_scrollView addSubview:label1];
//    bgScrollView = [[LMContainsLMComboxScrollView alloc]initWithFrame:CGRectMake(250, 73,550, 90)];
//    bgScrollView.backgroundColor = [UIColor clearColor];
//    bgScrollView.showsVerticalScrollIndicator = YES;
//    bgScrollView.showsHorizontalScrollIndicator = NO;
//    [_scrollView addSubview:bgScrollView];
//    
//    
//     _arr11=[[NSMutableArray alloc]init];
//    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
//    _arr11=[keshi objectForKey:@"keshi"];
//    _keshi=[keshi objectForKey:@"keshi"][0];
//                             
//    
//    
//    
//    //    NSInteger i=0;
//    comBox = [[LMComBoxView alloc]initWithFrame:CGRectMake(0, 0, 160, 30)];
//    comBox.backgroundColor = [UIColor clearColor];
//    comBox.arrowImgName = @"down_dark0.png";
//    NSMutableArray *itemsArray =_arr11;
//    
//    comBox.titlesList = itemsArray;
//    comBox.delegate = self;
//    comBox.supView = bgScrollView;
//    [comBox defaultSettings];
//    comBox.tag = kDropDownListTag + 0;
//    [bgScrollView addSubview:comBox];
//    
//    
//    UILabel*label2=[[UILabel alloc] initWithFrame:CGRectMake(533, 66, 412 , 48) ];
//    label2.backgroundColor = [UIColor clearColor];
//    label2.text =@"2.床位数:";
//    
//    //设置标签文本字体和字体大小
//    label2.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label2];
//    
//    _textField = [[UITextField alloc] initWithFrame:CGRectMake(650, 75, 200, 30)];
//    _textField.delegate=self;
//    // 设置UITextField的样式
//    _textField.borderStyle = UITextBorderStyleNone;
//    _textField.keyboardType=UIKeyboardTypeNumberPad;
//    // 文字对齐方式
//    _textField.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField.placeholder = @"请输入床位数";
//    // 字体
//    _textField.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField];
//    
//    
//    UILabel*label3=[[UILabel alloc] initWithFrame:CGRectMake(153, 166, 412 , 48) ];
//    label3.backgroundColor = [UIColor clearColor];
//    label3.text =@"3. 科室内动脉采血工具";
//    //设置标签文本字体和字体大小
//    label3.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label3];
////
////    _textField2 = [[UITextField alloc] initWithFrame:CGRectMake(360, 175, 250, 30)];
////    // 设置UITextField的样式
////    _textField2.delegate=self;
////    _textField2.borderStyle = UITextBorderStyleNone;
////    
////    // 文字对齐方式
////    _textField2.textAlignment = NSTextAlignmentCenter;
////    // 文字颜色
////    _textField2.textColor = [UIColor blackColor];
////    // 提示信息内容
////    _textField2.placeholder = @"请输入采血工具";
////    // 字体
////    _textField2.font = [UIFont fontWithName:@"Arial" size:20.0];
////    [_scrollView addSubview: _textField2];
////    
//    UILabel*label4=[[UILabel alloc] initWithFrame:CGRectMake(153, 246, 412 , 48) ];
//    label4.backgroundColor = [UIColor clearColor];
//    label4.text =@"3.1 主要采血工具-注射器（多选）";
//    //设置标签文本字体和字体大小
//    label4.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label4];
//    _cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 320, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb setText:@"A:1ml"];
//    //[_cb setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
//    [_scrollView addSubview:_cb];
//    _cb2 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(280, 320, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb2 setText:@"B:2ml"];
//    //[_cb2 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState2:)];
//    [_scrollView addSubview:_cb2];
//    
//    _cb3 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(460, 320, 288, 50) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb3 setText:@"C:3ml"];
//    //[_cb3 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState3:)];
//    [_scrollView addSubview:_cb3];
//    
//    _cb4 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(640, 320, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb4 setText:@"D:5ml"];
//    //[_cb4 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState4:)];
//    [_scrollView addSubview:_cb4];
//    
//    _cb5 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(820, 320, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb5 setText:@"E:>=10ml"];
//    //[_cb5 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState5:)];
//    [_scrollView addSubview:_cb5];
////
////    
//    UILabel*label5=[[UILabel alloc] initWithFrame:CGRectMake(153, 400, 500 , 48) ];
//    label5.backgroundColor = [UIColor clearColor];
//    label5.text =@"3.2 动脉采血器品牌（多选）";
//    //设置标签文本字体和字体大小
//    label5.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label5];
//
//    _cb6 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 474, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb6 setText:@"A:BD"];
//    //[_cb6 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb6];
//    
//    _cb7 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(280, 474, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb7 setText:@"B:雷度"];
//   // [_cb7 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState7:)];
//    [_scrollView addSubview:_cb7];
//    
//    _cb8 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(460, 474, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb8 setText:@"C:史密斯"];
//    //[_cb8 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState8:)];
//    [_scrollView addSubview:_cb8];
//    
//    _cb9 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(640, 474, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb9 setText:@"D:泰尔茂"];
//    //[_cb9 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState9:)];
//    [_scrollView addSubview:_cb9];
//    
//    _cb10 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(820, 474, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb10 setText:@"E:威世德"];
//    //[_cb10 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState10:)];
//    [_scrollView addSubview:_cb10];
//    
//    _cb11 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 534, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb11 setText:@"F:其他"];
//   // [_cb11 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState11:)];
//    [_scrollView addSubview:_cb11];
//    
//        _textField3 = [[UITextField alloc] initWithFrame:CGRectMake(190, 544, 250, 30)];
//        // 设置UITextField的样式
//        _textField3.delegate=self;
//        _textField3.borderStyle = UITextBorderStyleNone;
//    
//        // 文字对齐方式
//        _textField3.textAlignment = NSTextAlignmentCenter;
//        // 文字颜色
//        _textField3.textColor = [UIColor blackColor];
//        // 提示信息内容
//        _textField3.placeholder = @"请输入品牌名称";
//        // 字体
//        _textField3.font = [UIFont fontWithName:@"Arial" size:20.0];
//        [_scrollView addSubview: _textField3];
//    
//    
//    UILabel*label6=[[UILabel alloc] initWithFrame:CGRectMake(153, 600, 500 , 48) ];
//    label6.backgroundColor = [UIColor clearColor];
//    label6.text =@"4.如有使用动脉导管，导管的品牌（选择题）";
//    //设置标签文本字体和字体大小
//    label6.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label6];
//
//    _cb12 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 674, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb12 setText:@"A:爱德华Edwards-VAMP"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb12];
//    
//    _cb13 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 674, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb13 setText:@"B:爱琅Argon（原BD）"];
//    //[_cb13 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState7:)];
//    [_scrollView addSubview:_cb13];
//    
//    _cb14 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(660, 674, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb14 setText:@"C:雅培Abbott"];
//    //[_cb14 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState8:)];
//    [_scrollView addSubview:_cb14];
//    
//    _cb15 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 734, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb15 setText:@"D: Biosensor"];
//   // [_cb15 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState9:)];
//    [_scrollView addSubview:_cb15];
//    
//    _cb16 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 734, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb16 setText:@"E:威世德"];
//   // [_cb16 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState10:)];
//    [_scrollView addSubview:_cb16];
//    
//    _cb17 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(560, 734, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb17 setText:@"F:非以上请描述"];
//    //[_cb17 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState11:)];
//    [_scrollView addSubview:_cb17];
//    
//    _textField4 = [[UITextField alloc] initWithFrame:CGRectMake(710, 743, 250, 30)];
//    // 设置UITextField的样式
//    _textField4.delegate=self;
//    _textField4.borderStyle = UITextBorderStyleNone;
//    
//    // 文字对齐方式
//    _textField4.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField4.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField4.placeholder = @"请输入品牌名称";
//    // 字体
//    _textField4.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField4];
//    
//    UILabel*label7=[[UILabel alloc] initWithFrame:CGRectMake(153, 800, 500 , 48) ];
//    label7.backgroundColor = [UIColor clearColor];
//    label7.text =@"5.如有使用注射器，润洗注射器时肝素的配置方式:";
//    //设置标签文本字体和字体大小
//    label7.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label7];
//    
//    UILabel*label8=[[UILabel alloc] initWithFrame:CGRectMake(153, 860, 500 , 48) ];
//    label8.backgroundColor = [UIColor clearColor];
//    label8.text =@"5.1 肝素种类";
//    //设置标签文本字体和字体大小
//    label8.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label8];
//    
//    _cb18 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 934, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb18 setText:@"A:肝素钠溶液"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb18];
//    
//    _cb19 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 934, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb19 setText:@"B:肝素锂溶液"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb19];
//    _cb20 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(660, 934, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb20 setText:@"C:冻干肝素+生理盐水"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb20];
//    
//    UILabel*label9=[[UILabel alloc] initWithFrame:CGRectMake(153, 1000, 500 , 48) ];
//    label9.backgroundColor = [UIColor clearColor];
//    label9.text =@"5.2 配置方式";
//    //设置标签文本字体和字体大小
//    label9.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label9];
//    
//    _cb21 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1074, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb21 setText:@"A:如肝素钠/锂溶液"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb21];
//    _cb22 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1074, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb22 setText:@"B:如冻干肝素"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb22];
//    
//    UILabel*label10=[[UILabel alloc] initWithFrame:CGRectMake(153, 1150, 500 , 48) ];
//    label10.backgroundColor = [UIColor clearColor];
//    label10.text =@"5.3 配置频率";
//    //设置标签文本字体和字体大小
//    label10.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label10];
//    
//    _cb23 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1220, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb23 setText:@"A:一次一配"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb23];
//    _cb24 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1220, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb24 setText:@"B:一配多次使用"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb24];
//    _cb25 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(660, 1220, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb25 setText:@"C:其他"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb25];
//    
//    UILabel*label11=[[UILabel alloc] initWithFrame:CGRectMake(153, 1286, 500 , 48) ];
//    label11.backgroundColor = [UIColor clearColor];
//    label11.text =@"6.血气仪品牌";
//    //设置标签文本字体和字体大小
//    label11.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label11];
//    _cb26 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1356, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb26 setText:@"A:雷度"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb26];
//    
//    _cb27 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1356, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb27 setText:@"B:IL(GEM)"];
//    //[_cb13 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState7:)];
//    [_scrollView addSubview:_cb27];
//    
//    _cb28 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(660, 1356, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb28 setText:@"C:罗氏"];
//    //[_cb14 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState8:)];
//    [_scrollView addSubview:_cb28];
//    
//    _cb29 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1410, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb29 setText:@"D:西门子"];
//    // [_cb15 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState9:)];
//    [_scrollView addSubview:_cb29];
//    
//    _cb30 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1410, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb30 setText:@"E: 雅培"];
//    // [_cb16 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState10:)];
//    [_scrollView addSubview:_cb30];
//    
//    _cb31 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(560, 1410, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb31 setText:@"F: 其他"];
//    //[_cb17 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState11:)];
//    [_scrollView addSubview:_cb31];
//    
//    _textField5 = [[UITextField alloc] initWithFrame:CGRectMake(635, 1418, 250, 30)];
//    // 设置UITextField的样式
//    _textField5.delegate=self;
//    _textField5.borderStyle = UITextBorderStyleNone;
//    
//    // 文字对齐方式
//    _textField5.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField5.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField5.placeholder = @"请输入品牌名称";
//    // 字体
//    _textField5.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField5];
//    
//    
//    UILabel*label12=[[UILabel alloc] initWithFrame:CGRectMake(153, 1484, 500 , 48) ];
//    label12.backgroundColor = [UIColor clearColor];
//    label12.text =@"7.血气仪数量（台）";
//    //设置标签文本字体和字体大小
//    label12.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label12];
//    _textField6 = [[UITextField alloc] initWithFrame:CGRectMake(255, 1494, 250, 30)];
//    // 设置UITextField的样式
//    _textField6.delegate=self;
//    _textField6.borderStyle = UITextBorderStyleNone;
//    
//    // 文字对齐方式
//    _textField6.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField6.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField6.placeholder = @"请输入数字";
//    // 字体
//    _textField6.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField6];
//    
//    UILabel*label13=[[UILabel alloc] initWithFrame:CGRectMake(153, 1550, 500 , 48) ];
//    label13.backgroundColor = [UIColor clearColor];
//    label13.text =@"8.每台血气仪每天样本检测量（次）";
//    //设置标签文本字体和字体大小
//    label13.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label13];
//    _textField7 = [[UITextField alloc] initWithFrame:CGRectMake(435, 1560, 250, 30)];
//    // 设置UITextField的样式
//    _textField7.delegate=self;
//    _textField7.borderStyle = UITextBorderStyleNone;
//    
//    // 文字对齐方式
//    _textField7.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField7.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField7.placeholder = @"请输入数字";
//    // 字体
//    _textField7.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField7];
//    
//    
//    UILabel*label14=[[UILabel alloc] initWithFrame:CGRectMake(153, 1626, 500 , 48) ];
//    label14.backgroundColor = [UIColor clearColor];
//    label14.text =@"9.上机地点";
//    //设置标签文本字体和字体大小
//    label14.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label14];
//    _cb32 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1686, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb32 setText:@"A:检验科"];
//    //[_cb12 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState6:)];
//    [_scrollView addSubview:_cb32];
//    
//    _cb33 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1686, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb33 setText:@"B:重症"];
//    //[_cb13 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState7:)];
//    [_scrollView addSubview:_cb33];
//    
//    _cb34 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(660, 1686, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb34 setText:@"C:急诊"];
//    //[_cb14 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState8:)];
//    [_scrollView addSubview:_cb34];
//    
//    _cb35 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1746, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb35 setText:@"D:呼吸"];
//    // [_cb15 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState9:)];
//    [_scrollView addSubview:_cb35];
//    
//    _cb36 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1746, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb36 setText:@"E:麻醉"];
//    // [_cb16 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState10:)];
//    [_scrollView addSubview:_cb36];
//    
//    _cb37 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(560, 1746, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb37 setText:@"F: 其他"];
//    //[_cb17 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState11:)];
//    [_scrollView addSubview:_cb37];
//    
//    _textField8 = [[UITextField alloc] initWithFrame:CGRectMake(635, 1755, 250, 30)];
//    // 设置UITextField的样式
//    _textField8.delegate=self;
//    _textField8.borderStyle = UITextBorderStyleNone;
//    
//    // 文字对齐方式
//    _textField8.textAlignment = NSTextAlignmentCenter;
//    // 文字颜色
//    _textField8.textColor = [UIColor blackColor];
//    // 提示信息内容
//    _textField8.placeholder = @"请输入品牌名称";
//    // 字体
//    _textField8.font = [UIFont fontWithName:@"Arial" size:20.0];
//    [_scrollView addSubview: _textField8];
//    
//    UILabel*label15=[[UILabel alloc] initWithFrame:CGRectMake(153, 1815, 500 , 48) ];
//    label15.backgroundColor = [UIColor clearColor];
//    label15.text =@"10.采血工具";
//    //设置标签文本字体和字体大小
//    label15.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label15];
//    
//    _cb38 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1875, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb38 setText:@"A:注射器"];
//    [_cb38 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState:)];
//    [_scrollView addSubview:_cb38];
//    
//    _cb39 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1875, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb39 setText:@"B:动脉采血器"];
//    [_cb39 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState2:)];
//    [_scrollView addSubview:_cb39];
//
//    
//    UILabel*label16=[[UILabel alloc] initWithFrame:CGRectMake(153, 1935, 500 , 48) ];
//    label16.backgroundColor = [UIColor clearColor];
//    label16.text =@"11.如选注射器，选择规格";
//    //设置标签文本字体和字体大小
//    label16.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label16];
//    
//    _cb40 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 1995, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb40 setText:@"A:1ml"];
//    [_cb40 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState3:)];
//    [_scrollView addSubview:_cb40];
//    _cb40.enabled=NO;
//    
//    _cb41 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 1995, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb41 setText:@"B:2ml"];
//    [_cb41 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState4:)];
//    [_scrollView addSubview:_cb41];
//    _cb41.enabled=NO;
//    
//    UILabel*label17=[[UILabel alloc] initWithFrame:CGRectMake(153, 2055, 500 , 48) ];
//    label17.backgroundColor = [UIColor clearColor];
//    label17.text =@"12.如选动脉采血器，选择品牌";
//    //设置标签文本字体和字体大小
//    label17.font = [UIFont fontWithName:@"Arial" size:20];
//    [_scrollView addSubview:label17];
//    
//    _cb42 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(100, 2115, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb42 setText:@"A:BD"];
//    [_cb42 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState3:)];
//    [_scrollView addSubview:_cb42];
//     _cb42.enabled=NO;
//    
//    _cb43 = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(380, 2115, 288, 55) style:kSSCheckBoxViewStyleMono checked:NO];
//    [_cb43 setText:@"B:雷度"];
//    [_cb43 setStateChangedTarget:self selector:@selector(checkBoxViewChangedState4:)];
//    [_scrollView addSubview:_cb43];
//     _cb43.enabled=NO;
//    
//            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect]; //绘制形状
//            [btn setFrame:CGRectMake(500, 2215, 100, 100)];
//    
//    
//    
//            // 设置标题
//            [btn setTitle:@"完成" forState:UIControlStateNormal];
//            [btn setTintColor:[UIColor blackColor]];
//            btn.titleLabel.font = [UIFont systemFontOfSize: 30.0];
//        [btn addTarget:self action:@selector(pass:) forControlEvents:UIControlEventTouchUpInside];
//    
//             [_scrollView addSubview:btn];
//    
//    
//    [label1 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label2 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label3 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label4 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label5 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label6 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label7 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label8 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label9 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label10 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label11 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label12 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label13 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label14 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label15 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label16 setTextColor:UIColorFromRGB(0x034f9a)];
//    [label17 setTextColor:UIColorFromRGB(0x034f9a)];
//
//
////
////
////        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect]; //绘制形状
////        [btn setFrame:CGRectMake(500, 720, 100, 100)];
////    
////    
////    
////        // 设置标题
////        [btn setTitle:@"完成" forState:UIControlStateNormal];
////        [btn setTintColor:[UIColor blackColor]];
////        btn.titleLabel.font = [UIFont systemFontOfSize: 30.0];
////    [btn addTarget:self action:@selector(pass:) forControlEvents:UIControlEventTouchUpInside];
////    
////         [_scrollView addSubview:btn];
////    
////    UILabel*label6=[[UILabel alloc] initWithFrame:CGRectMake(53, 540, 412 , 48) ];
////    label6.backgroundColor = [UIColor clearColor];
////    label6.text =@"肝素种类:";
////    //设置标签文本字体和字体大小
////    label6.font = [UIFont fontWithName:@"Arial" size:20];
////    [_scrollView addSubview:label6];
////    bgScrollView2 = [[LMContainsLMComboxScrollView alloc]initWithFrame:CGRectMake(155, 550,900, 140)];
////    bgScrollView2.backgroundColor = [UIColor clearColor];
////    bgScrollView2.showsVerticalScrollIndicator = NO;
////    bgScrollView2.showsHorizontalScrollIndicator = NO;
////    [_scrollView addSubview:bgScrollView2];
////    
////    
////    
////    
////    
////    //    NSInteger i=0;
////    comBox2 = [[LMComBoxView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
////    comBox2.backgroundColor = [UIColor clearColor];
////    comBox2.arrowImgName = @"down_dark0.png";
////    _arr12=[[NSMutableArray alloc]initWithObjects:@"肝素钠溶液",@"肝素锂溶液",@"冻干肝素+生理盐水",nil];
////    _gansuType=@"肝素钠溶液";
////    comBox2.titlesList = _arr12;
////    comBox2.delegate = self;
////    comBox2.supView = bgScrollView2;
////    [comBox2 defaultSettings];
////    comBox2.tag = kDropDownListTag + 1;
////    [bgScrollView2 addSubview:comBox2];
////    
////    UILabel*label7=[[UILabel alloc] initWithFrame:CGRectMake(363, 540, 412 , 48) ];
////    label7.backgroundColor = [UIColor clearColor];
////    label7.text =@"配置方式:";
////    //设置标签文本字体和字体大小
////    label7.font = [UIFont fontWithName:@"Arial" size:20];
////    [_scrollView addSubview:label7];
////  
////    comBox3 = [[LMComBoxView alloc]initWithFrame:CGRectMake(300, 0, 200, 30)];
////    comBox3.backgroundColor = [UIColor clearColor];
////    comBox3.arrowImgName = @"down_dark0.png";
////    _arr13=[[NSMutableArray alloc]initWithObjects:@"肝素钠/锂溶液",@"冻干肝素",nil];
////    _fangshi=@"肝素钠/锂溶液";
////    comBox3.titlesList = _arr13;
////    comBox3.delegate = self;
////    comBox3.supView = bgScrollView2;
////    [comBox3 defaultSettings];
////    comBox3.tag = kDropDownListTag + 2;
////    [bgScrollView2 addSubview:comBox3];
////    
////    UILabel*label8=[[UILabel alloc] initWithFrame:CGRectMake(663, 540, 412 , 48) ];
////    label8.backgroundColor = [UIColor clearColor];
////    label8.text =@"配置方式:";
////    //设置标签文本字体和字体大小
////    label8.font = [UIFont fontWithName:@"Arial" size:20];
////    [_scrollView addSubview:label8];
////    
////    comBox4 = [[LMComBoxView alloc]initWithFrame:CGRectMake(600, 0, 200, 30)];
////    comBox4.backgroundColor = [UIColor clearColor];
////    comBox4.arrowImgName = @"down_dark0.png";
////    _arr14=[[NSMutableArray alloc]initWithObjects:@"一次一配",@"一配多次使用",nil];
////    _pinglv=@"一次一配";
////    comBox4.titlesList = _arr14;
////    comBox4.delegate = self;
////    comBox4.supView = bgScrollView2;
////    [comBox4 defaultSettings];
////    comBox4.tag = kDropDownListTag + 3;
////    [bgScrollView2 addSubview:comBox4];
//
//
//}
//    NSArray * arr1 = @[@1,@2,@3];
//
//-(void)pass:(id)sender{
//    
//    if (_cb.checked==NO&&_cb2.checked==NO&&_cb3.checked==NO&&_cb4.checked==NO&&_cb5.checked==NO&&_cb6.checked==NO&&_cb7.checked==NO&&_cb8.checked==NO) {
//        NSLog(@"没选择");
//        
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        _hud.labelText = @"您还有题目没有完成";
//        _hud.labelFont = [UIFont systemFontOfSize:17];
//        _hud.labelColor = color; //设置文本颜色；默认为白色
//        _hud.detailsLabelText = @"^_^";
//        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//        [self.view addSubview:_hud];
//        
//        [_hud showAnimated:YES
//       whileExecutingBlock:^{
//           [self taskOfText];
//       } completionBlock:^{
//           NSLog(@"showHUDByText 执行完成");
//       }];
//        
//        //        [user removeObjectForKey:@"array"];
//        //
//        //        [user synchronize];
//        return;
//    }
//    if ( _textField.text.length<=0||_textField2.text.length<=0) {
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        _hud.labelText = @"您还有题目没有完成";
//        _hud.labelFont = [UIFont systemFontOfSize:17];
//        _hud.labelColor = color; //设置文本颜色；默认为白色
//        _hud.detailsLabelText = @"^_^";
//        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//        [self.view addSubview:_hud];
//        
//        [_hud showAnimated:YES
//       whileExecutingBlock:^{
//           [self taskOfText];
//       } completionBlock:^{
//           NSLog(@"showHUDByText 执行完成");
//       }];
//        return;
//        
//    }
//
//    else{
//    
//    
//    
//        if (_cb.checked==YES) {
//            _xuanze1=@"A";
//           
//        }
//        else if (_cb2.checked==YES){
//            
//            _xuanze1=@"B";
//            
//        }
//        else if (_cb3.checked==YES){
//            
//            _xuanze1=@"C";
//            
//        }
//        else if (_cb4.checked==YES){
//            
//            _xuanze1=@"D";
//            
//        }
//        
//        else if (_cb5.checked==YES){
//            
//           _xuanze1=@"E";
//            
//        }
//         if (_cb6.checked==YES){
//            
//            _xuanze2=@"A";
//            
//        }
//
//        else if (_cb7.checked==YES){
//            
//            _xuanze2=@"B";
//            
//        }
//
//        else if (_cb8.checked==YES){
//            
//            _xuanze2=@"C";
//            
//        }
//
//    
//        
//        NSDictionary *parameters =@{@"keshi":_keshi,@"type":_gansuType,@"fangshi":_fangshi,@"pinglv":_pinglv,@"chuangwei":_textField.text,@"gongju":_textField2.text,@"choose1":_xuanze1,@"choose2":_xuanze2,@"bianhao":_bianhao};
//        
//        NSLog(@"parameters=%@",parameters);
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//        if ([[user objectForKey:@"wenjuan"]count]==0) {
//            _arr2=[NSMutableArray arrayWithObject:parameters];
//            
//            NSArray*arr1=[NSArray arrayWithArray:_arr2];
//            [user setObject:arr1 forKey:@"wenjuan"];
//            [user synchronize];
//            NSLog(@"111111%@,222222222%@",_arr2,arr1);
//            
//        }
//        
//        else{
//           // _arr2=[NSMutableArray arrayWithObjects:parameters,[user objectForKey:@"wenjuan"], nil];
//            _arr2=[NSMutableArray arrayWithObject:parameters];
//            [_arr2 addObjectsFromArray:[user objectForKey:@"wenjuan"]];
//            
//            
//            NSArray*arr1=[NSArray arrayWithArray:_arr2];
//            [user setObject:arr1 forKey:@"wenjuan"];
//            [user synchronize];
//            NSLog(@"111111%@,222222%@",_arr2,arr1);
//           
//
//        
//        }
//        UIColor *color = [UIColor cyanColor];
//        
//        _hud = [[MBProgressHUD alloc] initWithView:self.view];
//        _hud.mode = MBProgressHUDModeText;
//        _hud.labelText = @"已完成问卷";
//        _hud.labelFont = [UIFont systemFontOfSize:17];
//        _hud.labelColor = color; //设置文本颜色；默认为白色
//        _hud.detailsLabelText = @"^_^";
//        _hud.detailsLabelFont = [UIFont systemFontOfSize:14];
//        _hud.detailsLabelColor = color; //设置详细文本颜色；默认为白色
//        [self.view addSubview:_hud];
//        
//        [_hud showAnimated:YES
//       whileExecutingBlock:^{
//           [self taskOfText];
//       } completionBlock:^{
//           NSLog(@"showHUDByText 执行完成");
//       }];
//
//   // [self performSegueWithIdentifier:@"go" sender:self];
//        [self.navigationController popViewControllerAnimated:YES];
//    }
//    
//
//
//
//}
//-(void)checkBoxViewChangedState:(SSCheckBoxView*)cbv
//{
//    
////    _cb3.checked=NO;
////    _cb2.checked=NO;
////    _cb4.checked=NO;
////    _cb5.checked=NO;
//    // _cb6.checked=NO;
//   
//    _cb39.checked=NO;
//    
//    if (_cb39.checked==NO) {
//        _cb42.enabled=NO;
//        _cb43.enabled=NO;
//    }
//    
//    if (_cb38.checked==YES) {
//        _cb40.enabled=YES;
//        _cb41.enabled=YES;
//    }
//    else{
//        _cb40.enabled=NO;
//        _cb41.enabled=NO;
//    
//    }
//    
//    
//    
//    
//    
//    
//}
-(void)checkBoxViewChangedState2:(SSCheckBoxView*)cbv
{
    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb3.checked=NO;
//    _cb.checked=NO;
//    _cb4.checked=NO;
//    _cb5.checked=NO;
    //_cb6.checked=NO;
    
//    _cb38.checked=NO;
//    if (_cb38.checked==NO) {
//        _cb40.enabled=NO;
//        _cb41.enabled=NO;
//    }
//    if (_cb39.checked==YES) {
//        _cb42.enabled=YES;
//        _cb43.enabled=YES;
//    }
//    else{
//        _cb42.enabled=NO;
//        _cb43.enabled=NO;
//        
//    }
    
    
}
-(void)checkBoxViewChangedState3:(SSCheckBoxView*)cbv
{
    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb.checked=NO;
//    _cb2.checked=NO;
//    _cb4.checked=NO;
//    _cb5.checked=NO;
    //_cb6.checked=NO;
    
}
-(void)checkBoxViewChangedState4:(SSCheckBoxView*)cbv
{
    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb3.checked=NO;
//    _cb2.checked=NO;
//    _cb.checked=NO;
//    _cb5.checked=NO;
    //_cb6.checked=NO;
    
    
}
//-(void)checkBoxViewChangedState5:(SSCheckBoxView*)cbv
//{
//    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
////    _cb3.checked=NO;
////    _cb2.checked=NO;
////    _cb4.checked=NO;
////    _cb.checked=NO;
//    //_cb6.checked=NO;
//    
//    
//}
//-(void)checkBoxViewChangedState6:(SSCheckBoxView*)cbv
//{
//    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb7.checked=NO;
//    _cb8.checked=NO;
//  
//    
//    
//}
//-(void)checkBoxViewChangedState7:(SSCheckBoxView*)cbv
//{
//    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb6.checked=NO;
//    _cb8.checked=NO;
//    
//    
//    
//}
//-(void)checkBoxViewChangedState8:(SSCheckBoxView*)cbv
//{
//    //NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
//    _cb7.checked=NO;
//    _cb6.checked=NO;
//    
//    
//    
//}

//-(void)selectAtIndex:(int)index inCombox:(LMComBoxView *)_combox{
//    
//    NSLog(@"%ld",(long)_combox.tag);
//    if (_combox.tag==1000) {
//         _keshi=[_arr11 objectAtIndex:index];
//    }
//    else if(_combox.tag==1001){
//   
//    _gansuType=[_arr12 objectAtIndex:index];
//    }
//    else if(_combox.tag==1002){
//        
//        _fangshi=[_arr13 objectAtIndex:index];
//    }
//    else{
//        _pinglv=[_arr14 objectAtIndex:index];
//
//    
//    }
//    NSLog(@"%@",_keshi);
//   
//}
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

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    if (textField==_textField) {
//        
//        return [self validateNumber:string];
//    }
//    return YES;
//
//}
//
//- (BOOL)validateNumber:(NSString*)number {
//    BOOL res = YES;
//    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
//    int i = 0;
//    while (i < number.length) {
//        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
//        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
//        if (range.length == 0) {
//            res = NO;
//            break;
//        }
//        i++;
//    }
//    return res;
//}
//点击屏幕，让键盘弹回
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //[self.scrollView endEditing:YES];
    [self.view endEditing:YES];
}

- (void)taskOfText {
    [self taskOfIndeterminate];
}
- (void)taskOfIndeterminate {
    sleep(2); //进程挂起3秒，这里仅仅是模拟，相当于执行了一些操作耗时3秒；sleep 和 usleep 都是进程挂起操作方法，他们的精准度不同，所以按需使用；对于一般秒级别操作，就使用 sleep 方法
}


@end
