package com.example.channel_example;

import android.app.Application;

import com.example.channel.Channel;
import com.example.channel.ChannelPlugin;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;


/**
 * @ClassName: MyApplication
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 17:09
 */
public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();

        ChannelPlugin.init(new Channel() {
            @Override
            public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                MessageChannel.onMethodCall(call, result);
            }
        });
    }
}
