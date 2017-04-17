#!/bin/bash

fileName=$1
lineNumber=$2
textBeforeClick=$3
textAfterClick=$4
workingDirectory=$5
debugging=$6

if [[ -d $fileName ]]; then
    fileIsDirectory=0
else
    fileIsDirectory=1
fi
if [[ -e $fileName ]]; then
    fileExists=0
else
    fileExists=1
fi

# Intellij Idea Integration (Configure to your needs)
runIntelliJIdea=1
if [[ ! $fileIsDirectory -eq 0 ]] && [[ $fileExists -eq 0 ]] && [[ $lineNumber ]]; then
  if [[ $fileName == /Users/Somebody/IntelliJProjects/* || $fileName == /Users/Somebody/Projects/* ]]; then
      runIntelliJIdea=0
  fi
fi
intelliJIdeaCommand="/Applications/IntelliJ\ IDEA.app/Contents/MacOS/idea  --line $lineNumber $fileName"

# FallBack, open file with default application.
fallBackCommand="open $fileName"

#Main logic
if [[ $runIntelliJIdea -eq 0 ]]; then
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
