# IntelliJ Idea integration in Iterm2
This repository contains a script, `handleFileIterm2.sh` which can be configured to be executed by Iterm2, when cmd+clicking on a filename. This script will open the file in IntelliJ and jumps to the corresponding lineNumber, if it is an existing file with a lineNumber. (You can configure this to you needs) Otherwise it will fall back to opening the file with the default application. This is useful for when you have compilation errors and want to quickly jump to the error.
Tested with IntelliJ IDEA Ultimate 2017.1.

## Configuring Iterm2

1. Go to Preferences > Profiles and select the profile you want to configure.
2. Go to Advanced and jump to the `Semantic History` section.
3. Select `Run command...` in the dropdown and paste the following line: `./handleFileIterm2.sh "\1" "\2" "\3" "\4" "\5"`.

![alt tag](SemanticHistory.png)

## Debugging

By supplying a 6th argument to the handleFileIterm2.sh it will dump some variables to a file called dump.txt in the same directory as the handleFileIterm2.sh script.
