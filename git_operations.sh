#!/bin/bash
cd /Users/tady/workspace/github.com/tasogare0919/dotfiles

echo "=== Git Status ==="
git status

echo -e "\n=== Adding all changes ==="
git add -A

echo -e "\n=== Creating commit ==="
git commit -m "$(cat <<'EOF'
Update dotfiles for June 2025

- Update Brewfile: Remove outdated packages (Python 3.8/3.9, Node 16, docker-machine)
- Update aqua.yaml: Upgrade aqua-registry to v4.379.0
- Update VSCode extensions list: Merge and organize extensions
- Add starship to Brewfile

🤖 Generated with [Claude Code](https://claude.ai/code)

Co-Authored-By: Claude <noreply@anthropic.com>
EOF
)"

echo -e "\n=== Pushing branch ==="
git push -u origin update-dotfiles-2025-06

echo -e "\n=== Creating pull request ==="
gh pr create --title "Update dotfiles for June 2025" --body "$(cat <<'EOF'
## Summary
- Remove outdated packages from Brewfile (Python 3.8/3.9, Node 16, docker-machine)
- Upgrade aqua-registry to v4.379.0 in aqua.yaml
- Merge and organize VSCode extensions list
- Add starship to Brewfile

## Test plan
- [ ] Verify Brewfile installs correctly
- [ ] Verify aqua.yaml is valid
- [ ] Verify VSCode extensions list is properly formatted

🤖 Generated with [Claude Code](https://claude.ai/code)
EOF
)"