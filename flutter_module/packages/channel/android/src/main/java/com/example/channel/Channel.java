package com.example.channel;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @ClassName: Channel
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 16:50
 */
public interface Channel {

    public void onMethodCall(MethodCall call, MethodChannel.Result result);

}
