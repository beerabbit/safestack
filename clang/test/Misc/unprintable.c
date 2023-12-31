// RUN: not %clang_cc1 %s -fmessage-length=40 -fno-diagnostics-show-line-numbers 2>&1 | FileCheck -strict-whitespace %s

int main() {
    int i;
    if((i==/*ï¿¾*/1));

// CHECK: {{^    if\(\(i==/\*<U\+FFFE>\*/1\)\);}}

// CHECK: {{^        ~\^~~~~~~~~~~~~~~}}
// CHECK: {{^       ~ \^              ~}}

    (void)"Êï¿¾ô";

// CHECK: {{^    \(void\)"<CA><U\+FFFE><F4>";}}
// CHECK: {{^           \^~~~}}

Â  int n = 0;

// CHECK: {{ int n = 0;}}
// CHECK: {{^\^}}

   "ï¿¾                                                               \z";

// CHECK: {{^  \.\.\.\\z";}}
// CHECK: {{^     \^~}}


    /* ï¿¾ */ "ï¿¾berhund";

// CHECK: {{^    /\* <U\+FFFE> \*/ "<U\+FFFE>berhund";}}
// CHECK: {{^                   \^~~~~~~~~~~~~~~~~}}


// PR14292
    "x°xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
// CHECK: {{^    "x<B0>}}
// CHECK: {{^    \^}}

}
