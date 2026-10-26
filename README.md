# IES PPC Landing Page

Static, single-page PPC landing page for Interactive Energy Systems (IES), promoting the Demand Automation Computer with a free savings estimate lead form.

## Structure

- `index.html`: the full page (inline CSS, Google Fonts)
- `assets/img/`: local images referenced by the page
- `scripts/fetch-images.sh`: downloads the images from interactiveenergysystems.com and compresses JPGs to max 1920px wide and under 400KB (needs curl and ImageMagick)
- `vercel.json`: Vercel config with clean URLs enabled

## Setup

```bash
./scripts/fetch-images.sh
```

## Preview locally

```bash
npx serve .
```

## Deploy

**Vercel (CLI):** `npx vercel` for a preview, `npx vercel --prod` for production.

**Vercel (Git):** import this repo at vercel.com/new. No build command or output directory is needed.

Any static host (Netlify, Cloudflare Pages, S3) also works by serving the repo root.
