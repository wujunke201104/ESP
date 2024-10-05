#import "菜单.h"
#import "OverlayView.h"
#import "HeeeNoScreenShotView.h"
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

extern float asize;
extern float test1;
extern float test2;
extern float test3;
extern float test4;
extern float test5;
extern float test6;
extern float test7;
@implementation mi
extern int IsLang;
 bool IsEnglish =false;
 bool IsKorean = true;
INI* config;


const char *optionItemName[] = {"Home", "ESP", "ITEM", "AIMBOT"};
int optionItemCurrent = 0;
//自瞄部位文本
int aimbotIntensity;
const char *aimbotIntensityText[] = {"很低","低", "中", "高", "很高", "强", "锁死"};
//自瞄部位文本
const char *aimbotModeText[] = {"开镜", "开火", "开镜开火"};
//自瞄部位文本
const char *aimbotPartsText[] = {"头", "身体", "自动"};

OverlayView *overlayView;

- (instancetype)initWithFrame:(ModuleControl*)control {
    self.moduleControl = control;
    //获取Documents目录路径
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //初始化文件管理器
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //拼接文件路径
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"dolphins.ini"];
    //文件不存在
    if(![fileManager fileExistsAtPath:filePath]){
        //创建文件
        [fileManager createFileAtPath:filePath contents:[NSData data] attributes:nil];
    }
    //获取ini文件数据
    config = ini_load((char*)filePath.UTF8String);
    
    return [super init];
    
}

-(void)setOverlayView:(OverlayView*)ov{
    overlayView = ov;
}

HeeeNoScreenShotView *hide1;
static bool hidehackeractive;
-(void)drawMenuWindow {
    //设置下一个窗口的大小
    ImGui::SetNextWindowSize({1800, 1400}, ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowPos({172, 172}, ImGuiCond_FirstUseEver);
    
    ImGui::Begin(("ＡＲＭ"),&self.moduleControl->menuStatus, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoResize);

    if (ImGui::CollapsingHeader("绘制")) {

        if (IsEnglish) {
        if (ImGui::Button("Reset Data"))
                            {
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/ano_tmp",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Library",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()] error:nil];
                                
                                
                                UIAlertController *WrongKey = [UIAlertController alertControllerWithTitle:@"清理成功" message:nil  preferredStyle:UIAlertControllerStyleAlert];
                                
                                
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:WrongKey animated:true completion:nil];
                                
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    exit(0);
                                    
                                });
                            }
        }
        else
        {
            if (ImGui::Button("清除日志"))
                            {
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents/ano_tmp",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Documents",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/Library",NSHomeDirectory()] error:nil];
                                
                                [[NSFileManager defaultManager] removeItemAtPath:[NSString stringWithFormat:@"%@/tmp",NSHomeDirectory()] error:nil];
                                
                                
                                UIAlertController *WrongKey = [UIAlertController alertControllerWithTitle:@"清理成功" message:nil  preferredStyle:UIAlertControllerStyleAlert];
                                
                                
                                
                                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:WrongKey animated:true completion:nil];
                                
                                
                                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                    
                                    exit(0);
                                    
                                });
                            }
        }
        ImGui::SameLine();
        ImGui::Text("                                                                                                                                                            ");
        ImGui::SameLine();

        if (IsEnglish) {

        if (ImGui::Button("Reset Guest"))
                          {

                      NSArray *secItemClasses = @[(__bridge id)kSecClassGenericPassword,
                      (__bridge id)kSecClassInternetPassword,
                      (__bridge id)kSecClassCertificate,
                      (__bridge id)kSecClassKey,
                      (__bridge id)kSecClassIdentity];
                      for (id secItemClass in secItemClasses) {
                      NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
                      SecItemDelete((__bridge CFDictionaryRef)spec);
                              }
                              }
        }
        else
        {
            if (ImGui::Button("重置游客"))
                          {

                      NSArray *secItemClasses = @[(__bridge id)kSecClassGenericPassword,
                      (__bridge id)kSecClassInternetPassword,
                      (__bridge id)kSecClassCertificate,
                      (__bridge id)kSecClassKey,
                      (__bridge id)kSecClassIdentity];
                      for (id secItemClass in secItemClasses) {
                      NSDictionary *spec = @{(__bridge id)kSecClass: secItemClass};
                      SecItemDelete((__bridge CFDictionaryRef)spec);
                              }
                              }
        }

            static int IsLang = 0;
                    if (ImGui::Combo(" ", &IsLang, "English\0中文\0"))
                    {
                        switch (IsLang)
                        {
                            case 0:
                                IsEnglish =true;
                                IsKorean =false;
                                
                                break;
                            case 1:
                                IsEnglish =false;
                                IsKorean =true;
                    }
                    }


                            ImGui::Separator();

                            if (IsEnglish) {
                ImGui::Text("Announcement: ＡＲＭ ");
                            }
                            else{
                                ImGui::Text("公告:ＡＲＭ ＳＡＦＥ");
                            }

                        if (IsEnglish) {
                            if(ImGui::SliderFloat("Menu Size", &self.moduleControl->mainSwitch.MenuSizeStatus, 2.0f, 20.0f,"%.2f%")){
ImGui::SetWindowFontScale(self.moduleControl->mainSwitch.MenuSizeStatus);
}
                        }
                        else
                        {
                             if(ImGui::SliderFloat("菜单大小", &self.moduleControl->mainSwitch.MenuSizeStatus, 2.0f, 20.0f,"%.2f%")){
ImGui::SetWindowFontScale(self.moduleControl->mainSwitch.MenuSizeStatus);
}
                        }
            if (ImGui::BeginTable("split", 2));
        {
            ImGui::TableNextColumn();
            
            if(IsEnglish){
            ImGui::Checkbox("Esp", &self.moduleControl->mainSwitch.playerStatus);
            ImGui::Checkbox("PlayerLine", &self.moduleControl->playerSwitch.lineStatus);
            ImGui::Checkbox("Bones", &self.moduleControl->playerSwitch.boneStatus);
            ImGui::Checkbox("PlayerDistance", &self.moduleControl->playerSwitch.boxStatus);
            }
            else
            {
            ImGui::Checkbox("绘制开关", &self.moduleControl->mainSwitch.playerStatus);
            ImGui::Checkbox("人物天线", &self.moduleControl->playerSwitch.lineStatus);
            ImGui::Checkbox("人物骨骼", &self.moduleControl->playerSwitch.boneStatus);
            ImGui::Checkbox("人物距离", &self.moduleControl->playerSwitch.boxStatus);
            }

            ImGui::TableNextColumn();
            
            if(IsEnglish){
            ImGui::Checkbox("PlayerInfo", &self.moduleControl->playerSwitch.infoStatus);
            ImGui::Checkbox("EnemyWeapon", &self.moduleControl->playerSwitch.SCStatus);
            ImGui::Checkbox("PlayerAround", &self.moduleControl->playerSwitch.backStatus);

            }
         else
         {
            ImGui::Checkbox("绘制信息", &self.moduleControl->playerSwitch.infoStatus);
            ImGui::Checkbox("人物手持", &self.moduleControl->playerSwitch.SCStatus);
            ImGui::Checkbox("人物背敌", &self.moduleControl->playerSwitch.backStatus);

         }
            ImGui::Text("      ");
            ImGui::Separator();
            ImGui::TableNextColumn();
            
            if (IsEnglish) {
            ImGui::Text("Render FPS(Frame Per Second)");
            }
            else
            {
                ImGui::Text("FPS (每秒帧数)");
            }
            if (ImGui::RadioButton("30", &self.moduleControl->fps, 0)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 60;
            }
            ImGui::SameLine();
            ImGui::Text("                       ");
            ImGui::SameLine();
            if (ImGui::RadioButton("60", &self.moduleControl->fps, 1)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 90;
            }
            ImGui::SameLine();
            ImGui::Text("                       ");
            ImGui::SameLine();
            if (IsEnglish) {
            if (ImGui::RadioButton("Unlimited", &self.moduleControl->fps, 2)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 120;
            }
            }
            else
            {
                if (ImGui::RadioButton("无限制", &self.moduleControl->fps, 2)) {
                configManager::putInteger(config,"mainSwitch", "fps",self.moduleControl->fps);
                overlayView.preferredFramesPerSecond = 120;
            }
            }
        }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("辅助")) {
            if (ImGui::BeginTable("split", 2));
            {  
                ImGui::TableNextColumn();
                if (IsEnglish) {
                ImGui::Checkbox("Switch", &self.moduleControl->mainSwitch.aimbotStatus);
                }
                else
                {
                    ImGui::Checkbox("自瞄开关", &self.moduleControl->mainSwitch.aimbotStatus);
                }
                ImGui::TableNextColumn();

                if (IsEnglish) {
                ImGui::Checkbox("Aimknockdown", &self.moduleControl->aimbotController.fallNotAim);
                }
                else
                {
                    ImGui::Checkbox("倒地瞄准", &self.moduleControl->aimbotController.fallNotAim);
                }
ImGui::TableNextColumn();

if(IsEnglish) {
if (ImGui::Combo("Aim Speed", &aimbotIntensity, aimbotIntensityText, IM_ARRAYSIZE(aimbotIntensityText))) {
        configManager::putInteger(config,"aimbotControl", "intensity",aimbotIntensity);
        switch (aimbotIntensity) {
            case 0:
                self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
                break;
            case 1:
                self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
                break;
            case 2:
                self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
                break;
            case 3:
                self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
                break;
            case 4:
                self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
                break;
            case 5:
                self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
                break;
            case 6:
                self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
                break;
        }
    }
}
else
{
    if (ImGui::Combo("自瞄速度", &aimbotIntensity, aimbotIntensityText, IM_ARRAYSIZE(aimbotIntensityText))) {
        configManager::putInteger(config,"aimbotControl", "intensity",aimbotIntensity);
        switch (aimbotIntensity) {
            case 0:
                self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
                break;
            case 1:
                self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
                break;
            case 2:
                self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
                break;
            case 3:
                self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
                break;
            case 4:
                self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
                break;
            case 5:
                self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
                break;
            case 6:
                self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
                break;
        }
    }
}

if (IsEnglish) {
     if (ImGui::Combo("Aimbot Mode", &self.moduleControl->aimbotController.aimbotMode, aimbotModeText, IM_ARRAYSIZE(aimbotModeText))) {
        configManager::putInteger(config,"aimbotControl", "mode", self.moduleControl->aimbotController.aimbotMode);
    }
}
else
{
     if (ImGui::Combo("自瞄设置", &self.moduleControl->aimbotController.aimbotMode, aimbotModeText, IM_ARRAYSIZE(aimbotModeText))) {
        configManager::putInteger(config,"aimbotControl", "mode", self.moduleControl->aimbotController.aimbotMode);
    }
}

if (IsEnglish) {
    if (ImGui::Combo("Aim Part", &self.moduleControl->aimbotController.aimbotParts, aimbotPartsText, IM_ARRAYSIZE(aimbotPartsText))) {
        configManager::putBoolean(config,"aimbotControl", "parts", self.moduleControl->aimbotController.aimbotParts);
    }
            }
            else
            {
    if (ImGui::Combo("自瞄区域", &self.moduleControl->aimbotController.aimbotParts, aimbotPartsText, IM_ARRAYSIZE(aimbotPartsText))) {
        configManager::putBoolean(config,"aimbotControl", "parts", self.moduleControl->aimbotController.aimbotParts);
    }
            }

    if (IsEnglish) {
                ImGui::Checkbox("ShowFov", &self.moduleControl->aimbotController.showAimbotRadius);
    }
    else
    {
         ImGui::Checkbox("显示自瞄圈", &self.moduleControl->aimbotController.showAimbotRadius);
    }

    if (IsEnglish) {
                ImGui::Checkbox("Igrone Bot", &self.moduleControl->aimbotController.smoke);
    }
    else
    {
        ImGui::Checkbox("人机不瞄", &self.moduleControl->aimbotController.smoke);
    }

    if (IsEnglish) {
                ImGui::SliderFloat("Fov", &self.moduleControl->aimbotController.aimbotRadius, 0.0f, ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].nativeScale) / 2, "%.0f%");
    }
    else
    {
        ImGui::SliderFloat("自瞄圈调节", &self.moduleControl->aimbotController.aimbotRadius, 0.0f, ([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].nativeScale) / 2, "%.0f%");
    }

    if (IsEnglish) {
                ImGui::SliderFloat("Distance", &self.moduleControl->aimbotController.distance, 0.0f, 450.0f, "%.0fM");
    }
    else
    {
        ImGui::SliderFloat("自瞄距离", &self.moduleControl->aimbotController.distance, 0.0f, 450.0f, "%.0fM");
    }
                }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("物资显示")) {
            if (ImGui::BeginTable("split", 2));
            {               
                ImGui::TableNextColumn();

                if (IsEnglish) {
                ImGui::Checkbox("iTem Switch", &self.moduleControl->mainSwitch.materialStatus);
                
                if (ImGui::Checkbox("Rifle", &self.moduleControl->materialSwitch[Rifle])) {
                    std::string str = "materialSwitch_" + std::to_string(Rifle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Rifle]);
                }
                
                if (ImGui::Checkbox("Armor", &self.moduleControl->materialSwitch[Armor])) {
                    std::string str = "materialSwitch_" + std::to_string(Armor);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Armor]);
                }
                
                if (ImGui::Checkbox("SniperPart", &self.moduleControl->materialSwitch[SniperParts])) {
                    std::string str = "materialSwitch_" + std::to_string(SniperParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[SniperParts]);
                }
                
                if (ImGui::Checkbox("RiflePart", &self.moduleControl->materialSwitch[RifleParts])) {
                    std::string str = "materialSwitch_" + std::to_string(RifleParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[RifleParts]);
                }
                
                if (ImGui::Checkbox("Bullet", &self.moduleControl->materialSwitch[Bullet])) {
                    std::string str = "materialSwitch_" + std::to_string(Bullet);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Bullet]);
                }
                
                if (ImGui::Checkbox("Grip", &self.moduleControl->materialSwitch[Grip])) {
                    std::string str = "materialSwitch_" + std::to_string(Grip);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Grip]);
                }
                
                if (ImGui::Checkbox("Sniper", &self.moduleControl->materialSwitch[Sniper])) {
                    std::string str = "materialSwitch_" + std::to_string(Sniper);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sniper]);
                }
                
                if (ImGui::Checkbox("Sight", &self.moduleControl->materialSwitch[Sight])) {
                    std::string str = "materialSwitch_" + std::to_string(Sight);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sight]);
                }
                }
                else
                {
                    ImGui::Checkbox("物资开关", &self.moduleControl->mainSwitch.materialStatus);
                
                if (ImGui::Checkbox("步枪", &self.moduleControl->materialSwitch[Rifle])) {
                    std::string str = "materialSwitch_" + std::to_string(Rifle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Rifle]);
                }
                
                if (ImGui::Checkbox("甲", &self.moduleControl->materialSwitch[Armor])) {
                    std::string str = "materialSwitch_" + std::to_string(Armor);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Armor]);
                }
                
                if (ImGui::Checkbox("狙击枪部分", &self.moduleControl->materialSwitch[SniperParts])) {
                    std::string str = "materialSwitch_" + std::to_string(SniperParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[SniperParts]);
                }
                
                if (ImGui::Checkbox("步枪部分", &self.moduleControl->materialSwitch[RifleParts])) {
                    std::string str = "materialSwitch_" + std::to_string(RifleParts);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[RifleParts]);
                }
                
                if (ImGui::Checkbox("子弹", &self.moduleControl->materialSwitch[Bullet])) {
                    std::string str = "materialSwitch_" + std::to_string(Bullet);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Bullet]);
                }
                
                if (ImGui::Checkbox("Grip", &self.moduleControl->materialSwitch[Grip])) {
                    std::string str = "materialSwitch_" + std::to_string(Grip);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Grip]);
                }
                
                if (ImGui::Checkbox("狙击枪", &self.moduleControl->materialSwitch[Sniper])) {
                    std::string str = "materialSwitch_" + std::to_string(Sniper);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sniper]);
                }
                
                if (ImGui::Checkbox("sight", &self.moduleControl->materialSwitch[Sight])) {
                    std::string str = "materialSwitch_" + std::to_string(Sight);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Sight]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("药品绘制")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("Drug", &self.moduleControl->materialSwitch[Drug])) {
                    std::string str = "materialSwitch_" + std::to_string(Drug);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Drug]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("药品", &self.moduleControl->materialSwitch[Drug])) {
                    std::string str = "materialSwitch_" + std::to_string(Drug);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Drug]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("车辆绘制")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("Vichle", &self.moduleControl->materialSwitch[Vehicle])) {
                    std::string str = "materialSwitch_" + std::to_string(Vehicle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Vehicle]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("车辆", &self.moduleControl->materialSwitch[Vehicle])) {
                    std::string str = "materialSwitch_" + std::to_string(Vehicle);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Vehicle]);
                }
                }
            }
            ImGui::EndTable();
        }

        if (ImGui::CollapsingHeader("其他")) {
            if (ImGui::BeginTable("split", 2));
            {
                ImGui::TableNextColumn();
                
                if (IsEnglish) {
                if (ImGui::Checkbox("Airdrop", &self.moduleControl->materialSwitch[Airdrop])) {
                    std::string str = "materialSwitch_" + std::to_string(Airdrop);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Airdrop]);
                }
            }
            else
            {
                if (ImGui::Checkbox("空投", &self.moduleControl->materialSwitch[Airdrop])) {
                    std::string str = "materialSwitch_" + std::to_string(Airdrop);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Airdrop]);
                }
            }
                ImGui::TableNextColumn();
                if (IsEnglish) {
                if (ImGui::Checkbox("Airdrop", &self.moduleControl->materialSwitch[FlareGun])) {
                    std::string str = "materialSwitch_" + std::to_string(FlareGun);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[FlareGun]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("信号枪", &self.moduleControl->materialSwitch[FlareGun])) {
                    std::string str = "materialSwitch_" + std::to_string(FlareGun);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[FlareGun]);
                }
                }
                ImGui::TableNextColumn();
                if(IsEnglish) {
                if (ImGui::Checkbox("Grenader", &self.moduleControl->materialSwitch[Missile])) {
                    std::string str = "materialSwitch_" + std::to_string(Missile);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Missile]);
                }
                }
                else
                {
                    if (ImGui::Checkbox("投掷物", &self.moduleControl->materialSwitch[Missile])) {
                    std::string str = "materialSwitch_" + std::to_string(Missile);
                    configManager::putBoolean(config,"materialSwitch", str.c_str(), self.moduleControl->materialSwitch[Missile]);
                }
                }
            }
            ImGui::EndTable();
        }

if (ImGui::CollapsingHeader("内存")) {
    if (IsEnglish) {
        if (ImGui::BeginTable("split", 2)) {  // 去掉多余的分号
            ImGui::TableNextColumn();

            ImGui::Checkbox("Norecoil", &self.moduleControl->mainSwitch.isNorecoil);
            ImGui::Checkbox("HitEffect", &self.moduleControl->playerSwitch.isHitEffect);
            ImGui::Checkbox("BulletSpeed", &self.moduleControl->playerSwitch.isBulletSpeed);
            ImGui::Checkbox("Nodispersion", &self.moduleControl->playerSwitch.isNodispersion);
            ImGui::Checkbox("fastBull", &self.moduleControl->playerSwitch.isfast);

            ImGui::EndTable();  // EndTable 应该放在表格逻辑结束后
        }
    } else {
        if (ImGui::BeginTable("split", 2)) {
            ImGui::TableNextColumn();

            ImGui::Checkbox("无后坐力", &self.moduleControl->mainSwitch.isNorecoil);
            ImGui::Checkbox("打击标志", &self.moduleControl->playerSwitch.isHitEffect);
            ImGui::Checkbox("快速子弹", &self.moduleControl->playerSwitch.isBulletSpeed);
            ImGui::Checkbox("无散布", &self.moduleControl->playerSwitch.isNodispersion);
            ImGui::Checkbox("快速射击", &self.moduleControl->playerSwitch.isfast);

            ImGui::EndTable();
        }
    }
}
        ImGui::End();
    }
    
-(void)readIniConfig{
    self.moduleControl->fps = configManager::readInteger(config,"mainSwitch", "fps", 0);
    switch(self.moduleControl->fps){
        case 0:
            overlayView.preferredFramesPerSecond = 60;
            break;
        case 1:
            overlayView.preferredFramesPerSecond = 90;
            break;
        case 2:
            overlayView.preferredFramesPerSecond = 120;
            break;
        default:
            overlayView.preferredFramesPerSecond = 60;
            break;
    }
    
    //自瞄模式
    self.moduleControl->aimbotController.aimbotMode = configManager::readInteger(config,"aimbotControl", "mode", 0);
    //自瞄部位
    self.moduleControl->aimbotController.aimbotParts = configManager::readInteger(config,"aimbotControl", "parts", 0);
    //自瞄强度
    aimbotIntensity = configManager::readInteger(config,"aimbotControl", "intensity", 2);
    switch (aimbotIntensity) {
        case 0:
            self.moduleControl->aimbotController.aimbotIntensity = 0.1f;
            break;
        case 1:
            self.moduleControl->aimbotController.aimbotIntensity = 0.2f;
            break;
        case 2:
            self.moduleControl->aimbotController.aimbotIntensity = 0.3f;
            break;
        case 3:
            self.moduleControl->aimbotController.aimbotIntensity = 0.4f;
            break;
        case 4:
            self.moduleControl->aimbotController.aimbotIntensity = 0.5f;
            break;
        case 5:
            self.moduleControl->aimbotController.aimbotIntensity = 1.0f;
            break;
        case 6:
            self.moduleControl->aimbotController.aimbotIntensity = 1.2f;
            break;
    }

     self.moduleControl->aimbotController.distance = configManager::readFloat(config,"aimbotControl", "distance", 450);
}

@end
