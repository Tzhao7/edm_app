package com.example.edm_app;




import android.content.Intent;


import com.spotify.sdk.android.auth.AuthorizationClient;
import com.spotify.sdk.android.auth.AuthorizationRequest;
import com.spotify.sdk.android.auth.AuthorizationResponse;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String SPOTIFY_CHANNEL = "com.spotify";
    public static final String CLIENT_ID = "0c5be0c916f1499e8bab86b32acfc7b6";
    private static final int REQUEST_CODE = 1337;
    private static final String REDIRECT_URI = "edm-app://callback";

    private static MethodChannel methodChannel;
    private String code;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        setupChannel(this, flutterEngine.getDartExecutor().getBinaryMessenger());
    }

    private void setupChannel(MainActivity context, BinaryMessenger messenger) {
        methodChannel = new MethodChannel(messenger, SPOTIFY_CHANNEL);
        methodChannel.setMethodCallHandler(
                        (call, result) -> {
                            if (call.method.equals("authenticateUser")) {
                                authenticateUser();
                            } else {
                                result.notImplemented();
                            }
                        }
                );
    }

    private AuthorizationRequest getAuthenticationRequest(AuthorizationResponse.Type type) {
        return new AuthorizationRequest.Builder(CLIENT_ID, type, REDIRECT_URI)
                .setScopes(new String[]{"user-library-read", "user-read-recently-played", "user-top-read"})
                .build();
    }

    void authenticateUser() {
        final AuthorizationRequest request = getAuthenticationRequest(AuthorizationResponse.Type.CODE);
        AuthorizationClient.openLoginActivity(this, REQUEST_CODE, request);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent intent) {
        super.onActivityResult(requestCode, resultCode, intent);
        if (requestCode == REQUEST_CODE) {
            AuthorizationResponse response = AuthorizationClient.getResponse(resultCode, intent);
            if (response.getError() != null && !response.getError().isEmpty()) {
                System.out.println(response.getError());
            } else {
                switch (response.getType()) {
                    case CODE:
                        code = response.getCode();
                        methodChannel.invokeMethod("ReceiveFromAndroid", code);
                        break;
                    case ERROR:

                        break;
                    default:

                }
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
    }
}
