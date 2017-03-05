package com.odde.bbuddy.account.viewmodel;

import android.support.annotation.NonNull;

import com.odde.bbuddy.account.model.Accounts;
import com.odde.bbuddy.account.view.EditDeleteAccountNavigation;
import com.odde.bbuddy.common.Consumer;

import org.junit.Before;
import org.junit.Test;
import org.mockito.invocation.InvocationOnMock;
import org.mockito.stubbing.Answer;
import org.robobinding.presentationmodel.PresentationModelChangeSupport;
import org.robobinding.widget.adapterview.ItemClickEvent;

import java.util.List;

import dagger.Lazy;

import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

public class PresentableAccountsTest {

    Accounts mockAccounts = mock(Accounts.class);
    EditDeleteAccountNavigation mockEditDeleteAccountNavigation = mock(EditDeleteAccountNavigation.class);
    Lazy<PresentationModelChangeSupport> mockChangeSupportLazyLoader = mock(Lazy.class);
    PresentationModelChangeSupport mockPresentationModelChangeSupport = mock(PresentationModelChangeSupport.class);
    private final Account account = new Account() {{ setId(1); setName("name"); setBalanceBroughtForward(100); }};

    @Before
    public void given_lazy_loader_will_return_change_support() {
        when(mockChangeSupportLazyLoader.get()).thenReturn(mockPresentationModelChangeSupport);
    }

    @Test
    public void get_all_accounts() {
        given_accounts_will_return(asList(account));

        assertEquals(asList(account), createPresentableAccounts().getAccounts());
    }

    @Test
    public void refresh_presentation_model() {
        given_accounts_will_return(asList(account));

        createPresentableAccounts();

        verify(mockPresentationModelChangeSupport).refreshPresentationModel();
    }
    
    @Test
    public void update_account_should_navigate_to_edit_delete_view() {
        given_accounts_will_return(asList(account));

        createPresentableAccounts().updateAccount(stubItemClickEventAtPosition(0));

        verify(mockEditDeleteAccountNavigation).navigate(account);
    }

    @NonNull
    private ItemClickEvent stubItemClickEventAtPosition(int position) {
        ItemClickEvent stubItemContext = mock(ItemClickEvent.class);
        when(stubItemContext.getPosition()).thenReturn(position);
        return stubItemContext;
    }

    private void given_accounts_will_return(final List<Account> allAccounts) {
        doAnswer(new Answer() {
            @Override
            public Object answer(InvocationOnMock invocation) throws Throwable {
                Consumer consumer = invocation.getArgument(0);
                consumer.accept(allAccounts);
                return null;
            }
        }).when(mockAccounts).processAllAccounts(any(Consumer.class));
    }

    private PresentableAccounts createPresentableAccounts() {
        return new PresentableAccounts(mockAccounts, mockEditDeleteAccountNavigation, mockChangeSupportLazyLoader);
    }

}