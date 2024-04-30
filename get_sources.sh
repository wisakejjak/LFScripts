#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi
target_dir="$1"
mkdir -vp "$target_dir/sources"
chmod -v a+wt "$target_dir/sources"
cd "$target_dir/sources" || exit
if [ -f "wget_sources" ]; then
    wget --input-file=wget_sources --continue
fi
chown root:root $target_dir/sources/*
echo "Job done."
