# 此脚本为 下载flutter->配置flutter环境变量->创建flutter新项目 
## 默认xcode，android studio已提前安装至applications路径
### 下载configFlutter.command终端打开
#### 执行权限
```
chmod 777 configFlutter.command
```
#### 查看环境变量如下配置：
```
#flutter config
export PATH=$HOME/flutter/bin:$PATH
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn


#android config
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"
```
#### flutter创建oc / java项目
```
flutter create -i objc -a java $project_name
```
# flutterConfigForMac
