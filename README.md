## Personal Dot Files 

# Mac
### Basic
```
$ git clone https://github.com/mirko1593/dotfiles.git ~/code/dotfiles

$ ln -s ~/code/dotfiles/mac/base_zshrc ~/.base_zshrc

$ ln -s ~/code/dotfiles/mac/alias ~/.alias

$ source ~/.zshrc
```

### Vim
```
$ brew install vim the_silver_searcher

$ ln -s ~/code/dotfiles/mac/vim ~/.vim

$ mkdir ~/.vim/swapfiles

$ ln -s ~/code/dotfiles/mac/vimrc ~/.vimrc

```

### Tmux
```
$ brew install tmux

$ ln -s ~/code/dotfiles/mac/tmux.conf ~/.tmux.conf
```

# Linux

### dotfiles
```
$ git clone https://github.com/mirko1593/dotfiles.git ~/code/dotfiles
```

### vim

$ sudo add-apt-repository ppa:jonathonf/vim

```
$ go install github.com/mgechev/revive@latest

$ go install golang.org/x/tools/cmd/goimports@latest

$ go install golang.org/x/tools/gopls@latest
```

### Ruby
```

$ gem install solargraph

```

# Linux(ubuntu)
### ppa
中科大ppa源: launchpad.proxy.ustclug.org
```  
sudo apt install -y software-properties-common

sudo add-apt-repository ppa:jonathonf/vim

sudo add-apt-repository ppa:git-core/ppa

sudo apt update

```

```
$ apt install -y silversearcher-ag

$ ln -s ~/code/dotfiles/linux/tmux.conf ~/.tmux.conf
```

### go
```
$ wget https://go.dev/dl/go1.17.6.linux-amd64.tar.gz

$ go install github.com/mgechev/revive@latest

$ go install golang.org/x/tools/cmd/goimports@latest

$ go install golang.org/x/tools/gopls@latest

```
