#include <stdio.h>
#include "munit.h"
#include "hello.h"

/* Test case for say_hello function */
static MunitResult
test_say_hello(const MunitParameter params[], void* data) {
    (void) params;

    const char* result = say_hello();
    munit_assert_string_equal(result, "Hello, World!\n");

    return MUNIT_OK;
}

/* Test suite array */
static MunitTest test_suite_tests[] = {
    { "/test_say_hello", test_say_hello, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL },
    /* Add more tests here */
    { NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL }  // Mark the end of the array
};

/* Test suite */
static const MunitSuite test_suite = {
    "/hello",             /* Prefix for all test names */
    test_suite_tests,     /* Array of test cases */
    NULL,                 /* Array of test suites */
    1,                    /* Number of iterations */
    MUNIT_SUITE_OPTION_NONE /* Options */
};

/* Main function to run the tests */
int main(int argc, char* argv[]) {
    return munit_suite_main(&test_suite, NULL, argc, argv);
}