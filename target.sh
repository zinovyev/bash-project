#!/usr/bin/env bash

function main() {

  print_foo "foo"
  print_bar "bar"

}

function print_bar() {
  echo "bar: $1"
}

function print_foo() {
  echo "foo: $1"
}

main $@
