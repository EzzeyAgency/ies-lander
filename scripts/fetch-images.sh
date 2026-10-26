#!/usr/bin/env bash
# Downloads the landing page images into assets/img and compresses large JPGs
# to max 1920px wide and under 400KB. Requires curl and ImageMagick.
set -euo pipefail
cd "$(dirname "$0")/../assets/img"

BASE=https://interactiveenergysystems.com/wp-content/uploads
URLS=(
  "$BASE/2025/12/Interactive-Energy-Systems-White.png"
  "$BASE/2025/09/heading-image-1-scaled.jpg"
  "$BASE/2025/12/Product-Image-1.png"
  "$BASE/2025/01/UL-cert.png"
  "$BASE/2025/10/electric-bill-scaled.jpeg"
  "$BASE/2025/09/analysis-scaled.jpg"
  "$BASE/2025/09/electric-worker-scaled.jpg"
  "$BASE/2025/09/support-scaled.jpg"
  "$BASE/2025/09/electricity-scaled.jpg"
)

if command -v magick >/dev/null; then IM=magick; else IM=convert; fi

for url in "${URLS[@]}"; do
  f=$(basename "$url")
  echo "Downloading $f"
  curl -sSfL -o "$f" "$url"
  case "$f" in
    *.jpg|*.jpeg)
      q=82
      $IM "$f" -resize '1920x>' -strip -interlace Plane -quality $q "$f"
      while [ "$(wc -c <"$f")" -gt 409600 ] && [ $q -gt 40 ]; do
        q=$((q - 6))
        $IM "$f" -strip -interlace Plane -quality $q "$f"
      done
      echo "  -> $(( $(wc -c <"$f") / 1024 ))KB (q=$q)"
      ;;
  esac
done
