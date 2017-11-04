#define _XOPEN_SOURCE

#include <cctype>
#include <cstddef>
#include <cwchar>
#include <iostream>
using namespace std;

int bool_to_int(bool b) {
    return b ? 1 : 0;
}

int compute_cc_wc_width_broken() {
    setlocale(LC_ALL, "en_US.UTF-8");
    return bool_to_int(wcwidth(0x0301) != 0);
}

int compute_cc_ctype_accept_non_ascii() {
    if (setlocale(LC_ALL, "en_US.ISO8859-1") == nullptr) {
        setlocale(LC_ALL, "");
    }
    return bool_to_int(isprint(0342) && isprint(0342 - 128));
}

int main() {
    cout << "cc_sizeof_size_t=" << sizeof(size_t) << endl;
    cout << "cc_wc_width_broken=" << compute_cc_wc_width_broken() << endl;
    cout << "cc_ctype_accept_non_ascii=" << compute_cc_ctype_accept_non_ascii() << endl;
}