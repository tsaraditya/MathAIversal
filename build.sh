#!/bin/bash

# 1. Clone Flutter stable channel into a temporary folder if it doesn't exist
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# 2. Add Flutter to the temporary PATH environment
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Verify tool status
flutter doctor

# 4. Enable web capabilities explicitly
flutter config --enable-web

# 5. Fetch dependencies
flutter pub get

# 6. Build the release static production web files with absolute base href routing
flutter build web --release --base-href /

# 7. Create a clean root public directory if it doesn't exist yet
mkdir -p public

# 8. Copy everything inside the build folder cleanly over into public
cp -r build/web/* public/