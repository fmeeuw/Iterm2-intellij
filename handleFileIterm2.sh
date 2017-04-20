#!/bin/bash

fileName=$1
lineNumber=$2
textBeforeClick=$3
textAfterClick=$4
workingDirectory=$5
debugging=$6

if [[ -d $fileName ]]; then
    fileIsDirectory=1
else
    fileIsDirectory=0
fi
if [[ -e $fileName ]]; then
    fileExists=1
else
    fileExists=0
fi

# Intellij Idea Integration (Configure to your needs)
runIntelliJIdea=0
if [[ ! $fileIsDirectory -eq 1 ]] && [[ $fileExists -eq 1 ]] && [[ $lineNumber ]]; then
    runIntelliJIdea=1
fi
intelliJIdeaCommand="/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea  --line $lineNumber $fileName"

# FallBack, open file with default application.
fallBackCommand="open $fileName"

#Main logic
if [[ $runIntelliJIdea -eq 1 ]]; then
  eval "$intelliJIdeaCommand" &
else
  eval "$fallBackCommand" &
fi

# For debugging purposes
function dumpVars {
  echo -e "fileName=\"$fileName\"\n \
  lineNumber=\"$lineNumber\"\n \
  textBeforeClick=\"$textBeforeClick\"\n \
  textAfterClick=\"$textAfterClick\"\n \
  workingDirectory=\"$workingDirectory\"\n \
  fileIsDirectory=\"$fileIsDirectory\"\n \
  fileExists=\"$fileExists\"\n \
  runIntelliJIdea=\"$runIntelliJIdea\"\n \
  intelliJIdeaCommand=\"$intelliJIdeaCommand\"\n" >> $(dirname $0)/dump.txt
}
if [[ $debugging ]]; then
  dumpVars
fi
