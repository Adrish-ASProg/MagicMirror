#!/bin/bash
Install() {
    name="$1"
    url="$2"

    if [ ! -d "$name" ]; then
        echo "Installing $name.."
        git clone "$url" --quiet
        cd "$name" || exit 1
        npm install --production --quiet --silent
        cd ..
        echo "$name installed."
    else
        echo "$name already installed."
    fi
}

cd ~/MagicMirror/modules
configFile="../setup/modules"

while IFS="=" read -r name url || [[ -n "$name" ]]; do
    if [[ -n "$name" && -n "$url" ]]; then
        Install "$name" "$url"
    fi
done < "$configFile"

cd ..

exit 0
