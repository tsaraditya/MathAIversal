#!/bin/bash

# 1. Clone Flutter stable channel into a temporary folder if it doesn't exist
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# 2. Add Flutter to the temporary PATH
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Verify tool doctor status
flutter doctor

# 4. Enable web capabilities explicitly
flutter config --enable-web

# 5. Fetch dependencies
flutter pub get

# 6. Build the release static production web artifact files
flutter build web --release

# 7. Move output to a root level directory so Vercel can serve it cleanly
mv build/web public