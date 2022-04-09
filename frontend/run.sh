delorean="robot -l NONE -o NONE -r NONE tasks/Delorean.robot"
teste="robot -x xunit.xml -d ./logs"

echo "Construindo ambiente:"
$delorean
echo "
Rodando suite de teste com os seguintes parâmetros:  " $teste
$teste