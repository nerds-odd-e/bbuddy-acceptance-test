package com.odde.bbuddy.account.view;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.odde.bbuddy.R;
import com.odde.bbuddy.account.viewmodel.PresentableAccounts;

import org.robobinding.ViewBinder;

import javax.inject.Inject;

import static com.odde.bbuddy.di.component.ActivityComponentFactory.createActivityComponentBy;


public class ShowAllAccountsActivity extends Fragment {

    @Inject
    PresentableAccounts presentableAccounts;

    @Inject
    ViewBinder viewBinder;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        createActivityComponentBy(getActivity()).inject(this);
    }

    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return viewBinder.inflateAndBindWithoutAttachingToRoot(R.layout.activity_adapter_view, presentableAccounts, container);
    }

}
