RENAME_SUFFIX=".original"

# Loop through all dotfiles
for file in .*; do
    if [ -f "$file" ]; then
        # Look for existing dotfiles in $HOME and rename them
        EXIST_FILE="$HOME/$file"
        RENAME_FILE="$EXIST_FILE$RENAME_SUFFIX"
        REPO_FILE="$PWD/$file"
        echo "Checking if dotfile already exists at $EXIST_FILE"

        if [ -f $EXIST_FILE ]; then
            echo "$EXIST_FILE already exists!"
            echo "Renaming $EXIST_FILE to $RENAME_FILE"

            mv $EXIST_FILE $RENAME_FILE

            # Link dotfiles to those in the repo
            echo "Linking $EXIST_FILE to $REPO_FILE"

            ln -s $REPO_FILE $EXIST_FILE

            echo "Done!"
        fi

    fi
done
