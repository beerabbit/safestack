// RUN: %clang_cc1 -fsyntax-only -x objective-c -verify -Wno-objc-root-class %s

typedef struct __attribute__((objc_bridge_related(NSColor,colorWithCGColor:,CGColor))) CGColor *CGColorRef; // expected-note 5 {{declared here}}
typedef struct __attribute__((objc_bridge_related(NSColor,,CGColor1))) CGColor1 *CGColorRef1;
typedef struct __attribute__((objc_bridge_related(NSColor,,))) CGColor2 *CGColorRef2;

@interface NSColor // expected-note 5 {{declared here}}
+ (NSColor *)colorWithCGColor:(CGColorRef)cgColor;
- (CGColorRef)CGColor;
- (CGColorRef1)CGColor1;
@end

@interface NSTextField 
- (void)setBackgroundColor:(NSColor *)color;
- (NSColor *)backgroundColor;
@end

void foo(NSColor*); // expected-note {{passing argument to parameter here}}

NSColor * Test1(NSTextField *textField, CGColorRef newColor) {
  foo(newColor); // expected-error {{'CGColorRef' (aka 'struct CGColor *') must be explicitly converted to 'NSColor *'; use '+colorWithCGColor:' method for this conversion}}
  textField.backgroundColor = newColor; // expected-error {{'CGColorRef' (aka 'struct CGColor *') must be explicitly converted to 'NSColor *'; use '+colorWithCGColor:' method for this conversion}}
  return newColor; // expected-error {{'CGColorRef' (aka 'struct CGColor *') must be explicitly converted to 'NSColor *'; use '+colorWithCGColor:' method for this conversion}}
}

NSColor * Test2(NSTextField *textField, CGColorRef1 newColor) {
  foo(newColor); // expected-warning {{incompatible pointer types passing 'CGColorRef1'}}
  textField.backgroundColor = newColor; // expected-warning {{incompatible pointer types assigning}}
  return newColor; // expected-warning {{incompatible pointer types returning}}
}

CGColorRef Test3(NSTextField *textField, CGColorRef newColor) {
  newColor = textField.backgroundColor; // expected-error {{'NSColor *' must be explicitly converted to 'CGColorRef' (aka 'struct CGColor *'); use '-CGColor' method for this conversion}}
  return textField.backgroundColor; // expected-error {{'NSColor *' must be explicitly converted to 'CGColorRef' (aka 'struct CGColor *'); use '-CGColor' method for this conversion}}
}

CGColorRef2 Test4(NSTextField *textField, CGColorRef2 newColor) {
  newColor = textField.backgroundColor; // expected-warning {{incompatible pointer types assigning}}
  return textField.backgroundColor; // expected-warning {{incompatible pointer types returning}}
}
