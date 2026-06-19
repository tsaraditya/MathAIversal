#!/bin/bash

# 1. Clone the stable Flutter SDK branch into the build machine environment
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 2. Add the freshly cloned Flutter directory paths to the system environment
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Enable Web compilation tracking flags
flutter config --enable-web

# 4. Compile the application using CanvasKit paths natively
flutter build web --release --web-renderer canvaskit