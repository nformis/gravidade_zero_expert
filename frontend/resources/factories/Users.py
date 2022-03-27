from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

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
            }
        }
        return data[target]

    except:
        print ('Error test data :(')
        raise