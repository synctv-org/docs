# Github
## Register application
Go to GitHub's [OAuth application registration address](https://github.com/settings/applications/new).

- `Application name` fill in any value, such as `SyncTV`
- `Homepage URL` fill in `https://<your-domain>`
- `Application description` can be left blank
- `Authorization callback URL` fill in `https://<your-domain>/web/oauth2/callback/github`
- `Enable Device Flow` This function is used to allow users to authorize without a browser. You can leave it unchecked.

After filling in, click the `Register application` button.

<img width="350px" alt="oauth2-github" src="/img/oauth2/oauth2-github.jpg"/>

## Get Client ID and Client Secret
After successful registration, the page will jump to the application details page, where you can see `Client ID` and `Client Secret`.

If the jump fails, you can find the application you just created in [OAuth Application List](https://github.com/settings/developers) and click to enter the details page.

The `Client ID` can be viewed and copied at any time.

When creating an application for the first time, the `Client Secret` is empty and needs to be generated by clicking the `Generate a new client secret` button.

`Client Secret` can only be viewed once. If you forget it, you can click the `Generate a new client secret` button to regenerate it.

<img width="350px" alt="oauth2-github-client" src="/img/oauth2/oauth2-github-client.jpg"/>

## Fill in the configuration
Fill in `client_id` and `client_secret` in `config.yaml`.

```yaml
oauth2:
     providers:
         github:
             client_id: xxxxxx
             client_secret: xxxxxx
             redirect_url: ""
```

`redirect_url` does not need to be filled in, because each application of `github` only supports one `redirect_url`.