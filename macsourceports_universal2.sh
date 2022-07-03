# game/app specific values
export APP_VERSION="3.0"
export ICONSDIR="macos"
export ICONSFILENAME="tyrian"
export PRODUCT_NAME="opentyrian2000"
export EXECUTABLE_NAME="opentyrian2000"
export PKGINFO="APPLTYR2K"
export COPYRIGHT_TEXT="Copyright © 1995 Eclipse Software. All rights reserved."

#constants
source ../MSPScripts/constants.sh

rm -rf ${BUILT_PRODUCTS_DIR}

rm -rf ${X86_64_BUILD_FOLDER}
mkdir ${X86_64_BUILD_FOLDER}
mkdir -p "${X86_64_BUILD_FOLDER}/${EXECUTABLE_FOLDER_PATH}"
mkdir -p "${X86_64_BUILD_FOLDER}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/data"
rm -rf ${ARM64_BUILD_FOLDER}
mkdir ${ARM64_BUILD_FOLDER}
mkdir -p "${ARM64_BUILD_FOLDER}/${EXECUTABLE_FOLDER_PATH}"
mkdir -p "${ARM64_BUILD_FOLDER}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/data"

make clean
(ARCH=x86_64 PKG_CONFIG=/usr/local/bin/pkg-config make -j8)
mv ${EXECUTABLE_NAME} "${X86_64_BUILD_FOLDER}/${EXECUTABLE_FOLDER_PATH}"
cp -a "data/." "${X86_64_BUILD_FOLDER}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/data"

make clean
(ARCH=arm64 PKG_CONFIG=/opt/homebrew/bin/pkg-config make -j8)
mv ${EXECUTABLE_NAME} "${ARM64_BUILD_FOLDER}/${EXECUTABLE_FOLDER_PATH}"
cp -a "data/." "${ARM64_BUILD_FOLDER}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/data"

# create the app bundle
"../MSPScripts/build_app_bundle.sh"

"../MSPScripts/sign_and_notarize.sh" "$1"
