# bash-project

An example of how a larger bash script can be splitted into into multiple files

## Main idea

Entrypoint [./src/main.sh](./src/main.sh):

```bash

print_foo "foo"
print_bar "bar"

```

Module #1 [./lib/print_bar.sh](./lib/print_bar.sh):

```bash

function print_bar() {
  echo "bar: $1"
}

```

Module #2 [./lib/print_foo.sh](./lib/print_foo.sh):

```bash

function print_foo() {
  echo "foo: $1"
}

```

Resulting file: [./target.sh](./target.sh):

```bash

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

```

## Split

1. Put the main part of your project into the [./src/main.sh](./src/main.sh) file. It will be the entrypoint for your script;
2. Move all your function declarations into the modules under the `./lib` directory
([./lib/print_bar.sh](./lib/print_bar.sh) and [./lib/print_foo.sh](./lib/print_foo.sh) in this example);
3. Copy the content of the [Makefile](Makefile) to the root of your project;

## Build

1. Replace the value of the variable `TARGET_FILE` in the `Makefile`
(wich is `target.sh` by default) with the name that your prefer;
2. Run `make` from your project directory;
3. The content of your `main.sh` file will be wrapped into the `main` function and will be invoked at the end of the
script, so all of the functions defined in modules under the `lib` directory will be available in it;
