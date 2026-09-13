#!/usr/bin/env bash
# Fork the three submodules under our account, repoint .gitmodules at our copies,
# and leave each submodule with origin=our fork, upstream=the original.
set -u
export PATH="$PATH:/c/Program Files/nodejs"
cd "$HOME/projects/dsh-tui" || exit 1

declare -A SUBS=(
  ["dsh-auth"]="ccch1mneyyy/dsh-auth"
  ["vendor/dsh-std"]="Yan-Zero/dsh-std"
  ["dsh-ecosystem-spec"]="T-Auto/dsh-ecosystem-spec"
)

echo "=== 1) create forks ==="
for path in "${!SUBS[@]}"; do
  src="${SUBS[$path]}"
  name="${src##*/}"
  echo "-- $src -> FreddieJr-stud/$name"
  gh repo fork "$src" --clone=false 2>&1 | tail -2
done

echo
echo "=== 2) repoint .gitmodules at our forks ==="
for path in "${!SUBS[@]}"; do
  src="${SUBS[$path]}"; name="${src##*/}"
  git config -f .gitmodules "submodule.$path.url" "https://github.com/FreddieJr-stud/$name.git"
  echo "   $path -> https://github.com/FreddieJr-stud/$name.git"
done
git submodule sync --recursive 2>&1 | tail -6

echo
echo "=== 3) inside each submodule: origin = our fork, upstream = original ==="
for path in "${!SUBS[@]}"; do
  src="${SUBS[$path]}"
  ( cd "$path" 2>/dev/null || exit 0
    git remote set-url origin "https://github.com/FreddieJr-stud/${src##*/}.git"
    git remote remove upstream 2>/dev/null
    git remote add upstream "https://github.com/$src.git"
    echo "-- $path"; git remote -v | sed 's/^/     /'
  )
done

echo
echo "=== 4) verify .gitmodules + status ==="
git config -f .gitmodules --get-regexp "submodule\..*\.(path|url)" | sed 's/^/   /'
echo "--- status ---"
git submodule status
echo "--- working tree ---"
git status --short | head -10
