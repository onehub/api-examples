package com.onehub;

import org.apache.oltu.oauth2.client.OAuthClient;
import org.apache.oltu.oauth2.client.URLConnectionClient;
import org.apache.oltu.oauth2.client.request.OAuthClientRequest;
import org.apache.oltu.oauth2.client.response.OAuthJSONAccessTokenResponse;
import org.apache.oltu.oauth2.common.message.types.GrantType;
import org.apache.oltu.oauth2.common.OAuth.HttpMethod;


/**
 * Onehub API Example
 * OAuth2 Password Grant
 */
public class Oauth2
{

    public static final String TOKEN_URL     = "https://ws-api.onehub.com/oauth/token";
    public static final String CLIENT_ID     = "asdf123";
    public static final String CLIENT_SECRET = "123asd";
    public static final String USERNAME      = "yourusername@example.com";
    public static final String PASSWORD      = "password";
    public static final String REDIRECT_URL  = "https://localhost";

    public static void main( String[] args )
    {
        try {
            OAuthClient client = new OAuthClient(new URLConnectionClient());

            OAuthClientRequest request = OAuthClientRequest
                    .tokenLocation(TOKEN_URL)
                    .setGrantType(GrantType.PASSWORD)
                    .setClientId(CLIENT_ID)
                    .setClientSecret(CLIENT_SECRET)
                    .setUsername(USERNAME)
                    .setPassword(PASSWORD)
                    .setRedirectURI(REDIRECT_URL)                         
                    .buildBodyMessage();

            String token =
                    client.accessToken(request, HttpMethod.POST)
                    .getAccessToken();

            System.out.println(token);
        } catch (Exception exn) {
            exn.printStackTrace();
        }
    }
}
