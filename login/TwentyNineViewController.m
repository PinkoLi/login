//
//  TwentyNineViewController.m
//  login
//
//  Created by 茶茶漾 on 16/10/6.
//  Copyright © 2016年 茶茶漾. All rights reserved.
//

#import "TwentyNineViewController.h"
#import "MBProgressHUD.h"
#import "SSCheckBoxView.h"
#import "ThirtyViewController.h"
@interface TwentyNineViewController ()
@property(nonatomic,strong)SSCheckBoxView *tmpBtn;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn2;
@property(nonatomic,strong)SSCheckBoxView *tmpBtn3;
@property(nonatomic)bool isFullScreen;
@property(nonatomic,assign)NSInteger a;
@property(nonatomic,assign)NSInteger add;
@property(nonatomic,strong)ThirtyViewController*thirty;


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

@implementation TwentyNineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _seg.selectedSegmentIndex=1;
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
    
    //[_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
    [_lb1 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb2 setTextColor:UIColorFromRGB(0x034f9a)];
    [_lb3 setTextColor:UIColorFromRGB(0x034f9a)];
    

    
    
    
    _chooseArray1=[[NSMutableArray alloc] init];
    _chooseArray2=[[NSMutableArray alloc] init];
    _chooseArray3=[[NSMutableArray alloc] init];
    
    
    [_view2 bringSubviewToFront:_text1];
    [_view2 bringSubviewToFront:_text2];
    [_view2 bringSubviewToFront:_text3];
    [_view2 bringSubviewToFront:_text4];

    
    [_text1 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text2 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text3 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_text4 addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    if ([user objectForKey:@"english"]) {
        
        _lb1.text=@"68、Time samples loaded for testing:";
        _lb2.text=@"69、If the samples were submitted within a period of time ≥30 minutes after collection, were the samples preserved in a low-temperature ice bath (ice-water mixture)?";
        _lb2.lineBreakMode = UILineBreakModeWordWrap;
        _lb2.numberOfLines = 0;
        _lb3.text=@"70、If \"ice bath\", were the ice cubes in immediate contact with the samples? ";
        
        
        [_photoBtn setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
         [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照英文.png"] forState:UIControlStateNormal];
        
        
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
        _threeArray=[[NSMutableArray alloc] initWithObjects:@"YES",@"NO",nil];
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"Total number of samples randomly inspected",@"≤15minutes",@"15-30minutes",@"≥30minutes",nil];
        [_next setImage:[UIImage imageNamed:@"继续答题英文.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"采血耗材-检测仪器"ofType:@"png"];
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
         [_photoBtn2 setImage:[UIImage imageNamed:@"建议拍照.png"] forState:UIControlStateNormal];
        
        _twoArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        
        _threeArray=[[NSMutableArray alloc] initWithObjects:@"是",@"否",nil];
        
        _oneArray=[[NSMutableArray alloc] initWithObjects:@"抽查样本总数",@"≤15分钟",@"15-30分钟",@"≥30分钟",nil];
        
        [_next setImage:[UIImage imageNamed:@"继续答题.png"] forState:UIControlStateNormal];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"采血耗材-检测仪器"ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _view1.layer.contents = (id)image.CGImage;
    }

#pragma 第一个问题
    
    
    
    
    _add=0;
    
    for (int i=0; i<_oneArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
                NSInteger index = i % 1;
                NSInteger page = i / 1;
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( index*(Button_Width + Width_Space+100) + Start_X+100,  page*(Button_Height + Height_Space)+Start_Y-240, Button_Width+250, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_oneArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change68:)];
        cb.tag=++_add;

        [_chooseArray1 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
    }
    
#pragma 第二个问题
    
    
    
    
    
    for (int i=0; i<_twoArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y-100+50, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_twoArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change69:)];
        
        [_chooseArray2 addObject:cb];
        [_view2 addSubview:cb];
        
        
        cb.hidden=YES;
        
        
        
        
    }
    
    _lb2.hidden=YES;
   
    
#pragma 第三个问题
    
  
    
    
    
    
    for (int i=0; i<_threeArray.count; i++) {
        
        //        float x = i%5;
        //
        //        float y = i/5;
        
        
        
        
        
        SSCheckBoxView*cb = [[SSCheckBoxView alloc] initWithFrame:CGRectMake( i*(Button_Width-100 + Width_Space) + Start_X,  (Button_Height + Height_Space)+Start_Y+80+50, Button_Width-100, Button_Height) style:kSSCheckBoxViewStyleMono checked:NO];
        NSString *a1 = [_threeArray objectAtIndex:i];
        
        [cb setText:a1];
        
        
        [cb setStateChangedTarget:self selector:@selector(change70:)];
        
        [_chooseArray3 addObject:cb];
        [_view2 addSubview:cb];
        
        
        
        
        
        
        
    }

}


-(void)textFieldDidChange :(UITextField *)theTextField{
    if (_text1.text.length>0) {
        
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==1) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==1) {
                cb.checked=NO;
            }
        }
    }
    if (_text2.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==2) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==2) {
                cb.checked=NO;
            }
        }
    }
    
    if (_text3.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==3) {
                cb.checked=YES;
            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==3) {
                cb.checked=NO;
            }
        }
    }
    
    if (_text4.text.length>0) {
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==4) {
                cb.checked=YES;
                
                for (SSCheckBoxView*pp in _chooseArray2) {
                    
                    pp.hidden=NO;
                    _lb2.hidden=NO;
                    
                }

            }
        }
    }
    else{
        
        for (SSCheckBoxView*cb in _chooseArray1) {
            
            if (cb.tag==4) {
                cb.checked=NO;
                
                for (SSCheckBoxView*pp in _chooseArray2) {
                    
                    pp.hidden=YES;
                    _lb2.hidden=YES;
                    
                }

            }
        }
    }



}
-(void)change68:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
//    if(_tmpBtn== cbv) {
//        //上次点击过的按钮，不做处理
//    } else{
//        //本次点击的按钮设为红色
//        cbv.checked=YES;
//        //将上次点击过的按钮设为黑色
//        _tmpBtn.checked=NO;
//    }
//    _tmpBtn= cbv;
    
    
//    if ([cbv.textLabel.text isEqualToString:@"抽查样本总数"]) {
//        _text1.enabled = YES;
//        
//    }
//    else{
//        _text1.enabled = NO;
//        //_text1.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"≤15分钟"]) {
//        _text2.enabled = YES;
//        
//    }
//    else{
//        _text2.enabled = NO;
//       // _text2.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"15-30分钟"]) {
//        _text3.enabled = YES;
//        
//    }
//    else{
//        _text3.enabled = NO;
//        //_text3.text=@"";
//        
//    }
//    if ([cbv.textLabel.text isEqualToString:@"≥30分钟"]) {
//        _text4.enabled = YES;
//        
//    }
//    else{
//        _text4.enabled = NO;
//        //_text4.text=@"";
//        
//    }
    
    if (cbv.checked==YES&&[cbv.textLabel.text isEqualToString:_oneArray.lastObject]) {
        NSLog(@"1111111");
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=NO;
            _lb2.hidden=NO;
          
        }
    }
    
    else{
        
        for (SSCheckBoxView*pp in _chooseArray2) {
            
            pp.hidden=YES;
            pp.checked=NO;
            _lb2.hidden=YES;
           
        }
        
    }

    
}

-(void)change69:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn2== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn2.checked=NO;
    }
    _tmpBtn2= cbv;
    
}
-(void)change70:(SSCheckBoxView*)cbv{
    
    NSLog(@"复选框状态: %@",cbv.checked ? @"选中" : @"没选中");
    
    if(_tmpBtn3== cbv) {
        //上次点击过的按钮，不做处理
    } else{
        //本次点击的按钮设为红色
        cbv.checked=YES;
        //将上次点击过的按钮设为黑色
        _tmpBtn3.checked=NO;
    }
    _tmpBtn3= cbv;
    
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
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex==0) {
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if ([user objectForKey:@"123"]) {
            TwentyNineViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"sixPage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
            
        }else{
            TwentyNineViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"onePage"];
            
            [self.navigationController pushViewController:receive animated:YES];
            
        }

    }
    else{
        
        _seg.selectedSegmentIndex=0;
    }
}


- (IBAction)takePhoto1:(id)sender {
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

-(NSString *)getImageSavePath{
    //获取存放的照片
    //获取Documents文件夹目录
    NSUserDefaults *number = [NSUserDefaults standardUserDefaults];
    
    if (_a==0) {
       NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
        NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList2"] integerValue]];
        
        
        _str=[[@"70_" stringByAppendingString:photoName] stringByAppendingString:@".jpg"];
    }
    else{
        NSUserDefaults *photoList = [NSUserDefaults standardUserDefaults];
        NSString*photoName=[NSString stringWithFormat:@"%d",[[photoList objectForKey:@"photoList2"] integerValue]];
        
        
        _str=[[@"68_" stringByAppendingString:photoName] stringByAppendingString:@".jpg"];    }
    
    
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
        [_img2 setImage:[UIImage imageWithData:data]];
    }
    else{
        [_img1 setImage:[UIImage imageWithData:data]];
    }
    
    _img1.tag = 100;
    _img2.tag=101;
    
    
    
    
    
    
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


- (IBAction)seg:(id)sender {
    
    NSInteger Index = _seg.selectedSegmentIndex;
    
    if (Index == 1) {
        NSLog(@"2");
    }else if (Index == 0){
        
        
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

- (IBAction)nextBtn:(id)sender {
    
    int isok1=0;
    int isok2=0;
    int isok3=0;
    
    
    if (_text1.text.intValue!=(_text2.text.intValue+_text3.text.intValue+_text4.text.intValue)) {
        
      
        
       
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        if (![user objectForKey:@"english"]) {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"错误" message:@"抽查样本总数必须等于三者之和" delegate:nil cancelButtonTitle:@"请修改" otherButtonTitles: nil];
            [alert show];
        }else{
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"error" message:@" The total number of sample checks must be equal to the sum of the three " delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
        }

        return;
        
    }

    
    
    
    NSMutableArray*Q1=[[NSMutableArray alloc] init];
    NSMutableArray*Q2=[[NSMutableArray alloc] init];
    NSMutableArray*Q3=[[NSMutableArray alloc] init];
    NSString*str2=[[NSString alloc] init];
    NSString*str=[[NSString alloc] init];
    
    for(int i=0;i<[_chooseArray1 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray1 objectAtIndex:i];
        
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray firstObject]])
        {
            
            str2=@"抽查样本总数";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text1.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:1]])
        {
            
            str2=@"≤15分钟";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text2.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:2]])
        {
            
            str2=@"15至30分钟";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text3.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }
        if(pp.checked==1&&[pp.textLabel.text isEqualToString:[_oneArray objectAtIndex:3]])
        {
            
            str2=@"≥30分钟";
            str=[[str2 stringByAppendingString:@"("] stringByAppendingString:_text4.text];
            isok1=1;
            [Q1 addObject:str];
            _chooseStr=pp.textLabel.text;
        }

    }
    
    if (isok1==1) {
        
        if ([_chooseStr isEqualToString:[_oneArray objectAtIndex:0]]) {
            if (_text1.text==nil||[_text1.text isEqualToString:@""]) {
                isok1=0;
                
            }
        }
        if ([_chooseStr isEqualToString:[_oneArray objectAtIndex:1]]) {
            if (_text2.text==nil||[_text2.text isEqualToString:@""]) {
                isok1=0;
                
            }
        }
        
        if ([_chooseStr isEqualToString:[_oneArray objectAtIndex:2]]) {
            if (_text3.text==nil||[_text3.text isEqualToString:@""]) {
                isok1=0;
                
            }
        }
        if ([_chooseStr isEqualToString:[_oneArray objectAtIndex:3]]) {
            if (_text4.text==nil||[_text4.text isEqualToString:@""]) {
                isok1=0;
                
            }
        }
      
        
        
        
    }

    
    
    
    for(int i=0;i<[_chooseArray2 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray2 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok2=1;
            [Q2 addObject:pp.textLabel.text];
            
        }
    }
    
    for(int i=0;i<[_chooseArray3 count];i++)
    {
        
        SSCheckBoxView* pp=[_chooseArray3 objectAtIndex:i];
        
        if(pp.checked==1)
        {
            
            isok3=1;
            [Q3 addObject:pp.textLabel.text];
            
        }
    }
    if (!isok1||!isok3) {
        
        
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
        
        
        //NSDictionary *q2 =@{@"text":_textLb2.text};
        NSDictionary *q1 =@{@"choose":Q1};
        NSDictionary *q2 =@{@"choose":Q2};
        NSDictionary *q3 =@{@"choose":Q3};
        
        NSDictionary*num1=@{@"68":q1};
        NSDictionary*num2=@{@"69":q2};
        NSDictionary*num3=@{@"70":q3};
        
        
        //        NSMutableArray*arr=[[NSMutableArray alloc] init];
        //        [arr addObject:num2];
        //        [arr addObject:num3];
        //        [arr addObject:num4];
        
        NSUserDefaults *shiyan = [NSUserDefaults standardUserDefaults];
        if ([[shiyan objectForKey:@"shiyan"]count]==0) {
            NSMutableArray*arr=[NSMutableArray arrayWithObjects:num1,num2,num3, nil];
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [shiyan setObject:arr1 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
        }
        
        else{
            
            NSMutableArray*lex=[NSMutableArray arrayWithArray:[shiyan objectForKey:@"shiyan"]];
            
            
            
            
            NSLog(@"%@",[shiyan objectForKey:@"shiyan"]);
            NSMutableArray *discardedItems = [NSMutableArray array];
            
            for (NSDictionary*kk in lex) {
                
                if ([kk objectForKey:@"68"]) {
                    
                    NSLog(@"%@",kk);
                    
                    [discardedItems addObject:kk];
                    
                }
                if ([kk objectForKey:@"69"]) {
                    
                    [discardedItems addObject:kk];
                    
                }
                if ([kk objectForKey:@"70"]) {
                    
                    [discardedItems addObject:kk];
                    
                }
                
                
                
            }
            
            [lex removeObjectsInArray:discardedItems];
            NSLog(@"%@",lex);
            NSArray*arr2=[NSArray arrayWithArray:lex];
            [shiyan setObject:arr2 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
            
            
            NSMutableArray*arr=[NSMutableArray arrayWithObjects: num1,num2,num3, nil];
            
            [arr addObjectsFromArray:[shiyan objectForKey:@"shiyan"]];
            
            
            NSArray*arr1=[NSArray arrayWithArray:arr];
            [shiyan setObject:arr1 forKey:@"shiyan"];
            [shiyan synchronize];
            
            
            
            
            
        }
        
        NSLog(@"%@",[shiyan objectForKey:@"shiyan"]);
        
//        TwentyNineViewController *receive = [self.storyboard instantiateViewControllerWithIdentifier:@"30Page"];
//        
//        [self.navigationController pushViewController:receive animated:YES];
        
        if (!_thirty) {
            
            _thirty= [self.storyboard instantiateViewControllerWithIdentifier:@"30Page"];
        }
        
        
        
        [self.navigationController pushViewController:_thirty animated:YES];

        
    }
}

@end
