package com.odde.bbuddy.account.viewmodel;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.ShowAllAccountsNavigation;

import org.robobinding.annotation.PresentationModel;

import javax.inject.Inject;
import javax.inject.Singleton;

@PresentationModel
@Singleton
public class EditableAccount {

    private final Accounts accounts;
    private final ShowAllAccountsNavigation showAllAccountsNavigation;

    private String name;
    private int balanceBroughtForward;
    private int id;

    @Inject
    public EditableAccount(Accounts accounts, ShowAllAccountsNavigation showAllAccountsNavigation) {
        this.accounts = accounts;
        this.showAllAccountsNavigation = showAllAccountsNavigation;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBalanceBroughtForwardForView() {
        return String.valueOf(balanceBroughtForward);
    }

    public void setBalanceBroughtForwardForView(String balanceBroughtForward) {
        try {
            this.balanceBroughtForward = Integer.parseInt(balanceBroughtForward);
        } catch (NumberFormatException e) {

        }
    }

    public void add() {
        Account account = new Account();
        account.setName(name);
        account.setBalanceBroughtForward(balanceBroughtForward);
        accounts.addAccount(account, new Runnable() {
            @Override
            public void run() {
                showAllAccountsNavigation.navigate();
            }
        });
    }

    public void setBalanceBroughtForward(int balanceBroughtForward) {
        this.balanceBroughtForward = balanceBroughtForward;
    }

    public int getBalanceBroughtForward() {
        return balanceBroughtForward;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void update() {
        Account account = new Account();
        account.setId(id);
        account.setName(name);
        account.setBalanceBroughtForward(balanceBroughtForward);
        accounts.editAccount(account, new Runnable() {
            @Override
            public void run() {
                showAllAccountsNavigation.navigate();
            }
        });
    }

    public void delete() {
        Account account = new Account();
        account.setId(id);
        accounts.deleteAccount(account, new Runnable() {
            @Override
            public void run() {
                showAllAccountsNavigation.navigate();
            }
        });
    }

}
