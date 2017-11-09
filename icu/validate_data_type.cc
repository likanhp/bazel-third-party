#include <iostream>
#include <string>

#include "unicode/utypes.h"

using namespace std;

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr << "argc = " << argc << endl;
        return 1;
    }
    string data_type = argv[1];
    if (data_type != U_ICUDATA_TYPE_LETTER) {
        cerr << "data_type = " << data_type << ", U_ICUDATA_TYPE_LETTER = " << U_ICUDATA_TYPE_LETTER << endl;
        return 1;
    }
    return 0;
}