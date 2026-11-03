# compile all *.java sources (avoiding VSCode *temp.java files) and,
# if successfull, run 'Application'
# 
javac $(find -name '*.java' -not -name "*temp*.java" | tee /dev/tty) && java Application
