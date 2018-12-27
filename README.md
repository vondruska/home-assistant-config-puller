# home-assistant-config-puller

Exposes the ability for GitLab CI/CD to "deploy" the latest Home Assistant configuration. Which really is pulling master at this point. The next phase is to accept the commit hash from the webhook and pull the correct deployed version

Uses the `vondruska/webhook-script-runner` image. 

## Getting Git to work without a home directory

When specifying the user to run the image as, we lose a (sane) home directory. Git expects to have a home directory which can cause weird issues. Git supports using configurations from `$XDG_CONFIG_HOME`. In the base image, that environment variable is set to `/config`.

## Handling Git auth

This uses [`git-credential-store`](https://git-scm.com/docs/git-credential-store). `git-credential-store` reads the necessary from `$XDG_CONFIG_HOME/git/credentials`¹. Upon container startup, it will write the credential necessary to execute the pull into `$XDG_CONFIG_HOME/git/credentials`. Upon a webhook execution, Git will execute a pull on the repo and lookup the correct credentials in the `$XDG_CONFIG_HOME/git/credentials`.

Couple of words on security. No secrets should be committed into the repository (especially, `TOKEN` and `GIT_PASSWORD`). Set the environment variables ahead of time and pipe them into this image.

¹ [`git-credential-store` search paths](https://git-scm.com/docs/git-credential-store#FILES)