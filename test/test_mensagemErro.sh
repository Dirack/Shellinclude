source shellunity
source ../src/mensagemErro

MENSAGEMERRO="Exemplo de uso da biblioteca mensagemErro.sh"

MENSAGEMERRO_RED=$(echo -e "\033[31mtest_mensagemErro.sh: ERRO(1):  $MENSAGEMERRO\033[m")

MSG=$(exibirMensagemErroProgramaFormatada "$(basename $0)" "1" "$MENSAGEMERRO")

TEST_ASSERT_EQUAL_STRING "$MSG" "$MENSAGEMERRO_RED"