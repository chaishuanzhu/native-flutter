package com.rongzhixin.myapplication;

/**
 * @ClassName: FlutterPageActivity
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 10:07
 */
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import com.taobao.idlefish.flutterboost.containers.BoostFlutterActivity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class FlutterPageActivity extends BoostFlutterActivity {


    static void actionStart(Context context, String url, Map params) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        list.add(params);
        ArrayList bundlelist = new ArrayList();
        bundlelist.add(list);

        Bundle bundle = new Bundle();
        bundle.putString("url",url);
        bundle.putParcelableArrayList("params",bundlelist);

        Intent intent = new Intent(context, FlutterPageActivity.class);
        intent.putExtras(bundle);
        context.startActivity(intent);
    }

    @Override
    public void onRegisterPlugins(PluginRegistry registry) {
        GeneratedPluginRegistrant.registerWith(registry);
    }

    /**
     * 该方法返回当前Activity在Flutter层对应的name，
     * 混合栈将会在flutter层根据这个名字，在注册的Route表中查找对应的Widget
     *
     * 在flutter层有注册函数：
     *     FlutterBoost.singleton.registerPageBuilders({
     *       'first': (pageName, params, _) => FirstRouteWidget(),
     *       'second': (pageName, params, _) => SecondRouteWidget(),
     *       ...
     *     });
     *
     * 该方法中返回的就是注册的key：first , second
     *
     * @return
     */
    @Override
    public String getContainerName() {
        Bundle bunde = this.getIntent().getExtras();
        return bunde.getString("url");
    }

    /**
     * 该方法返回的参数将会传递给上层的flutter对应的Widget
     *
     * 在flutter层有注册函数：
     *    FlutterBoost.singleton.registerPageBuilders({
     *       'first': (pageName, params, _) => FirstRouteWidget(),
     *       'second': (pageName, params, _) => SecondRouteWidget(),
     *        ...
     *     });
     *
     * 该方法返回的参数就会封装成上面的params
     *
     * @return
     */
    @Override
    public Map getContainerParams() {
        Bundle bundle = getIntent().getExtras();
        ArrayList list = bundle.getParcelableArrayList("params");
        List<Map<String, Object>> lists= (List<Map<String, Object>>)list.get(0);
        return lists.get(0);
    }
}
