function dev {
   n=`perl -e 'printf("%03d\n", '$1');'` 
   ssh kma@devrs${n}.snc1.facebook.com
}

# fb id
export FBID=530929372

if [ -f /home/engshare/svnroot/admin/scripts/master.bashrc ]; then
  . /home/engshare/svnroot/admin/scripts/master.bashrc
fi
alias ls="ls -F"

function srcgrep {
   find . -iname \*.js -o -iname \*.php -o -iname \*.phpt \
          -o -iname \*.h -o -iname \*.c -o -iname \*.cpp | xargs egrep "$@"
}

function cdmc {
    cd ~/src/memcached-fb
}

function pypath {
    export PYTHONPATH=$PYTHONPATH:$1
}
export EDITOR=vim
export VISUAL=vim

export FBCODE=/data/users/kma/fbcode
if [ -d $FBCODE ]; then
    # tell tools where to find themselves
    #export BUILD_TOOLS_PATH=$FBCODE/tools/build
    #export DEPLOY_TOOLS_PATH=$FBCODE/tools/fbdeploy
    #export PACKAGE_TOOLS_PATH=$FBCODE/tools/fbpackage
    #PATH=$PATH:$BUILD_TOOLS_PATH:$DEPLOY_TOOLS_PATH:$PACKAGE_TOOLS_PATH

    pypath $FBCODE/_genfiles/search/if/gen-py
    PATH=$PATH:$FBCODE/_genfiles/search/if/gen-py/NameSearch
    pypath $FBCODE/_genfiles/indexserver/tailer/gen-py
    pypath $FBCODE/_genfiles/libfb/if/gen-py
    pypath $FBCODE/_genfiles/libfb/if/gen-py
    pypath $FBCODE/search/lib/util/
fi

export PATH=/usr/hs/bin:/usr/local/jdk-6u7-64/bin:/sbin:/usr/sbin:$PATH
export JAVA_HOME=/usr/local/jdk-6u7-64
export LD_LIBRARY_PATH=$JAVA_HOME/jre/lib/amd64/server
export HIVESITE=silver
PATH=~/bin/sh:~/bin/$(uname -p):$PATH

# Go stuff
export GOROOT=$HOME/go
export GOARCH=amd64
export GOOS=linux

# some smc shortcuts
wc_nsleaf01=search.snc1.nsleaf.people01
wc_nsleaf02=search.snc1.nsleaf.people02
wc_nsleaf03=search.snc1.nsleaf.people03

# Linux. And C++.
export GLIBCXX_FORCE_NEW=1

function setprompt() {
  d=$(basename $WS_HOME)
  PS1="($HOSTNAME:$d:$HPBLD:\W)\$ "
  export PS1
}

function cws() {
  POSSIBLE_WS_HOME=$(echo $1 | sed -e's/:/ /' | awk '{print $1}')
  if [ -d "$POSSIBLE_WS_HOME" ]; then
    export WS_HOME=$POSSIBLE_WS_HOME
    export TREE=$POSSIBLE_WS_HOME
  fi
  setprompt
}

function cdws() {
  cd $WS_HOME/src
}
cws /workspace

# PPROF tools prefix
#PATH=/mnt/gvfs/third-party/bd3267234489a2fa6a5cc35642dde2633e11504c/gcc-4.6.2-glibc-2.13/binutils/binutils-2.21.1/bin/:$PATH
#PATH=/mnt/gvfs/third-party/f7e1450772192c96981844338f4517baf835ebf1/gcc-4.6.2-glibc-2.13/binutils/binutils-2.21.1/4bc2c16/bin/:$PATH

# Messes up default behavior of tc-print. Eh.
#export HHVM_REPO_CENTRAL_PATH=/data/users/kma/central.hhbc

