#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Define the name of the virtual environment directory
VENV_DIR=".venv"

# Function to create virtual environment and install mkdocs
setup_env() {
    # Check if virtual environment directory already exists
    if [ -d "$VENV_DIR" ]; then
        echo "Virtual environment '$VENV_DIR' already exists."
    else
        echo "Creating virtual environment '$VENV_DIR'..."
        python3 -m venv $VENV_DIR
    fi

    # Detect the operating system
    OS=$(uname -s)

    # Activate virtual environment
    if [ "$OS" = "Linux" ] || [ "$OS" = "Darwin" ]; then
        echo "Activating virtual environment for Unix-based system..."
        source $VENV_DIR/bin/activate
    elif [[ "$OS" == CYGWIN* ]] || [[ "$OS" == MINGW* ]] || [[ "$OS" == MSYS* ]]; then
        echo "Activating virtual environment for Windows..."
        source $VENV_DIR/Scripts/activate
    else
        echo "Unsupported OS: $OS"
        exit 1
    fi

    echo "Installing mkdocs package..."
    pip install mkdocs

    echo "mkdocs has been installed."
}

# Main script execution
setup_env
