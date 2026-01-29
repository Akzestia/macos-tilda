#!/bin/bash
echo "==> Building MacOSTilda..."
cmake -S . -B build -G Ninja && ninja -C build

if [ $? -ne 0 ]; then
    echo "Error: Build failed."
    exit 1
fi

echo ""
read -r -p "Install macos-tilda? [Y/n] " input

case $input in
    [yY][eE][sS]|[yY]|"")
        echo "==> Installing to /usr/local/bin..."s
        sudo cmake --install build

        echo "Successfully installed! You may need to grant Accessibility permissions in System Settings."
        ;;
    [nN][oO]|[nN])
        echo "Installation skipped."
        ;;
    *)
        echo "Invalid input. Installation skipped."
        ;;
esac
