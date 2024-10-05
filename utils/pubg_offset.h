
// Created 秋末  on 2022/1/16.
//
#include <stdio.h>
#include <string>


namespace PubgOffset {




int PlayerControllerOffset[3] = {0x38, 0x78, 0x30};
    

namespace PlayerControllerParam {
     int SelfOffset = 0x2640;//0x2518更新
     int MouseOffset = 0x468;//0x420
     int CameraManagerOffset = 0x4D0;//0x488
     int AngleOffset = 0x4F8;
namespace CameraManagerParam{
     int PovOffset = 0x1030 + 0x10;//0xfC0
}
namespace ControllerFunction {

int LineOfSightToOffset = 0x788;
        }
    }

    int ULevelOffset = 0x30;
    namespace ULevelParam {
    int ObjectArrayOffset = 0xA0;
    int ObjectCountOffset = 0xA8;
    }

    namespace ObjectParam {
    int ClassIdOffset = 0x18;//类型ID
    int ClassNameOffset = 0xC;

        namespace PlayerFunction {
        int AddControllerYawInputOffset = 0x960;
        int AddControllerRollInputOffset = 0x958;
        int AddControllerPitchInputOffset = 0x868;
        }

       
        int angleOffset = 0xf58;
        int StatusOffset = 0xFF8;
        int TeamOffset = 0x938;
        int NameOffset = 0x8F0;
        int RobotOffset = 0x9E9;
        int HpOffset = 0xDC0;
        int HPMOffset = 0xDC4;//血量max
        int MoveCoordOffset = 0xb0;
        int CurrentOffset = 0xE08;//STExtraVehicleBase* CurrentVehicle
        int RepMoveOffset = 0x1D8//struct FObbyRepMovement ReplicatedMovement;;
        int isDead = 0xDDC;
    
    
      
        
        

        int MeshOffset = 0x498;
    namespace MeshParam{
            int HumanOffset = 0x1A8;
            int BonesOffset = 0x878;
        }

        int OpenFireOffset = 0x1640;
        int OpenTheSightOffset = 0x1050;

        int WeaponOneOffset = 0x27C8 + 0x20;
        namespace WeaponParam{
            int MasterOffset = 0xB0;
            int ShootModeOffset = 0xf14;
            int WeaponAttrOffset = 0x1048;
          
        namespace WeaponAttrParam{
                int BulletSpeedOffset = 0x4f8;
                int RecoilOffset = 0xc48;
            }
        }

        int GoodsListOffset = 0x880;
        namespace GoodsListParam {
            int DataBase = 0x38;
        }

        int CoordOffset = 0x1b0;
        namespace CoordParam {
            int HeightOffset = 0x17C;//对象高度
            int CoordOffset = 0x1B0//对象坐标
        }
    }
}

