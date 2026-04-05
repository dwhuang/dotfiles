# Directories to prepend to PATH (earlier = higher priority)
path_candidates=(
    ~/.bin
    ~/.local/bin
)

typeset -U path   # keep entries unique
for p in ${(Oa)path_candidates}; do
    [[ -d $p ]] && path=($p $path)
done
unset path_candidates p

export EDITOR=code