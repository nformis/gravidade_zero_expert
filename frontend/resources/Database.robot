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

Reset Env

    Execute SQL String          DELETE FROM public.geeks;
    Execute SQL String          DELETE FROM public.users;

Insert User
    [Arguments]                 ${u}

    ${pwhashed}                 Get Hashed Pass  ${u}[password]

    ${q}                        Set Variable  INSERT INTO public.users (name, email, password_hash, is_geek) VALUES ('${u}[name] ${u}[lastname]', '${u}[email]', '${pwhashed}', false)

    Execute SQL String          ${q}

Seed Users

    ${user}                     Factory User  login

    Insert User                 ${user}

    ${user2}                    Factory User  be_geek

    Insert User                 ${user2}

    ${user3}                    Factory User  be_geek_invalid

    Insert User                 ${user3}