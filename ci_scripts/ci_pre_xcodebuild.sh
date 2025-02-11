#!/bin/sh
#
#  Created by Iiro Alhonen on 11.2.2025.
#  

xcodebuild -project $CI_PROJECT_FILE_PATH -scheme $CI_XCODE_SCHEME -skipPackagePluginValidation
