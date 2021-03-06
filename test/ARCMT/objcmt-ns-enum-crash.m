// RUN: rm -rf %t
// RUN: %clang_cc1 -objcmt-migrate-ns-macros -mt-migrate-directory %t %s -x objective-c -fobjc-runtime-has-weak -fobjc-arc -triple x86_64-apple-darwin11
// RUN: c-arcmt-test -mt-migrate-directory %t | arcmt-test -verify-transformed-files %s.result

#define NS_ENUM(_type, _name) enum _name : _type _name; enum _name : _type
#define NS_OPTIONS(_type, _name) enum _name : _type _name; enum _name : _type
typedef long NSInteger;

typedef enum : NSInteger {five} ApplicableEnum;

typedef unsigned long mytd;

#define MY_ENUM(name, type, ...) typedef enum : type { __VA_ARGS__ } name##_t
MY_ENUM(MyEnum, unsigned int, One);
