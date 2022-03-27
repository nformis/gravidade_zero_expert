*Settings
Documentation                   Listas e Loops

*Test Cases
Entendendo um pouco mais sobre listas e loops

    @{nomes}                    Create List
    ...                         Zé Maria
    ...                         Jão
    ...                         Drico
    ...                         Dé
    ...                         Fer
    ...                         Rafa
    ...                         Chico

    Append To List              ${nomes}  Dani El

    FOR  ${nome}  IN  @{nomes}
        Log To Console              ${nomes}[]
    END