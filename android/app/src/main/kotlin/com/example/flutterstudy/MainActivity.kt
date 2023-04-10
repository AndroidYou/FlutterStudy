package com.example.flutterstudy

import android.os.Handler
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.*
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.EventChannel.StreamHandler

class MainActivity: FlutterActivity() {
    private var eventSink:EventSink? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        //1.初始化BasicMessageChannel,定义Channel名称
        val messageChannel = BasicMessageChannel<String>(flutterEngine.dartExecutor.binaryMessenger,
            "baseMessageChannel",StringCodec.INSTANCE)
        //2.设置setMessageHandler监听来着Flutter的消息
        messageChannel.setMessageHandler { message, reply ->
            Log.i("flutter", "android receive message form flutter :$message")

        }
       //3. 主动发送消息给Flutter
        messageChannel.send("flutter");

        val eventChannel  = EventChannel(flutterEngine.dartExecutor.binaryMessenger,"eventChannel")
        eventChannel.setStreamHandler(object :StreamHandler{
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                Handler(mainLooper).postDelayed({
                    Log.i("flutter", "android send message")
                    eventSink?.success("Hello Flutter")
                },500)
            }

            override fun onCancel(arguments: Any?) {
            }

        })

        val methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"methodChannel")
        methodChannel.setMethodCallHandler { call, result ->
            if (call.method == "openMethodChannel"){
                val  name = call.argument<String>("name")
                val age = call.argument<Int>("age")
                Log.i("flutter", "android receive form:$name ,$age ")
                result.success("success")
            }

        }
        messageChannel.send("Hello Flutter")



    }
}
