#!/bin/sh

#  ci_pre_xcodebuild.sh
#  Bean Juice
#
#  Created by Iiro Alhonen on 14.9.2023.
#  

defaults write com.apple.dt.Xcode IDESkipPackagePluginFingerprintValidatation -bool YES
