#include <cstdint>
#include <iostream>
#include <iterator>
#include <sstream>
#include <string>

#include "unicode/utypes.h"

using namespace std;

#define STRINGIFY_(x) #x
#define STRINGIFY(x) STRINGIFY_(x)

int main() {
    string byte_to_string[256];
    for (int i = 0; i < 256; i++) {
        ostringstream oss;
        oss << "\\x" << hex << i;
        byte_to_string[i] = oss.str();
    }

    string out;
    out += R"(extern "C" {)" "\n"
           "extern const char " STRINGIFY(U_ICUDATA_ENTRY_POINT) "[];\n"
           R"(alignas(16) const char )" STRINGIFY(U_ICUDATA_ENTRY_POINT) "[] =";

    string data(istreambuf_iterator<char>{cin}, istreambuf_iterator<char>{});
    out.reserve(out.size() + data.size() * 5);
    for (size_t i = 0, sz = data.size(); i < sz; i++) {
        if (i % 16 == 0) {
            if (i > 0) {
                out += '"';
            }
            out += '\n';
            out += '"';
        }
        out += byte_to_string[static_cast<uint8_t>(data[i])];
    }

    out += "\";\n}";
    cout << out << endl;
}
