# Projeto Exemplo

## Criando um novo projeto

```shell
rails new projeto-exemplo-front -c tailwind -T --skip-jbuilder
```

## Gerando Recursos (CRUDs)

Nome do recurso com a primeira letra maiúscula e atributos em minúsculo, seguido do tipo de atributo.

Categorias

```shell
rails g scaffold Category name
```

Produtos

```shell
rails g scaffold Product name price:decimal category:references image quantity:integer
```

## Adicionado autenticação

```shell
rails generate authentication
```

## Migrando os dados para o banco

```shell
rails db:migrate
```

## Frontend

### Layouts

Podemos ter diferentes layouts para diferentes contextos:

1 - Acesso público
2 - Dashboard administrivo 

(app/views/layouts/application.html, app/views/layout/login.html.erb)

Pasta app/views ficam os arquivos html.erb (views e partials).

### Partials

Começam com _ e são arquivos que podem conter html e ruby.

### Views 

São reflexo de uma action em um controller, exemplo:

A view app/views/products/index.html.erb está conectada a action no controller app/controllers/products_controller.rb >> Action index.

### CSS

Podem utilizar Tailwind, Bootstrap ou CSS puro no arquivo:

app/assets/stylesheets/application.css

### Javascript

Podem utilizar praticamente todas as bibliotecas ou JS puro no arquivo:

app/javascript/application.js

# Upload de arquivos

Configuração do Active Storage

[Docs](https://guides.rubyonrails.org/active_storage_overview.html#has-many-attached)

É necessário instalar o Vips, dependência para manusear arquivos.

[Vips](https://www.libvips.org/)

# Geração de PDF

[Gem Prawn](https://github.com/prawnpdf/prawn)

Código no arquivo app/controllers/products_controller.rb
