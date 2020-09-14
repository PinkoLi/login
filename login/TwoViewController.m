//
//  TwoViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/2.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TwoViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "ThreeViewController.h"

@interface TwoViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic)bool isFullScreen;
@property(nonatomic,strong)ThreeViewController*three;
@end
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
@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"hhhhhhh");
   // self.view.backgroundColor=[UIColor whiteColor];
   
    NSMutableArray * array =[[NSMutableArray alloc]initWithArray:self.navigationController.viewControllers];
    NSLog(@"%@",array);
    
//    CGRect backframe = CGRectMake(0,0,54,30);
//    
//    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
//    
//    
//    [backButton setTitle:@"返回" forState:UIControlStateNormal];
//    
//    backButton.titleLabel.font=[UIFont systemFontOfSize:13];
//    
//    [backButton addTarget:self action:@selector(doClickBackAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    
//    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    
//
//    
//    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
       //删除最后一个，也就是自己
    //self.navigationController.view.backgroundColor=[UIColor clearColor];
    
      NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    NSLog(@"%@",[choose objectForKey:@"choose"]);
    
    
    _chooseArray1=[[NSMutableArray alloc] init];
    
    _view1.layer.masksToBounds = YES;
    _view1.layer.cornerRadius = 4.0;
    _view1.layer.borderWidth = 1.0;
    _view1.layer.borderColor = [[UIColor clearColor] CGColor];
    _view2.layer.masksToBounds = YES;
    _view2.layer.cornerRadius = 6.0;
    _view2.layer.borderWidth = 1.0;
    _view2.layer.borderColor = [[UIColor clearColor] CGColor];
    _view3.layer.masksToBounds = YES;
    _view3.layer.cornerRadius = 4.0;
    _view3.layer.borderWidth = 1.0;
    _view3.layer.borderColor = [[UIColor clearColor] CGColor];

   
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
    
  
    
    _text1.enabled = NO;
    
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
       _lb1.text=@"4、If any arterial catheter was used, the catheter brand was (multiple choice) ";
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"Edwards-VAMP",@"Argon (originally BD)",@"Abbott",@"Biosensor",@"Smith",@"If none of the above,please specify",nil];
        
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];

    }
    else{
         [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
    
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"爱德华Edwards-VAMP",@"爱琅Argon（原BD）",@"雅培Abbott",@"Biosensor",@"史密斯Smith ",@"非以上，请描述",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB1"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
    }

    
    
#pragma 第一个问题
    
   
    
    
   
    

    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y-200, Button_Width+150, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change4:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }

    

}

-(void)change4:(SSCheckBoxView*)cbv{
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn.checked=NO;
    }
    _tmpBtn= cbv;
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_oneArray lastObject]]) {
        _text1.enabled = YES;
    }
    else if (cbv.checked==NO&&[cbv.textLabel.text isEqualToString:[_oneArray lastObject]]){
        
        _text1.enabled = NO;
        _text1.text=@"";
    }
    else{
    
        _text1.text=@"";

    }
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

- (void)doClickBackAction:(id)sender {

    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextBtn:(id)sender {
    
    
    int isok1=0;
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSString*str=[[NSString alloc] init];
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1&&![pp.textLabel.text isEqualToString:[_oneArray lastObject]])
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            _chooseStr=pp.textLabel.text;
            
        }
        
        if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray lastObject]]) {
            
            isok1=1;
             _chooseStr=pp.textLabel.text;
            str=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text1.text];
            [Q1 addObject:str];
        }
    }
    if (isok1==1) {
        if ([_chooseStr isEqualToString:[_oneArray lastObject]]) {
            if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                isok1=0;
            }
        }
    }

    if (isok1==100) {
        
        
        //||_radioGroup1.sValue==nil||_radioGroup2.sValue==nil||_radioGroup3.sValue==nil||_radioGroup4.sValue==nil||_radioGroup5.sValue==nil||_radioGroup6.sValue==nil
        
        //NSLog(@"%@",);
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"请填写完整" message:@"请选择对应的选项" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
            [alert show];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Please complete the form" message:@"Please select the option" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

        
        
    }
    else{
        
        NSLog(@"%@",Q1);
        
          NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
        
        NSDictionary *q4 =@{@"choose":Q1};
       
        
        NSDictionary*num4=@{@"4":q4};
        
        
       
      
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"4"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
           

            
            
            
        }
        
        [lex removeObjectsInArray:discardedItems];
        NSLog(@"%@",lex);
        NSArray*arr2=[NSArray arrayWithArray:lex];
        [choose setObject:arr2 forKey:@"choose"];
        [choose synchronize];
        
        
        
        
        NSMutableArray*arr=[NSMutableArray arrayWithObjects:num4,nil];
        
        [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
        
        
        NSArray*arr1=[NSArray arrayWithArray:arr];
        [choose setObject:arr1 forKey:@"choose"];
        [choose synchronize];
        NSLog(@"111111111111111%@",arr);

        
        if (!_three) {
            
            _three= [self.storyboard instantiateViewControllerWithIdentifier:@"threePage"];
        }
        
        
        
        [self.navigationController pushViewController:_three animated:YES];
    
    
//    TwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"threePage"];
//    
//    [self.navigationController pushViewController:receive animated:YES];
        
        
    }
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    //设置视图移动的位移
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version<8.0){
        if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-220 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}
//在UITextField 编辑完成调用方法
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //设置动画的名字
    [UIView beginAnimations:@"Animation" context:nil];
    //设置动画的间隔时间
    [UIView setAnimationDuration:0.20];
    //??使用当前正在运行的状态开始下一段动画
    [UIView setAnimationBeginsFromCurrentState: YES];
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if(version<8.0){
        if(self.interfaceOrientation==UIDeviceOrientationLandscapeLeft){
            self.view.frame = CGRectMake(self.view.frame.origin.x-215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
            
        }  else{
            self.view.frame = CGRectMake(self.view.frame.origin.x+215, self.view.frame.origin.y , self.view.frame.size.width, self.view.frame.size.height);
        }
        
    }
    else{
        
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y+220 , self.view.frame.size.width, self.view.frame.size.height);
    }
    //设置动画结束
    [UIView commitAnimations];
}

- (IBAction)takePhoto:(id)sender {
    
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    if (!isCamera) { //若不可用，弹出警告框
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"无可用摄像头" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    /**
     *      UIImagePickerControllerSourceTypePhotoLibrary  ->所有资源文件夹
     UIImagePickerControllerSourceTypeCamera        ->摄像头
     UIImagePickerControllerSourceTypeSavedPhotosAlbum ->内置相册
     */
    imagePicker.delegate = self;    //设置代理，遵循UINavigationControllerDelegate,UIImagePickerControllerDelegate协议
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(NSString *)getImageSavePath{
    //获取存放的照片
    //获取Documents文件夹目录
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    
    
//    NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//    NSString*photoName=[NSString stringWithFormat:@"%ld",[[photoList objectForKey:@"photoList"] integerValue]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddHHmmss";
    NSString *date = [formatter stringFromDate:[NSDate date]];
    NSString*str=[[@"4_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [path objectAtIndex:0];
    
    NSString*numberStr=[NSString stringWithFormat:@"%@",[number objectForKey:@"number"]];
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    NSString *createPath = [[NSString stringWithFormat:@"%@/",documentPath] stringByAppendingString:numberStr];
    if (![[NSFileManager defaultManager]fileExistsAtPath:createPath]) {
        
        [fileManager createDirectoryAtPath:createPath withIntermediateDirectories:YES attributes:nil error:nil];
        
    }else{
        NSLog(@"有这个文件了");
    }
    
    //指定新建文件夹路径
    NSString *imageDocPath = [createPath stringByAppendingPathComponent:str];
    
    
    
    return imageDocPath;
}

-(void)initData{
    //指定新建文件夹路径
    NSString *imageDocPath = [self getImageSavePath];
    //创建ImageFile文件夹
    [[NSFileManager defaultManager] createDirectoryAtPath:imageDocPath withIntermediateDirectories:YES attributes:nil error:nil];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    /* 此处info 有六个值
     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
     * UIImagePickerControllerMediaURL;       // an NSURL
     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
     */
    // 保存图片至本地，方法见下文
    NSString *imageDocPath = [self getImageSavePath];
    NSLog(@"%@",imageDocPath);
    
    
    //以下是保存文件到Document路径下
    //把图片转成NSData类型的数据来保存文件
    NSData *data = nil;
    //判断图片是不是png格式的文件
//    if (UIImagePNGRepresentation(image)) {
//        //返回为png图像。
//        data = UIImagePNGRepresentation(image);
//    }else {
//        //返回为JPEG图像。
        data = UIImageJPEGRepresentation(image, 0.1);
//    }
    //保存
    [[NSFileManager defaultManager] createFileAtPath:imageDocPath contents:data attributes:nil];
    
    _isFullScreen = NO;
    // [_img1 setImage:savedImage];
    [_img1 setImage: [UIImage imageWithData:data]];
    _img1.tag = 100;
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

//#pragma mark - 保存图片至沙盒
//- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
//{
//    
//    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
//    // 获取沙盒目录
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
//    // 将图片写入文件
//    
//    [imageData writeToFile:fullPath atomically:NO];
//}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    _isFullScreen = !_isFullScreen;
    UITouch *touch = [touches anyObject];
    
    CGPoint touchPoint = [touch locationInView:_view2];
    
    CGPoint imagePoint = _img1.frame.origin;
    //touchPoint.x ，touchPoint.y 就是触点的坐标
    
    // 触点在imageView内，点击imageView时 放大,再次点击时缩小
    if(imagePoint.x <= touchPoint.x && imagePoint.x +_img1.frame.size.width >=touchPoint.x && imagePoint.y <=  touchPoint.y && imagePoint.y+_img1.frame.size.height >= touchPoint.y)
    {
        // 设置图片放大动画
        [UIView beginAnimations:nil context:nil];
        // 动画时间
        [UIView setAnimationDuration:1];
        
        if (_isFullScreen) {
            // 放大尺寸
            
            _img1.frame = CGRectMake(50, 0, 800, 480);
        }
        else {
            // 缩小尺寸
            _img1.frame = CGRectMake(814, 27, 50, 50);
        }
        
        // commit动画
        [UIView commitAnimations];
        
    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        TwoViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
        [self.navigationController pushViewController:receive animated:YES];
    }
    else{
        
        _seg.selectedSegmentIndex=0;
    }
}


- (IBAction)seg:(id)sender {
    
    NSInteger Index = _seg.selectedSegmentIndex;
    
    if (Index == 0) {
        NSLog(@"1");
    }else if (Index == 1){
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"如切换调查问卷，所有答案将被清空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
            [alertView show];
          
        }else{
            
            UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"tip" message:@"If you switch the questionnaire, all answers will be cleared" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
            [alertView show];
           
        }

        
    }
    
}
@end
