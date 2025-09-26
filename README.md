# Rails + Tailwind + Codespaces Starter (Overlay)

This repo is an **overlay** that bootstraps a fresh Rails app automatically in **GitHub Codespaces**.

## Steps
1) Click the URL: https://github.com/new?template_owner=GovPossible&template_name=ror_codespace_template
2) Name and setup your repo.
2) Click **Code → Create codespace**.
3) Wait for setup. The container will run `script/init_rails.sh` to generate a Rails app in-place if missing.

## Daily use
- Run `bin\dev` in terminal
- Edit files, commit, push. Connect Render and enable auto-deploy with `render.yaml`.

## Deploy
- In Render, create a new Web Service from your repo, add `RAILS_MASTER_KEY`, and deploy.
