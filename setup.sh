#!/usr/bin/bash
RENAME_SUFFIX=".original"

# Loop through all dotfiles
for file in .*; do
    if [ -f "$file" ]; then
        # Look for existing dotfiles in $HOME and rename them
        EXIST_FILE="$HOME/$file"
        RENAME_FILE="$EXIST_FILE$RENAME_SUFFIX"
        REPO_FILE="$PWD/$file"
        echo "Checking if dotfile already exists at $EXIST_FILE"

        if [ -f "$EXIST_FILE" ]; then
            # dotfile already exists
            echo "-- $EXIST_FILE already exists!"

            # check if dotfile is already a symlink
            # apparently double quotes can be nested in bash
            # see: https://unix.stackexchange.com/questions/289574/nested-double-quotes-in-highly-voted-one-liner
            if [ -L "$EXIST_FILE" ] && [ "$(readlink "$EXIST_FILE")" == "$REPO_FILE" ]; then
                echo "-- $EXIST_FILE already points to $REPO_FILE!"
                echo "-- Skipping!"
            else
                echo "-- Renaming $EXIST_FILE to $RENAME_FILE"

                mv "$EXIST_FILE" "$RENAME_FILE"

                # Link dotfiles to those in the repo
                echo "-- Linking $EXIST_FILE to $REPO_FILE"

                ln -s "$REPO_FILE" "$EXIST_FILE"

                echo "-- Done!"
            fi

        fi

    fi
done
