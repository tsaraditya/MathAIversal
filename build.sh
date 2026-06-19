#!/bin/bash

# 1. Clear out any previous partial system clones safely
rm -rf flutter

# 2. Clone the stable Flutter SDK branch cleanly
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 3. Explicitly append the binary paths to the live system profile
export PATH="$PATH:$(pwd)/flutter/bin"

# 4. Turn off analytics to prevent terminal interactive question locks
flutter --no-analytics config --no-analytics

# 5. Explicitly activate web tracking constraints
flutter config --enable-web

# 6. Pre-download the compilation dependencies cleanly
flutter pub get

# 7. Execute a clean build override
flutter build web --release --web-renderer canvaskit