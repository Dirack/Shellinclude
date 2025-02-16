source shellunity
source ../src/mensagemAjuda

NOME_PROGRAMA="TESTE"
DESCRICAO="Este é um teste"
PARAMETROS="-h --help::Exibe ajuda e sai"
EXEMPLO_DE_USO="Exemplo de teste"

MSG="$(exibirMensagemAjudaProgramaFormatada "$NOME_PROGRAMA" "$DESCRICAO" "$PARAMETROS" "$EXEMPLO_DE_USO")"

SAIDA=$(echo -e "$(echo -e '\033[00;01mNOME\033[m')
\tTESTE [ -h ]
$(echo -e '\033[00;01mDESCRIÇÃO\033[m')
\tEste é um teste
$(echo -e '\033[00;01mPARÂMETROS\033[m')
$(formatarTabelaParametros "$PARAMETROS")
$(echo -e '\033[00;01mEXEMPLO DE USO\033[m')
\tExemplo de teste")

# Check strings in shell script
# diff -u <( printf '%s\n' "$MSG" ) <( printf '%s\n' "$SAIDA" )
TEST_ASSERT_EQUAL_STRING "$MSG" "$SAIDA"

PARAMETROS2="-h --help::Exibe ajuda e sai"
MSG="$(formatarTabelaParametros "$PARAMETROS2")"
# Check strings in shell script
# diff -u <( printf '%s\n' "$MSG" ) <( printf '%s\n' "\t\033[00;01m-h --help \033[mExibe ajuda e sai" )
TEST_ASSERT_EQUAL_STRING "$MSG" '\t\033[00;01m-h --help \033[mExibe ajuda e sai'