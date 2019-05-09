package com.rongzhixin.myapplication;

import android.content.DialogInterface;
import android.support.v7.app.AlertDialog;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 * @ClassName: MessageChannel
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 17:55
 */
class MessageChannel {

    public static void onMethodCall(MethodCall call, MethodChannel.Result result) {
        if (call.method.equals("getUserID")) {
            result.success("userId: " + "10086");
        } else if (call.method.equals("sendData")) {
            result.success(call.arguments);
        } else if (call.method.equals("showDialog")) {
            AlertDialog.Builder dialog = new AlertDialog.Builder(MyApplication.getActivity());
            dialog.setTitle("This is Dialod");
            dialog.setMessage("Something important");
            dialog.setCancelable(false);
            dialog.setPositiveButton("OK", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    result.success(call.arguments);
                }
            });
            dialog.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    Map map = new HashMap();
                    map.put("key","cancel");
                    result.success(map);
                }
            });
            dialog.show();

        } else {
            result.notImplemented();
        }
    }
}
