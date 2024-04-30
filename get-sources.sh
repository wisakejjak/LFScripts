#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi
target_dir="$1"
mkdir -vp "$target_dir/sources"
chmod -v a+wt "$target_dir/sources"
cd "$target_dir/sources" || exit 1
if [ ! -f "wget_sources" ]; then
	echo "File wget_sources not found... Downloading"
	curl https://raw.githubusercontent.com/wisakejjak/LFScripts/main/wget_sources -o wget_sources
	if [ -f "wget_sources" ]; then
		echo "File wget_sources downloaded successfully."

	else
		echo "File wget_sources not downloaded... Exiting"
		exit 1
	fi
fi
wget --input-file=wget_sources --continue
chown root:root "$PWD/"*
echo "Job done."
