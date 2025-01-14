#!/bin/bash
set -eu

YEAR=$(date +%Y)
echo "Updating global copyright strings..."
sed -re 's/(Copyright.*2[0-9]{3}-)[0-9]{4}/\1'$YEAR'/g' -i src/res/translation/*.ts src/util.cpp src/aboutdlgbase.ui

echo "Updating copyright comment headers..."
for file in $(find android ios linux mac src windows -regex '.*\.\(cpp\|h\|mm\)' -not -regex '\./\(\.git\|libs/\|moc_\|ui_\).*'); do
		sed -re 's/(\*.*Copyright.*[^-][0-9]{4})(\s*-\s*\b[0-9]{4})?\s*$/\1-'${YEAR}'/' -i "${file}"
done
