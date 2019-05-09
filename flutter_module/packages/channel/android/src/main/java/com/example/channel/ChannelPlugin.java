package com.example.channel;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;

/** ChannelPlugin */
public class ChannelPlugin implements MethodCallHandler {

  private static ChannelPlugin sInstance = null;

  public static synchronized void init(Channel channel) {
    if (sInstance == null) {
      sInstance = new ChannelPlugin(channel);
    }
  }

  private final Channel mChannel;

  private ChannelPlugin(Channel channel) {
    mChannel = channel;
  }

  /** Plugin registration. */
  public static void registerWith(Registrar registrar) {
    final MethodChannel channel = new MethodChannel(registrar.messenger(), "channel");
    channel.setMethodCallHandler(sInstance);
  }

  @Override
  public void onMethodCall(MethodCall call, Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("sendData")) {
      result.success(call.arguments);
    } else {
      sInstance.mChannel.onMethodCall(call, result);
//      result.notImplemented();
    }
  }
}
