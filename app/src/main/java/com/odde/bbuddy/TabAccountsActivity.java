package com.odde.bbuddy;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.ListFragment;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.odde.bbuddy.account.Account;
import com.odde.bbuddy.account.Accounts;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import java.util.List;


public class TabAccountsActivity extends ListFragment {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showAllAccounts();
    }

    @Override
    public void onListItemClick(ListView listView, View v, int position, long id) {
        Intent intent = new Intent(getActivity(), EditAccountActivity.class);
        intent.putExtra("account", (Account)listView.getItemAtPosition(position));
        startActivity(intent);
    }

    private void showAllAccounts() {
        new Accounts(new JsonBackend(getActivity())).processAllAccounts(new Consumer<List<Account>>() {
            @Override
            public void accept(List<Account> accounts) {
                setListAdapter(new ArrayAdapter<>(getActivity(), android.R.layout.simple_list_item_1, accounts.toArray(new Account[]{})));
            }
        });
    }

}
