# HBIV2 encrypted deployment payload

This repository contains only an AES-256 encrypted application archive. The decryption key is stored exclusively in the Render service secret environment (`DEPLOY_KEY`). No application source, tokens, or credentials are plaintext here.

Render:
- Build: `pip install -r requirements.txt`
- Start: `bash start.sh`
