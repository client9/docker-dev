FROM golang:alpine
MAINTAINER nickg@client9.com
RUN set -ex \
    && apk --no-cache add git openssh-client docker make vim \
       python python-dev py-pip gcc libc-dev groff less \
    && pip install awscli \
    && apk del python-dev gcc libc-dev

# Pathogen https://github.com/tpope/vim-pathogen
# VIM-GO   https://github.com/fatih/vim-go
RUN set -ex \
   && mkdir -p ~/.vim/autoload ~/.vim/bundle \
   && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim  \
   && cd ~/.vim/bundle \
   && git clone git://github.com/tpope/vim-sensible.git \
   && git clone https://github.com/fatih/vim-go.git
COPY .vimrc /root/.vimrc
COPY .gitconfig /root/.gitconfig
#COPY .ssh /root/.ssh

