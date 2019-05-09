package com.example.channel_example;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @ClassName: MessageChannel
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 17:15
 */
public class MessageChannel {

    public static void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getUserID")) {
            result.success("userId: " + "10086");
        } else {
            result.notImplemented();
        }
    }
}
