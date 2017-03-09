#!/bin/sh

next=stage/master/head

git clone -n -- "https://gitlab.kitware.com/cmake/cmake.git" "$1"
cd "$1"
git config --add remote.origin.fetch +refs/$next:refs/remotes/origin/$next
git fetch
git branch $next origin/$next
git config branch.$next.remote origin
git config branch.$next.merge refs/$next
git checkout $next
