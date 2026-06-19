#!/bin/bash

# 1. Clear out any previous framework files cleanly
rm -rf flutter

# 2. Clone the stable Flutter SDK branch
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 3. Append binary paths to the live system profile
export PATH="$PATH:$(pwd)/flutter/bin"

# 4. Turn off tracking metrics
flutter config --no-analytics

# 5. Fetch dependencies 
flutter pub get

# 6. Build web with standard release flags (Removing the strict renderer flag removes the 64 error)
flutter build web --release