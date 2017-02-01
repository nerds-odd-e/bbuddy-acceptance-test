package com.odde.bbuddy;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ListFragment;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import com.odde.bbuddy.account.Account;
import com.odde.bbuddy.account.Accounts;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.common.JsonBackend;

import java.util.ArrayList;
import java.util.List;


public class TabAccountsActivity extends ListFragment {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        showAllAccounts();
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {
        startActivity(new Intent(getActivity(), EditAccountActivity.class));
    }

    private void showAllAccounts() {
        new Accounts(new JsonBackend(getActivity())).processAllAccounts(new Consumer<List<Account>>() {
            @Override
            public void accept(List<Account> accounts) {
                setListAdapter(new ArrayAdapter<>(getActivity(), android.R.layout.simple_list_item_1, presentableAccountsFrom(accounts)));
            }
        });
    }

    @NonNull
    private String[] presentableAccountsFrom(List<Account> allAccounts) {
        final List<String> result = new ArrayList<>();

        for (Account account : allAccounts) {
            result.add(account.getName() + " " + account.getBalanceBroughtForward());
        }

        return result.toArray(new String[]{});
    }

}
