#!/usr/bin/env bash

if [ $(uname -m) == 'x86_64' ] 
then
	echo x86_64
	./gdown.pl 'https://drive.google.com/open?id=1Ch3-hh3ClKVa-kU9NoqmHKMpmX0PbvFZ' '$HOME/tmp.tar.gz'
	tar -xzvf $HOME/tmp.tar.gz -C $HOME
	rm -f $HOME/tmp.tar.gz
elif [ $(uname -m) == 'aarch64' ] 
then 
	echo aarch64
	./gdown.pl 'https://drive.google.com/open?id=1Ch3-hh3ClKVa-kU9NoqmHKMpmX0PbvFZ' '$HOME/tmp.tar.gz' 
	tar -xzvf $HOME/tmp.tar.gz -C $HOME
	rm -f $HOME/tmp.tar.gz
else
	echo not found compiled packages
fi
