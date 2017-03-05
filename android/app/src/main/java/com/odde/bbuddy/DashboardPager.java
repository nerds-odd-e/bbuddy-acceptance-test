package com.odde.bbuddy;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;

import com.odde.bbuddy.account.view.ShowAllAccountsActivity;


public class DashboardPager extends FragmentStatePagerAdapter {

    //integer to count number of tabs
    int tabCount;

    //Constructor to the class
    public DashboardPager(FragmentManager fm, int tabCount) {
        super(fm);
        //Initializing tab count
        this.tabCount= tabCount;
    }

    //Overriding method getItem
    @Override
    public Fragment getItem(int position) {
        //Returning the current tabs
        switch (position) {
            case 0:
                TabDashboardActivity tabDashboard = new TabDashboardActivity();
                return tabDashboard;
            case 1:
                ShowAllAccountsActivity tabAccounts = new ShowAllAccountsActivity();
                return tabAccounts;
            default:
                return null;
        }
    }

    //Overriden method getCount to get the number of tabs
    @Override
    public int getCount() {
        return tabCount;
    }
}
