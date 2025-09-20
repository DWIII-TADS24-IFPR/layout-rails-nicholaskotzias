FROM ruby:3.2

# Instalar dependências
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Criar diretório da aplicação
WORKDIR /blog_app

# Copiar Gemfile e Gemfile.lock
COPY ./blog_app/Gemfile* /blog_app/

# Instalar gems
RUN bundle install

# Copiar código
COPY ./blog_app /blog_app