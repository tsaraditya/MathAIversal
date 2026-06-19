#!/bin/bash

# 1. Clone the stable Flutter SDK branch cleanly
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 2. Add Flutter to the path variables
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Enable Web configuration tracking
flutter config --enable-web

# 4. FETCH DEPENDENCIES (This fixes error 64!)
flutter pub get

# 5. Compile the web architecture
flutter build web --release --web-renderer canvaskit