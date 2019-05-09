package com.rongzhixin.myapplication;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.util.Log;

import com.example.channel.Channel;
import com.example.channel.ChannelPlugin;
import com.taobao.idlefish.flutterboost.Debuger;
import com.taobao.idlefish.flutterboost.FlutterBoostPlugin;
import com.taobao.idlefish.flutterboost.interfaces.IPlatform;

import java.util.Map;

import io.flutter.app.FlutterApplication;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @ClassName: MyApplication
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 10:01
 */
public class MyApplication extends FlutterApplication {

    private static MyApplication mApp;

    @Override
    public void onCreate() {
        super.onCreate();
        mApp = this;
        FlutterBoostPlugin.init(new IPlatform() {
            @Override
            public Application getApplication() {
                return MyApplication.this;
            }

            /**
             * 获取应用入口的Activity,这个Activity在应用交互期间应该是一直在栈底的
             * @return
             */
            @Override
            public Activity getMainActivity() {
                return MainActivity.sRef.get();
            }

            @Override
            public boolean isDebug() {
                return true;
            }

            /**
             * 如果flutter想打开一个本地页面，将会回调这个方法，页面参数将会拼接在url中
             *
             * 例如：sample://nativePage?aaa=bbb
             *
             * 参数就是类似 aaa=bbb 这样的键值对
             *
             * @param context
             * @param url
             * @param params
             * @return
             */
            @Override
            public boolean startActivity(Context context, String url, Map params) {
                Log.d("startActivity", "startActivity url=" + url);

                return PageRouter.openPageByUrl(context, url, params);
            }

            @Override
            public Map getSettings() {
                return null;
            }
        });

        ChannelPlugin.init(new Channel() {
            @Override
            public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                MessageChannel.onMethodCall(call, result);
            }
        });
    }

    public static Activity getActivity(){
        return mApp.getCurrentActivity();
    }
}
