#!/usr/bin/env bash
set -euo pipefail
: "${DEPLOY_KEY:?DEPLOY_KEY is required}"
umask 077
APP_DIR="${APP_DIR:-/tmp/hbiv2_app}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
rm -rf "$APP_DIR"
mkdir -p "$APP_DIR"
openssl enc -d -aes-256-cbc -pbkdf2 -iter 200000 -in "$HERE/app.enc" -out "$APP_DIR/app.tar.gz" -pass env:DEPLOY_KEY
tar -xzf "$APP_DIR/app.tar.gz" -C "$APP_DIR"
rm -f "$APP_DIR/app.tar.gz"
cd "$APP_DIR"
exec python hbiv2.py
