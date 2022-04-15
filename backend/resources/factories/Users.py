def factory_new_user():

    return {
        'name': 'Nilton Formis',
        'email': 'nformis@email.com',
        'password': 'qwe123'
    }

def factory_get_user():

    return {
        'name': 'Gwen Stacy',
        'email': 'stacy@oscorp.com',
        'password': 'qwe123'
    }

def factory_delete_user():

    return {
        'name': 'Phil Coulson',
        'email': 'coulson@shield.com',
        'password': 'qwe123'
    }

def factory_update_user():

    email = 'nome@sobrenome.com'

    return {
        'before': {
            'name': 'Nome Sobrenome',
            'email': email,
            'password': 'qwe123'
        },
        'after': {
            'name': 'Sobrenome Nome',
            'email': email,
            'whatsapp': '19123456789',
            'avatar': 'https://avatars.githubusercontent.com/u/91755845'
        }
    }

def factory_user_session(target):

    name = 'Nilton Formis'
    email = 'nformis@email.com'
    password = 'qwe123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]

def factory_be_geek():

    return {
        'name': 'João Lucas',
        'email': 'joaolucas@email.com',
        'password': 'qwe123',
        'geek_profile': {
            'whatsapp': '19123456789',
            'desc': 'Texto descrição',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '123.45'
        }
    }

def factory_search_for_geeks():

    return {
        'user': {
            'name': 'José Paulo',
            'email': 'josepaulo@email.com',
            'password': 'qwe123'
        },
        'geeks': [
            {
                'name': 'Riri Willians',
                'email': 'riri@marvel.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '11999999999',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                    'printer_repair': 'Não',
                    'work': 'Presencial',
                    'cost': '100'
                }
            },
            {
                'name': 'Arnim Zola',
                'email': 'zola@hydra.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '21999999999',
                    'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                    'printer_repair': 'Não',
                    'work': 'Ambos',
                    'cost': '110'
                }
            },
            {
                'name': 'Reed Richards',
                'email': 'reed@fantastic4.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '31999999999',
                    'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '120'
                }
            }
        ]
    }