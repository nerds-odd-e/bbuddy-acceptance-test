package com.odde.bbuddy;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.odde.bbuddy.account.Account;
import com.odde.bbuddy.account.Accounts;
import com.odde.bbuddy.common.JsonBackend;

import static android.view.View.OnClickListener;

public class AddAccountActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_account);

        Button confirmButton = (Button) findViewById(R.id.confirm);
        confirmButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View v) {
                EditText name = (EditText) findViewById(R.id.name);
                EditText balanceBroughtForward = (EditText) findViewById(R.id.balanceBroughtForward);

                new Accounts(new JsonBackend(getApplicationContext())).addAccount(new Account(name.getText().toString(), Integer.parseInt(balanceBroughtForward.getText().toString())), new Runnable() {
                    @Override
                    public void run() {
                        Intent intent = new Intent(getApplicationContext(), DashboardActivity.class);
                        intent.putExtra("tabPosition", 1);
                        startActivity(intent);
                    }
                });
            }
        });
    }
}
