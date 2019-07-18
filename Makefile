TARGET_FILE = "target.sh"
PRJ_SRC = "${PWD}/src/main.sh"
PRJ_LIB = $(shell ls -d ${PWD}/lib/*) # All files from ./lib

export PRJ_LIB

SHELL := /bin/env bash
all: define_main add_dependencies invoke_main

define_main:
	echo -e "#!/usr/bin/env bash\n" > ${TARGET_FILE}
	echo -e "function main() {\n" >> ${TARGET_FILE}
	cat "${PRJ_SRC}" | sed -e 's/^/  /g' >> ${TARGET_FILE}
	echo -e "\n}\n" >> ${TARGET_FILE}

invoke_main:
	echo "main \$$@" >> ${TARGET_FILE}

add_dependencies:
	for filename in $${PRJ_LIB[*]}; do cat $${filename} >> ${TARGET_FILE}; echo >> ${TARGET_FILE}; done

