# Code-Runner launch shell-script that collects and compiles *.java files and,
# if successfull, runs main() in 'Application' or 'application.Application'.
# 
[ -d Appliction.java ] && {
        TOP="."; MAIN="Application"
    } || {
        TOP="src/main"; MAIN="application.Application"
    }

# collect .java source files to compile
SRC=($(find "$TOP" -name '*.java' -not -name "*temp*.java"))
# for src in ${SRC[@]}; do echo " --> $src"; done

# compile and run SRC
echo -n "compiling ${#SRC[@]} source files... " &&
    javac ${SRC[@]} &&
    echo -e "done.\nrunning: ${MAIN}" &&
    java ${MAIN}
