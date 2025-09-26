# Rails + Tailwind + Codespaces Starter (Overlay)

This repo is an **overlay** that bootstraps a fresh Rails app automatically in **GitHub Codespaces**.

## One-time steps (non-dev friendly)
1) Create a new GitHub repo and upload these files (or just upload the ZIP contents).
2) Click **Code → Create codespace**.
3) Wait for setup. The container will run `script/init_rails.sh` to generate a Rails app in-place if missing.

## Daily use
- Click **Run → Rails server** (port 3000 is forwarded).
- Edit files, commit, push. Connect Render and enable auto-deploy with `render.yaml`.

## Deploy
- In Render, create a new Web Service from your repo, add `RAILS_MASTER_KEY`, and deploy.
