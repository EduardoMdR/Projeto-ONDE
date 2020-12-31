# WebSite ONDE Pinhal

Algumas configurações importantes

* Ruby version 2.6.6

* Rails version 5.2.3

* Database Postgres


# Procedimentos para inicialização do projeto

Preciso da versão do ruby e do rails instaladas no meu computador (e qualquer versão do postgreSQL serve), e toda vez que for alterado alguma
coisa no arquivo Gemfile, preciso repetir esses procedimentos de Instalação.

## Instalação

Para atualizar as depêndencias criadas por outra pessoa preciso rodar um:

```bash
bundle install
```

e para garantir (caso alguem tenha criado) que todas as migrações criadas rodem normalmente no seu servidor:

```bash
rails db:migrate
```

## Configuração

Como foi utilizado uma gem chamada [figaro](https://github.com/laserlemon/figaro) preciso rodar um comando deles para que consiga configurar seu banco de dados:
Nota importante: caso eu ja tenha feito isso no meu computador, não preciso fazer novamente. So vou precisar repetir esses mesmo passos caso eu apagar o repositorio do meu computador e clonar ele novamente

```bash
bundle exec figaro install
```

E no arquivo application.yml (ele vai criar quando rodar o comando), preciso colocar:

```bash
database_username: "seu usuário"
database_password: "sua senha"
```


## Para iniciar
Com tudo configurado corretamente, basta iniciar o servidor:
```bash
rails s
```
E abrir seu navegador no url http://localhost:3000/
