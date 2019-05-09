package com.rongzhixin.myapplication;

/**
 * @ClassName: NativePageActivity
 * @Description: [一句话描述该类的功能]
 * @Author: shibasenhashira
 * @Email: 870027381@qq.com
 * @CreateDate: 2019-05-09 10:07
 */
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.TextView;

import java.util.HashMap;
import java.util.Map;

public class NativePageActivity extends AppCompatActivity implements View.OnClickListener {

    private TextView mOpenFlutter;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main);

        mOpenFlutter = findViewById(R.id.open_flutter);

        mOpenFlutter.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {

        Map params = new HashMap();
        params.put("key","to-Flutter");
        PageRouter.openPageByUrl(this, "page://flutter/second", params);
    }
}