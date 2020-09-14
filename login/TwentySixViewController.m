//
//  TwentySixViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/4.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TwentySixViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
@interface TwentySixViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;

@property(nonatomic)bool isFullScreen;
@property(nonatomic,assign)int a;
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
@implementation TwentySixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
    _keshi.text=[keshi objectForKey:@"keshi"];
    _text1.delegate=self;

    _a=0;
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
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb3 setTextColor:UIColorFromRGB(0x034f9a)];
   
    
    
  
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];

    
       
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
          _uilb.text = @" Please enter a supplementary note ...";
        
        _lb1.text=@"63、Was the arterial blood transferred to other containers / tubes after blood collection?";
        _lb2.text=@"64、Evaluation of and supplementary notes to this arterial blood draw:________ (optional)";
        
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];

        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"英文3"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
        
        UIBarButtonItem *backbutton = [[UIBarButtonItem alloc]init];
        backbutton.title = @"Return";
        self.navigationItem.backBarButtonItem = backbutton;
        [_seg setTitle:@"Within-department survey" forSegmentAtIndex:0];
        [_seg setTitle:@"Laboratory survey" forSegmentAtIndex:1];
    }
    else{
        
         _uilb.text = @"请输入补充说明...";
         [_photoBtn setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
        [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];

        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"否",@"淤青",@"皮下血肿",@"出血",@"动脉血管痉挛",@"局部感染",@"血栓",@"假性动脉瘤",@"其他",nil];

        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"TAB3"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
    }
    

#pragma 第一个问题
    
    
    
    
    
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        //        NSInteger index = i % 3;
        //        NSInteger page = i / 3;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-250, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change63:)];
        
        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    #pragma 第二个问题
    
    
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        NSInteger index = i % 5;
        NSInteger page = i / 5;
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space-120) + Start_X,  page*(Button_Height + Height_Space+20)+Start_Y-80, Button_Width-50, Button_Height) style:kSSCheckBoxViewStyleBox checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change64:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        [_view2 addSubview:_text1];

        
        
        
        
        
        
    }
    _uilb.enabled = NO;//lable必须设置为不可用

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)change63:(SSCheckBoxView*)cbv{
    
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

}
-(void)change64:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
//    if(_tmpBtn2== cbv) {
//        //上次点击过的按钮，不做处理
//    } else{
//        //本次点击的按钮设为红色
//        cbv.checked=YES;
//        //将上次点击过的按钮设为黑色
//        _tmpBtn2.checked=NO;
//    }
//    _tmpBtn2= cbv;
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]) {
        _text1.enabled = YES;
    }
    else if (cbv.checked==NO&&[cbv.textLabel.text isEqualToString:[_twoArray lastObject]]){
        
        _text1.enabled = NO;
        _text1.text=@"";
    }
    else{
        
        _text1.text=@"";
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)nextBtn:(id)sender {
    
    int isok1=0;
    int isok2=0;

  
    
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSString*str=[[NSString alloc] init];
    NSString*str2=[[NSString alloc] init];



    
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok1=1;
            [Q1 addObject:pp.textLabel.text];
            
        }
    }
    for(int i=0;i<[_chooseArray2 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
        
//        if(pp.checked==1)
//        {
//
//            isok2=1;
//            [Q2 addObject:pp.textLabel.text];
//
//        }
        if(pp.checked==1&&![pp.textLabel.text isEqualToString:[_twoArray lastObject]])
               {
                   
                   
                   
                   isok2=1;
                   [Q2 addObject:pp.textLabel.text];
                   str2=pp.textLabel.text;
                   
                   
               }
               
               else if (pp.checked==1&&[pp.textLabel.text isEqualToString:[_twoArray lastObject]]) {
                   
                   isok2=1;
                   
                   str=[[pp.textLabel.text stringByAppendingString:@"(" ] stringByAppendingString:_text1.text];
                   [Q2 addObject:str];
                   str2=pp.textLabel.text;

               }
    }
    
    if (isok2==1) {
           if ([str2 isEqualToString:[_twoArray lastObject]]) {
               if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                   isok2=0;
               }
           }
       }
    
  
    if (!isok1||!isok2) {
        
        
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
        
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *keshi = [NSUserDefaults standardUserDefaults];
        NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
        
        
        NSUserDefaults *choose = [NSUserDefaults standardUserDefaults];
        
        
         NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q7 =@{@"choose":Q2};

         NSDictionary *q2 =@{@"text":_textView.text};
//        NSDictionary *q3 =@{@"name":[user objectForKey:@"name"]};
       // NSDictionary *q4 =@{@"keshi":[keshi objectForKey:@"keshi"]};
//        NSDictionary *q5 =@{@"number":[number objectForKey:@"number"]};
        
        
        
       
      
        NSString*b=[self shuffledAlphabet];
        //NSDictionary *q6 =@{@"pid":b};
        
        NSDictionary*num1=@{@"63":q1};
        NSDictionary*num2=@{@"64":q7};
        NSDictionary*num7=@{@"65":q2};
//        NSDictionary*num3=@{@"name":q3};
   //     NSDictionary*num4=@{@"keshi":q4};
//        NSDictionary*num5=@{@"number":q5};
//        NSDictionary*num6=@{@"pid":q6};
        
        
        
        
        NSMutableArray*lex=[NSMutableArray arrayWithArray:[choose objectForKey:@"choose"]];
        
        
        
        
        NSLog(@"%@",[choose objectForKey:@"choose"]);
        NSMutableArray *discardedItems = [NSMutableArray array];
        
        for (NSDictionary*kk in lex) {
            
            if ([kk objectForKey:@"63"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"64"]) {
                
                NSLog(@"%@",kk);
                
                [discardedItems addObject:kk];
                
            }
            if ([kk objectForKey:@"65"]) {
                           
                           NSLog(@"%@",kk);
                           
                           [discardedItems addObject:kk];
                           
                       }
            
            
            
            
            
        }
        
        [lex removeObjectsInArray:discardedItems];
        NSLog(@"%@",lex);
        NSArray*arr2=[NSArray arrayWithArray:lex];
        [choose setObject:arr2 forKey:@"choose"];
        [choose synchronize];
        
       
        
        
        NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2,num7,nil];
        
        [arr addObjectsFromArray:[choose objectForKey:@"choose"]];
        
        
        
        
    
        
        
        
        
        
        
        NSArray*arr1=[NSArray arrayWithArray:arr];
        [choose setObject:arr1 forKey:@"choose"];
        [choose synchronize];
        NSLog(@"111111111111111%@",arr);
        
        
       

      //  [user removeObjectForKey:@"diaoyan"];
        
        
        
//        NSArray*department=[user objectForKey:@"diaoyan"];
//         NSMutableArray* allArr=[NSMutableArray new];
//        [allArr addObject:department];
//        NSArray*department2=[NSArray arrayWithArray:allArr];
//        [user setObject:department2 forKey:@"diaoyan"];
        
        
        
        
        
        
        
        if ([[user objectForKey:@"diaoyan"]count]==0) {
//            NSMutableArray* allArr=[NSMutableArray arrayWithObjects:arr,nil];
//              NSMutableArray* allArr2=[NSMutableArray arrayWithObject:allArr];
//
//             NSArray*arr=[NSArray arrayWithArray:allArr2];
//           // NSArray*arr=[NSArray arrayWithArray:[choose objectForKey:@"choose"]];
//            [user setObject:arr forKey:@"diaoyan"];
//            [choose removeObjectForKey:@"choose"];
//            [user synchronize];
//            [choose synchronize];
//
//            NSLog(@"%@",arr);
            
            
//                NSMutableArray* allArr=[NSMutableArray new];
//                [allArr addObject:arr1];
//                [allArr addObject:arr1];
//
//
//                NSArray* kkk=[NSArray arrayWithArray:allArr];
//
            
            
            
                NSString*local=@"0";
                NSString*userid=[user objectForKey:@"userid"];
            NSDictionary*data=@{@"number":[number objectForKey:@"number"],@"keshi":[keshi objectForKey:@"keshi"],@"uino":b,@"local":local,@"userid":userid,@"survey_data":arr1};
            
               // NSArray*department=[user objectForKey:@"diaoyan"];
                 NSMutableArray* allArr=[NSMutableArray new];
               // [allArr addObject:department];
                [allArr addObject:data];
                NSArray*department2=[NSArray arrayWithArray:allArr];
                [user setObject:department2 forKey:@"diaoyan"];
            

            
                [choose removeObjectForKey:@"choose"];
                [user synchronize];
                [choose synchronize];

            
            
           
        }
        
        else{
            
            
//          NSMutableArray* allArr=[NSMutableArray arrayWithObjects:arr,nil];
//
//            NSMutableArray* allArr2=[NSMutableArray arrayWithObject:allArr];
//
//            NSLog(@"%@",allArr);
//
//            [allArr2 addObjectsFromArray:[user objectForKey:@"diaoyan"]];
//
//
//
//            NSArray*arr=[NSArray arrayWithArray:allArr2];
//            [user setObject:arr forKey:@"diaoyan"];
//             [choose removeObjectForKey:@"choose"];
//            [user synchronize];
//             [choose synchronize];
//            NSLog(@"%@",arr);
//            NSMutableArray* allArr=[NSMutableArray new];
//                           [allArr addObject:arr1];
//            [allArr addObject:arr1];
//
//            NSArray* kkk=[NSArray arrayWithArray:allArr];

            
            NSString*local=@"0";
            NSString*userid=[user objectForKey:@"userid"];
            NSDictionary*data=@{@"number":[number objectForKey:@"number"],@"keshi":[keshi objectForKey:@"keshi"],@"uino":b,@"local":local,@"userid":userid,@"survey_data":arr1};
             NSArray*department=[user objectForKey:@"diaoyan"];
                            NSMutableArray* allArr=[NSMutableArray new];
                           [allArr addObjectsFromArray:department];
                           [allArr addObject:data];
                           NSArray*department2=[NSArray arrayWithArray:allArr];
                           [user setObject:department2 forKey:@"diaoyan"];
            [choose removeObjectForKey:@"choose"];
            [user synchronize];
            [choose synchronize];

            
            
          
            
            
        }
        
        

        
        TwentySixViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"listPage"];
        
        [self.navigationController pushViewController:receive animated:YES];
    }
    
}


- (NSString *)shuffledAlphabet {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform(numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    return result;
}


- (IBAction)takePhoto2:(id)sender {
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
    _a=1;
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
       _a=0;
  
}


-(NSString *)getImageSavePath{
    //获取存放的照片
    //获取Documents文件夹目录
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    
    if (_a==0) {
//        NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//        NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList"] integerValue]];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *date = [formatter stringFromDate:[NSDate date]];
        
        _str=[[@"63_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    }
        else{
//            NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
//            NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList"] integerValue]];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *date = [formatter stringFromDate:[NSDate date]];
            
            _str=[[@"64_" stringByAppendingString:date] stringByAppendingString:@".jpg"];
    }
    
    
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
    NSString *imageDocPath = [createPath stringByAppendingPathComponent:_str];
    
    
    
    return imageDocPath;
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
    if (_a==0) {
        [_img1 setImage:[UIImage imageWithData:data]];
    }
       else{
        [_img2 setImage:[UIImage imageWithData:data]];
    }
    _img1.tag = 100;
    _img2.tag=101;
   

    
    
    
    
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}




- (void)textViewDidBeginEditing:(UITextView *)textView
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
- (void)textViewDidEndEditing:(UITextView *)textView
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        TwentySixViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"FourPage"];
        
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

-(void)textViewDidChange:(UITextView *)textView
{
  
    if (_textView.text.length == 0) {
        
        
    }else{
        _uilb.text = @"";
    }
}
@end
