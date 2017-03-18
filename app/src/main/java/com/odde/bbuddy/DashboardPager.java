package com.odde.bbuddy;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentStatePagerAdapter;
import android.widget.TextView;

import com.odde.bbuddy.account.view.ShowAllAccountsActivity;
import com.odde.bbuddy.budget.view.ShowAllBudgetsActivity;


public class DashboardPager extends FragmentStatePagerAdapter {

    //integer to count number of tabs
    int tabCount;
    private final DashboardActivity dashboardActivity;

    //Constructor to the class
    public DashboardPager(FragmentManager fm, int tabCount, DashboardActivity dashboardActivity) {
        super(fm);
        //Initializing tab count
        this.tabCount= tabCount;
        this.dashboardActivity = dashboardActivity;
    }

    //Overriding method getItem
    @Override
    public Fragment getItem(int position) {
        TextView add = (TextView) dashboardActivity.findViewById(R.id.add);
        //Returning the current tabs
        switch (position) {
            case 0:
                return new TabDashboardActivity();
            case 1:
                return new ShowAllAccountsActivity();
            case 2:
                return new ShowAllBudgetsActivity();
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
