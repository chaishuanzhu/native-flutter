package com.rongzhixin.myapplication;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    public static WeakReference<MainActivity> sRef;

    private TextView mOpenFlutter;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        sRef = new WeakReference<>(this);
        setContentView(R.layout.activity_main);
        mOpenFlutter = findViewById(R.id.open_flutter);
        mOpenFlutter.setOnClickListener(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        sRef.clear();
        sRef = null;
    }

    @Override
    public void onClick(View v) {
        Map params = new HashMap();
        params.put("key","to-Flutter");
        PageRouter.openPageByUrl(this, "page://flutter/first", params);
    }
}
