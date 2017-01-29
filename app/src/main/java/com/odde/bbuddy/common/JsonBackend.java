package com.odde.bbuddy.common;

import android.content.Context;

import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonArrayRequest;
import com.android.volley.toolbox.JsonObjectRequest;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Map;

import static com.android.volley.toolbox.Volley.newRequestQueue;

public class JsonBackend {

    private final RequestQueue requestQueue;
    private final String rootUrl = "http://10.0.3.2:3000";

    public JsonBackend(Context context) {
        requestQueue = newRequestQueue(context);
    }

    public void postRequestForJson(
            String action,
            JSONObject request,
            final Consumer<JSONObject> responseConsumer,
            final Runnable afterError,
            final Consumer<Map<String, String>> headerConsumer) {
        requestQueue.add(new JsonObjectRequest(
                Request.Method.POST, rootUrl + action, request,
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
                headerConsumer.accept(response.headers);
                return super.parseNetworkResponse(response);
            }
        });
    }

    public void getRequestForJsonArray(String action, final Map<String, String> headers, final Consumer<JSONArray> responseConsumer) {
        requestQueue.add(new JsonArrayRequest(
                Request.Method.GET, rootUrl + action, null,
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
                return headers;
            }
        });
    }
}
