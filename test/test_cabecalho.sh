source shellunity

cd ../src


LIB_VERSION=$(cat ../docs/VERSION.md)

PROG_VERSION=$(./cabecalho -v | cut -d" " -f2)
TEST_ASSERT_EQUAL_STRING "$LIB_VERSION" "$PROG_VERSION"

PROG_VERSION=$(./cabecalho --version | cut -d" " -f2)
TEST_ASSERT_EQUAL_STRING "$LIB_VERSION" "$PROG_VERSION"