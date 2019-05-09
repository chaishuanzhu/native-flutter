package com.rongzhixin.myapplication;

import android.content.Context;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.text.TextUtils;

import java.util.Map;

/**
 * @ClassName: PageRouter
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 10:03
 */

public class PageRouter {


    public static boolean openPageByUrl(Context context, String url, Map params) {
        try {
            Uri uri = Uri.parse(url);
            String target = uri.getHost();
            String pageName = uri.getPath().substring(1);
            if (target.equalsIgnoreCase("flutter")) {
                FlutterPageActivity.actionStart(context,pageName,params);
                return true;
            } else if (target.equalsIgnoreCase("native")){
                context.startActivity(new Intent(context, NativePageActivity.class));
                return true;
            } else {
                return false;
            }

        } catch (Throwable t) {
            return false;
        }
    }
}
