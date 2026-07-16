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
- Pre-commit hooks (`.pre-commit-config.yaml`): actionlint, gitleaks, hadolint
  (Dockerfile linting), markdownlint-cli2.

## CI/CD

- `docker-publish.yml`: builds the image, tests it, and pushes to Docker Hub
  (`chorrell/http`) and GHCR (`ghcr.io/chorrell/http`) on merge to `main`.
- `shellcheck.yml`: lints shell scripts on PRs.

## Contributing

1. Branch from `main`.
2. Run `pre-commit run --all-files` before committing.
3. Verify locally: `docker build -t http . && docker run -it --rm http --version`.
4. Open a PR; CI runs the build/test and shellcheck workflows.
