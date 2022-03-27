delorean="robot -l NONE -o NONE -r NONE tasks/Delorean.robot"
teste="robot -d ./logs/tests ./tests"

echo "Construindo ambiente:"
$delorean
echo "
Rodando suite de teste com os seguintes parâmetros:  " $teste
$teste