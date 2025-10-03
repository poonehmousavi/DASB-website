name: Build & Deploy (Docker → GitHub Pages)

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

# For project pages (https://user.github.io/<repo>), set baseurl:
# env:
#   JEKYLL_BASEURL: "/${{ github.event.repository.name }}"
env:
  JEKYLL_BASEURL: ""   # user/org root pages → leave empty

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: Build site image (your Dockerfile)
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          build-args: |
            JEKYLL_BASEURL=${{ env.JEKYLL_BASEURL }}
          tags: site-builder:latest
          load: true

      - name: Extract built static site
        shell: bash
        run: |
          set -e
          id=$(docker create site-builder:latest)
          # If your final stage copies to /usr/share/nginx/html/$JEKYLL_BASEURL
          SRC="/usr/share/nginx/html${JEKYLL_BASEURL}"
          mkdir -p _site
          docker cp "$id:${SRC}/." _site
          docker rm -v "$id"
          # ensure GitHub Pages serves as static, no Jekyll
          touch _site/.nojekyll

      - name: Upload artifact for Pages
        uses: actions/upload-pages-artifact@v3
        with:
          path: _site

  deploy:
    needs: build
    runs-on: ubuntu-latest
    environment:
      name: github-pages
    steps:
      - uses: actions/deploy-pages@v4
