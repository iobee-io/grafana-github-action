<div align="center">
  <p>
    <h3>grafana in GitHub Actions</h3>
  </p>
  <p>Start a grafana in your GitHub Actions.</p>
</div>

---

## Introduction

This GitHub Action starts a grafana as Docker container.
The published ports, TLS certificates and the grafana configuration can be adjusted as needed.

This is useful when running tests against an grafana.

## Usage

```yaml
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Git checkout
        uses: actions/checkout@v2
  
      - name: Setup grafana
        uses: iobee-io/grafana-github-action@v1
        with:
          version: 'latest'
          ports: '3000:3000'
          container-name: 'grafana'
          gf_security_admin_user: admin
          gf_security_admin_password: password
          gf_auth_anonymous_enabled: "false"
          gf_auth_basic_enabled: "true"
          gf_auth_generic_oauth_enabled: "false"
          gf_auth_proxy_enabled: "false"
          gf_auth_ldap_enabled: "false"
          gf_auth_grafana_enabled: "true"
          gf_auth_grafana_api_key: u4OwnMQmaqcHhwjjhQdtqUSl9OQ8+wE7pQmMq2h3NQn6LBgxPtY8lA1nNHncUepF
      - run: test
```

## License

This action is published under the [MIT license](LICENSE).
