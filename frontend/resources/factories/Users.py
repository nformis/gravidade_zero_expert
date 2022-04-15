from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return[
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('be_geek_invalid'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

def factory_user(target):

    try:
        data = {
            'faker': {
                'name': fake.first_name(),
                'lastname': fake.last_name(),
                'email': fake.free_email(),
                'password': "qwe123"
            },
            'login': {
                'name': 'Nilton',
                'lastname': 'Formis',
                'email': 'nformis@email.com',
                'password': "qwe123"
            },
            'be_geek': {
                'name': 'João',
                'lastname': 'Geek',
                'email': 'joaogeek@email.com',
                'password': "qwe123",
                'geek_profile': {
                    'whats': '10123456789',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um virus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico, e porque não, remover o Baidu.',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '50'
                }
            },
            'be_geek_invalid': {
                'name': 'João',
                'lastname': 'Inválido',
                'email': 'joaoinvalido@email.com',
                'password': "qwe123",
                'geek_profile': {
                    'whats': '10987654321',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um virus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o SO, trocando algum componente físico, e porque não, remover o Baidu. Entre em contato!',
                    'printer_repair': 'Não',
                    'work': 'Remoto',
                    'cost': '10'
                }
            },
            'searcher': {
                'name': 'Johnny',
                'lastname': 'Lawrence',
                'email': 'j.law@cobrakai.com',
                'password': 'qwe123'
            },
            'search_alien': {
                'name': 'Doc',
                'lastname': 'Ock',
                'email': 'doc@oscorp.com',
                'password': 'qwe123',
                'geek_profile': {
                    'whatsapp': '21999991001',
                    'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                    'printer_repair': 'Sim',
                    'work': 'Presencial',
                    'cost': '250'
                }
            },
            'search_common': {
                'name': 'Peter',
                'lastname': 'Parker',
                'email': 'parker@oscorp.com',
                'password': 'qwe123',
                'geek_profile': {
                    'whatsapp': '21999991002',
                    'desc': 'Faço instalação de distribuições Linux no seu computador PC X86 ou X64 com processadores Intel ou AMD. Pode ser Linux Debian, Ubuntu, Mint, Fedora etc...',
                    'printer_repair': 'Não',
                    'work': 'Remoto',
                    'cost': '200' 
                }
            }
        }
        return data[target]

    except:
        print ('Error test data :(')
        raise