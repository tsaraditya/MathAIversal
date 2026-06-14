#!/bin/bash

# 1. Clone Flutter stable channel into a temporary folder if it doesn't exist
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# 2. Add Flutter to the temporary PATH environment
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Enable web capabilities explicitly
flutter config --enable-web

# 4. Fetch dependencies
flutter pub get

# 5. Build the release static production web files
flutter build web --release --base-href /

# 6. Move the compiled assets directly to the root workspace folder so they sit flat
cp -r build/web/* .