# .github/workflows/pages.yml
name: Build & Deploy (Jekyll)

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      # Build with GitHub’s maintained Jekyll container (no ruby/setup-ruby needed)
      - uses: actions/jekyll-build-pages@v1
        with:
          source: ./
          destination: ./_site
          # Optional: pass a baseurl if you’re on a Project Pages site
          # baseurl: "/${{ github.event.repository.name }}"

      - uses: actions/upload-pages-artifact@v3
        with:
          path: _site

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
