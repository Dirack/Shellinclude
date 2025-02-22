#!/bin/bash
#
# Test option -v and --version of the programs. The right version should appear

source shellunity

cd ../src


LIB_VERSION=$(cat ../docs/VERSION.md)
echo -e  "\033[33mTestando opções -v e --versiondos programas\033[m"
echo -e "\033[33mVersão atual do programa encontrada em docs/VERSION.md: ${LIB_VERSION}\033[m"

progs=("cabecalho" "comp" "img" "jonas" "lipsum" "mensagemAjuda" "mensagemErro" "toolbox")

for prog in "${progs[@]}"
do
    echo -e "\033[33m*** Testing program $prog ***\033[m"

    TEST_MESSAGE "Test -v option"

    PROG_VERSION=$(./$prog -v | cut -d" " -f2)
    TEST_ASSERT_EQUAL_STRING "$LIB_VERSION" "$PROG_VERSION"

    TEST_MESSAGE "Test --version option"

    PROG_VERSION=$(./$prog --version | cut -d" " -f2)
    TEST_ASSERT_EQUAL_STRING "$LIB_VERSION" "$PROG_VERSION"
done