#!/bin/bash

#下载flutter
function px_download_flutter {
    git clone "https://github.com/flutter/flutter.git" $HOME/flutter
}
#添加flutter所需环境变量
function px_config_flutter {
    echo "" >> $HOME/.zshrc
    echo "" >> $HOME/.zshrc
    echo '#flutter config' >> $HOME/.zshrc
    echo 'export PATH=$HOME/flutter/bin:$PATH' >> $HOME/.zshrc
    echo 'export PUB_HOSTED_URL=https://pub.flutter-io.cn' >> $HOME/.zshrc
    echo 'export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn' >> $HOME/.zshrc
    
    echo "" >> $HOME/.zshrc
    echo "" >> $HOME/.zshrc
    echo '#android config' >> $HOME/.zshrc
    echo 'export ANDROID_HOME=$HOME/Library/Android/sdk' >> $HOME/.zshrc
    echo 'export PATH=${PATH}:${ANDROID_HOME}/tools' >> $HOME/.zshrc
    echo 'export PATH=${PATH}:${ANDROID_HOME}/platform-tools' >> $HOME/.zshrc
    echo 'export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/Contents/Home"' >> $HOME/.zshrc
}
#检查flutter环境变量
function px_check_config_flutter {
    open $HOME/.zshrc
    read -p "flutter&android环境变量配置的路径是否正确:(y/n)" px_is_correct
        if [ $px_is_correct == "y" ]
        then
            echo "flutter所需环境变量已配置正确！"
            source $HOME/.zshrc
        else
            echo "请修改flutter｜android环境变量配置并保存"
            px_check_config_flutter
    fi
}
#flutter切换成稳定版
function px_switch_flutter_stable_channel {
    flutter channel | grep "* stable"
    if [ $? -eq 0 ]
    then
        echo "flutter已切换至stable!"
    else
        flutter channel stable
    fi
}
#询问是否创建项目
function px_need_create_project {
    read -p "是否创建flutter新项目:(y/n)" px_is_need_create
    echo $px_is_need_create
    if [ $px_is_need_create == "y" ]
    then
        px_pre_run_flutter
    else
        echo "flutter配置已完成！"
    fi
}
#切换flutter为稳定版并创建项目
function px_pre_run_flutter {
    read -p "请输入项目名称：" px_project_name
    read -p "是否使用oc和java创建项目:(y/n)" px_is_old
    if [ $px_is_old == "y" ]
    then
        cd Desktop;flutter create -i objc -a java $px_project_name
        echo "flutter新项目(oc&java):$HOME/Desktop/$px_project_name已创建！"
    else
        cd Desktop;flutter create $px_project_name
        echo "flutter新项目(swift&kotlin):$HOME/Desktop/$px_project_name已创建！"
    fi
}

#check flutter
grep "flutter" $HOME/flutter/ >> /dev/null;
if [ $? -eq 0 ]
then
    echo "$HOME/flutter文件夹已存在！"
else
    px_download_flutter
fi

#check flutter config
grep "PUB_HOSTED_URL" .zshrc >> /dev/null;grep "FLUTTER_STORAGE_BASE_URL" .zshrc >> /dev/null
if [ $? -eq 0 ]
then
    echo "flutter环境变量已配置！"
    px_check_config_flutter
else
    px_config_flutter
    px_check_config_flutter
    px_switch_flutter_stable_channel
fi

px_need_create_project



   
