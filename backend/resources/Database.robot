*Settings
Documentation                   Database helpers

Library                         DatabaseLibrary
Library                         ${EXECDIR}/resources/factories/Users.py

*Keywords
Connect To DB

    Connect To Database         psycopg2
    ...                         wsxhohvx
    ...                         wsxhohvx
    ...                         J_wJiAJKXkSu5S5nb27vLy9NZXVORTRJ
    ...                         fanny.db.elephantsql.com
    ...                         5432

Remove User By Email
    [Arguments]                 ${email}

    Connect To DB
    Execute SQL String          Delete from public.user where email = '${email}'
    Disconnect From Database