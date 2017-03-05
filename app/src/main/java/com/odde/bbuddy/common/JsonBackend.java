package com.odde.bbuddy.common;

import android.content.Context;
import android.support.annotation.NonNull;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;
import com.odde.bbuddy.BuildConfig;
import com.odde.bbuddy.authentication.AuthenticationToken;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

import javax.inject.Inject;
import javax.inject.Singleton;

import static com.android.volley.toolbox.Volley.newRequestQueue;

@Singleton
public class JsonBackend {

    private final RequestQueue requestQueue;
    private final String serverUrl = BuildConfig.SERVER_URL;
    private final AuthenticationToken authenticationToken = new AuthenticationToken();

    @Inject
    public JsonBackend(Context context) {
        requestQueue = newRequestQueue(context);
    }

    public void postRequestForJson(String action, JSONObject request, final Consumer<JSONObject> responseConsumer, final Runnable afterError) {
        addJsonRequestToQueue(Request.Method.POST, action, request, responseConsumer, afterError);
    }

    public void putRequestForJson(String action, JSONObject request, final Consumer<JSONObject> responseConsumer, final Runnable afterError) {
        addJsonRequestToQueue(Request.Method.PUT, action, request, responseConsumer, afterError);
    }

    public void deleteRequestForJson(String action, Consumer<JSONObject> responseConsumer, Runnable afterError) {
        addJsonRequestToQueue(Request.Method.DELETE, action, null, responseConsumer, afterError);
    }

    public void getRequestForJsonArray(String action, final Consumer<JSONArray> responseConsumer) {
        requestQueue.add(new JsonArrayRequest(
                Request.Method.GET, serverUrl + action, null,
                new Response.Listener<JSONArray>() {
                    @Override
                    public void onResponse(JSONArray response) {
                        responseConsumer.accept(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        responseConsumer.accept(new JSONArray());
                    }
                }){
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                return authenticationToken.getHeaders();
            }
            @Override
            protected Response<JSONArray> parseNetworkResponse(NetworkResponse response) {
                authenticationToken.updateByHeaders(response.headers);
                return super.parseNetworkResponse(response);
            }
        });
    }

    private void addJsonRequestToQueue(int method, String action, JSONObject request, Consumer<JSONObject> responseConsumer, Runnable afterError) {
        requestQueue.add(jsonObjectRequest(method, action, request, responseConsumer, afterError));
    }

    @NonNull
    private JsonObjectRequest jsonObjectRequest(final int method, final String action, final JSONObject request, final Consumer<JSONObject> responseConsumer, final Runnable afterError) {
        return new JsonObjectRequest(
                method, serverUrl + action, request,
                new Response.Listener<JSONObject>() {
                    @Override
                    public void onResponse(JSONObject response) {
                        responseConsumer.accept(response);
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        afterError.run();
                    }
                }){
            @Override
            protected Response<JSONObject> parseNetworkResponse(NetworkResponse response) {
                authenticationToken.updateByHeaders(response.headers);
                return super.parseNetworkResponse(response);
            }
            @Override
            public Map<String, String> getHeaders() throws AuthFailureError {
                return authenticationToken.getHeaders();
            }
        };
    }
}
