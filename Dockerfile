FROM ubuntu

COPY . /app

WORKDIR /app

RUN apt-get update -y
RUN apt-get install -y ghc nano make
RUN apt install -y cabal-install && cabal update && cabal install --lib random

