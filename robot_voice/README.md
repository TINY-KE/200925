## 目标
实现采用语音指令的方式,控制机器人到达指定目标点,并且在机器人在到达目标点后,给出反馈

## 技术路线
采用语音识别技术,利用电脑的mic,采集音频,然后利用在线的语音识别技术,把音频转换为字符串;
采用自然语言处理技术,提取室内场景以及物品的位置信息
把如卧室\客厅\沙发等内容,传递给导航模块,导航模块负责解析目标点
机器人运动...
到达指定位置后,机器人采用文字转语义的形式,告诉机器人到哪了


## Build
1. 　安装科大讯飞SDK
a)     https://www.xfyun.cn/sdk/dispatcher,下载对应系统的功能包
b)    在下载的samples的make文件中,指定是x64还是x86版本后,直接make会产生如下错误:
usr/bin/ld: 找不到 -lmsc--
这是因为libmsc.so为科大讯飞的动态链接库,它不在系统的库目录中,所以我们把它添加到系统库目录.
sudo cp libmsc.so /usr/local/lib/
ldconfig

2.    修改代码
    科大讯飞有一个appid，需要把原文件中的ｉｄ修改为下载的ｉｄ，例如：
    const char* login_params         = "appid = 58fd63aa, work_dir = .";//登录参数,appid与msc库绑定,请勿随意改动
    在src目录的文件中查找appid，修改即可

3.  以ROS方式编译
4.  TTS需要安装mplayer才能出声，采用sudo下载即可
5.  mplayer可能发出警告，在.mplayer/config中添加：lirc=no


## Run
1. 文字(/voiceWords)转语音(TTS)
    e.g.
    rosrun robot_voice tts_subscribe
    rostopic pub /voiceWords std_msgs/String "data: '客厅'"

2. 语音转文字(/voiceWords) ,语音识别(iat)
    e.g. 
    rosrun robot_voice iat_publish
    rostopic pub /voiceWakeup std_msgs/String "data: '123'" 

注意，上述功能需要连接网络，这是在线语音包！

## TODO
1. 分词,把目标点发送给ROS的goal


## 参考资料
[深蓝ＲＯＳ](https://www.bilibili.com/video/av80481161?p=5)
