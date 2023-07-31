#!/usr/bin/env bash
#
#

encrypt () {
  gpg -e -r steve@localhost.lu -a -o attention.tex.asc attention.tex

  pushd remotes
  for r in $(ls *.txt); do
    gpg -e -r steve@localhost.lu -a -o ${r}.asc ${r}
  done

  popd
}

decrypt () {
  gpg -o attention.tex -d attention.tex.asc

  pushd remotes
  for r in $(ls *.asc); do
    out=$(echo ${r} |cut -f 1,2 -d .)
    gpg -o ${out} -d ${r}
  done

  popd
}

unpack () {
  IFS=$'\n'
  for r in $(ls remotes/$1.txt); do
    for l in $(cat ${r}); do
        fn=$(echo ${l}| cut -f1 -d:).tex
        echo ${l}| cut -f2 -d: > ${fn}
    done
  done
}

[[ ${1} == 'enc' ]] && encrypt
[[ ${1} == 'dec' ]] && decrypt
[[ ! -z ${2} ]] && unpack $2
[[ -z ${1} ]] && echo "${0} enc/dec"
