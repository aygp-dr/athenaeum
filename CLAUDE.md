#+TITLE: Athenaeum - GitHub Pages Project
#+AUTHOR: aygp-dr
#+DATE: [2025-01-24 Fri]
#+PROPERTY: header-args :mkdirp yes

* Project Overview

This repository demonstrates GitHub Pages functionality for creating sites and blogs from GitHub repositories.

* Available Commands

The Makefile provides the following commands for project management:

** Development Commands
- =make setup= :: Install dependencies for local development
- =make serve= :: Serve the site locally for development with live reload
- =make build= :: Build the site for production
- =make clean= :: Clean build artifacts

** Deployment Commands  
- =make deploy= :: Build and prepare for GitHub Pages deployment
- =make status= :: Check GitHub Pages deployment status

** Documentation Commands
- =make docs= :: Display documentation information
- =make help= :: Show all available commands with descriptions

* GitHub Pages Setup

** Step 1: Enable GitHub Pages

1. Navigate to repository Settings
2. Click Pages in the Code and automation section
3. Select "Deploy from a branch" from Source dropdown
4. Select =main= from Branch dropdown
5. Click Save button
6. Wait approximately one minute for deployment

** Verification

After setup, the site will be available at the GitHub Pages URL. Use =make status= to check deployment status.

* Development Workflow

#+begin_src bash :eval no
# Setup development environment
make setup

# Start local development server
make serve

# Build for production
make build

# Deploy changes
git add .
git commit -m "feat: update content"
git push origin main
#+end_src

* Notes

- GitHub Actions automatically handles deployment when changes are pushed to main branch
- Initial deployment may take up to one minute
- Subsequent deployments typically complete in about 20 seconds
- Use =make help= to see all available commands
EOF < /dev/null
