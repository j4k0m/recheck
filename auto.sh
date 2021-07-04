#!/bin/bash
# By ael-hask
DIR="./binaries"
declare -a arr
if [ ! -d "$DIR" ]; then
    mkdir $DIR
fi
for i in $(find . -type f -name "*.c")
do
    arr+=($i);
done
echo "------------------"
echo "Norm Check: "
norminette
echo "------------------"
echo "Number of files: "
echo ${#arr[@]}
echo "------------------"
echo "Author Header Check: "
for i in "${arr[@]}"
do
    grep "By:" $i;
done
echo "------------------"
echo "Adding Main Function And Compiling.."
for i in "${arr[@]}"
do
    echo -e "\nint\tmain(void)\n{\n\treturn (0);\n}" >> $i;
    gcc -Wall -Werror -Wextra $i -o "$DIR/$(basename $i .c)";
done
echo "Finished. <3"
