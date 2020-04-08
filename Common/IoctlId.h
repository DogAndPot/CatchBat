//
//  IoctlId.h
//  Catch Bat
//
//  Created by 钟先耀 on 2020/4/8.
//  Copyright © 2020 lhy. All rights reserved.
//

#ifndef IoctlId_h
#define IoctlId_h

#define IOCTL_80211_BSSID                        0x0D010101
#define IOCTL_80211_SSID                         0x0D010102
#define IOCTL_80211_NETWORK_TYPES_SUPPORTED      0x0D010203
#define IOCTL_80211_NETWORK_TYPE_IN_USE          0x0D010204
#define IOCTL_80211_TX_POWER_LEVEL               0x0D010205
#define IOCTL_80211_RSSI                         0x0D010206
#define IOCTL_80211_RSSI_TRIGGER                 0x0D010207
#define IOCTL_80211_INFRASTRUCTURE_MODE          0x0D010108
#define IOCTL_80211_FRAGMENTATION_THRESHOLD      0x0D010209
#define IOCTL_80211_RTS_THRESHOLD                0x0D01020A
#define IOCTL_80211_NUMBER_OF_ANTENNAS           0x0D01020B
#define IOCTL_80211_RX_ANTENNA_SELECTED          0x0D01020C
#define IOCTL_80211_TX_ANTENNA_SELECTED          0x0D01020D
#define IOCTL_80211_SUPPORTED_RATES              0x0D01020E
#define IOCTL_80211_DESIRED_RATES                0x0D010210
#define IOCTL_80211_CONFIGURATION                0x0D010211
#define IOCTL_80211_STATISTICS                   0x0D020212
#define IOCTL_80211_ADD_WEP                      0x0D010113
#define IOCTL_80211_REMOVE_WEP                   0x0D010114
#define IOCTL_80211_DISASSOCIATE                 0x0D010115
#define IOCTL_80211_POWER_MODE                   0x0D010216
#define IOCTL_80211_BSSID_LIST                   0x0D010217
#define IOCTL_80211_BSSID_LIST_NEXT                0x0D010218
#define IOCTL_80211_AUTHENTICATION_MODE          0x0D010118
#define IOCTL_80211_PRIVACY_FILTER               0x0D010119
#define IOCTL_80211_BSSID_LIST_SCAN              0x0D01011A
#define IOCTL_80211_WEP_STATUS                   0x0D01011B
#define IOCTL_80211_ENCRYPTION_STATUS            IOCTL_80211_WEP_STATUS
#define IOCTL_80211_RELOAD_DEFAULTS              0x0D01011C
#define IOCTL_80211_ADD_KEY                      0x0D01011D
#define IOCTL_80211_REMOVE_KEY                   0x0D01011E
#define IOCTL_80211_ASSOCIATION_INFORMATION      0x0D01011F
#define IOCTL_80211_TEST_SLEEP                    0x0D010120
#define IOCTL_80211_DEVICE_READY_AFTER_SLEEP        0x0D010121
#define IOCTL_80211_IS_PORT_SECURED                0x0D010124

#endif /* IoctlId_h */
