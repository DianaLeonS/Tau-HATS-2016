#!/bin/bash
if [ ! $1 ] ; then
    echo "Please specify the code you want to compile by typing :"
    echo "$0 <Your-Code.C>"
    exit 1
fi

echo "================================================================"
echo "====> Here are the libraries:" $'\n' `root-config --cflags --glibs` -lTMVA $'\n'
filename=`echo $1 | awk -F"." '{print $1}'`
exefilename=${filename}.exe
rm -f $exefilename
g++ $1  -o $exefilename `root-config --cflags --glibs` -lTMVA
echo ""
if [ -e $exefilename ]; then
    echo "====> Created exe file : "
    ls -lrt $exefilename
    echo "====> Done."
    echo "================================================================"
    exit 0
else
    echo "====> Did not create the exe file!"
    echo "================================================================"
    exit 1
fi
