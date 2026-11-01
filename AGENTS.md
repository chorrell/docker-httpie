# AGENTS.md

A minimal Docker image wrapping [HTTPie](https://httpie.io), based on Alpine
(`apk add httpie`).

## Project Layout

```text
.
├── Dockerfile              # Alpine + httpie (py3-setuptools + httpie)
├── docker-entrypoint.sh    # ENTRYPOINT script
├── README.md
├── .pre-commit-config.yaml
└── .github/workflows/
    ├── docker-publish.yml  # Build, test, push to Docker Hub + GHCR
    └── shellcheck.yml      # Lints docker-entrypoint.sh
```

## Build / Run Commands

```bash
docker build -t http .
docker run -it --rm http                             # usage
docker run -it --rm http --version
docker run -it --rm http --headers https://horrell.ca
```

## Code Style

- Dockerfile uses `RUN set -ex` and `COPY --link` for cache-friendly layers.
- `# hadolint ignore=DL3018` is used where an apk package can't be pinned
  practically; keep such ignores scoped to the specific line.
- Pre-commit hooks (`.pre-commit-config.yaml`): gitleaks, hadolint
  (Dockerfile linting), markdownlint-cli2, zizmor. zizmor is the GitHub
  Actions workflow linter; actionlint isn't used because it rejects GitHub's
  `$/` self-repository `uses:` syntax
  ([rhysd/actionlint#711](https://github.com/rhysd/actionlint/issues/711)).

## CI/CD

- `docker-publish.yml`: builds the image, tests it, and pushes to Docker Hub
  (`chorrell/http`) and GHCR (`ghcr.io/chorrell/http`) on merge to `main`,
  with provenance attestations in both. It calls the shared
  [chorrell/workflows](https://github.com/chorrell/workflows) `docker-publish`
  workflow; GHCR uses `GITHUB_TOKEN`, so the `http` package must grant this
  repo write access (Package settings → Manage Actions access).
- `shellcheck.yml`: lints shell scripts on PRs (shared `shell-lint` workflow).

## Contributing

1. Branch from `main`.
2. Run `prek run --all-files` before committing.
3. Verify locally: `docker build -t http . && docker run -it --rm http --version`.
4. Open a PR; CI runs the build/test and shellcheck workflows.
