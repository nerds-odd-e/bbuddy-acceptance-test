package com.odde.bbuddy.account.view;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;

import com.odde.bbuddy.R;
import com.odde.bbuddy.account.viewmodel.EditableAccount;

import org.robobinding.ViewBinder;

import javax.inject.Inject;

import static com.odde.bbuddy.di.component.ActivityComponentFactory.createActivityComponentBy;

public class AddAccountActivity extends AppCompatActivity {

    @Inject
    EditableAccount account;

    @Inject
    ViewBinder viewBinder;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        createActivityComponentBy(this).inject(this);

        setContentView(viewBinder.inflateAndBind(R.layout.activity_add_account, account));
    }

}
