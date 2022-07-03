//
//  msputils.h
//  MSPUtils
//
//  Created by Tom Kidd on 6/29/22.
//

#ifndef msputils_h
#define msputils_h

const char* getAppSupportDirectory(const char* subdir);
void displayMessageBox(const char* title, const char* message, int isError);
const char* getBundlePath(void);
const char* getBundlePathSubdir(const char* subdir);

#endif /* msputils_h */
