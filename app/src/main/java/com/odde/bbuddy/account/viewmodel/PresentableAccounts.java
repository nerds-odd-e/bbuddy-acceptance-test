package com.odde.bbuddy.account.viewmodel;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.EditDeleteAccountNavigation;
import com.odde.bbuddy.common.Consumer;
import com.odde.bbuddy.di.scope.ActivityScope;

import org.robobinding.annotation.ItemPresentationModel;
import org.robobinding.annotation.PresentationModel;
import org.robobinding.presentationmodel.HasPresentationModelChangeSupport;
import org.robobinding.presentationmodel.PresentationModelChangeSupport;
import org.robobinding.widget.adapterview.ItemClickEvent;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import dagger.Lazy;

@PresentationModel
@ActivityScope
public class PresentableAccounts implements HasPresentationModelChangeSupport {

    private final Lazy<PresentationModelChangeSupport> changeSupportLazyLoader;
    private final Accounts accounts;
    private final EditDeleteAccountNavigation editDeleteAccountNavigation;
    private final List<Account> allAccounts = new ArrayList<>();

    @Inject
    public PresentableAccounts(Accounts accounts, EditDeleteAccountNavigation editDeleteAccountNavigation, @Named("accounts") Lazy<PresentationModelChangeSupport> changeSupportLazyLoader) {
        this.accounts = accounts;
        this.editDeleteAccountNavigation = editDeleteAccountNavigation;
        this.changeSupportLazyLoader = changeSupportLazyLoader;
        refresh();
    }

    private PresentationModelChangeSupport changeSupport() {
        return this.changeSupportLazyLoader.get();
    }

    @ItemPresentationModel(value = PresentableAccount.class)
    public List<Account> getAccounts() {
        return allAccounts;
    }

    public void updateAccount(ItemClickEvent event) {
        editDeleteAccountNavigation.navigate(accountOf(event));
    }

    private Account accountOf(ItemClickEvent event) {
        return allAccounts.get(event.getPosition());
    }

    @Override
    public PresentationModelChangeSupport getPresentationModelChangeSupport() {
        return changeSupport();
    }

    public void refresh() {
        accounts.processAllAccounts(new Consumer<List<Account>>() {
            @Override
            public void accept(List<Account> list) {
                allAccounts.clear();
                allAccounts.addAll(list);
                changeSupport().refreshPresentationModel();
            }
        });
    }
}
