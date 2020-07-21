#!/bin/bash

list=("Hello" "World!")

for var in ${list[@]}
do
  echo "$var"
done

##### templating #####

function fill_in_file(){
  local template_file="$1"
  local destination="$2"
  template="$(cat ${template_file})"
  eval "echo \"${template}\"" > $destination
}

funcion replace_whitespaces(){
  echo "$1" | sed -e 's/\s\+/,/g'
}


##### string manipultation #####

function manipulateString(){
  local TestString="Artical Title Here (ClassYear) [Author]"
  # remove matching suffix ` (*`    
  ath="${TestString%% (*}"

  # remove matching prefix `*) `
  author="${TestString##*) }"

  # remove both prefix and suffix `(` and `)`
  # double enclose variable and escape special characters that are in the pattern.
  classyear="${${TestString##*\(}%%\)*}"
}

##### programming #####

function recursion(){
  parameter="$1"
  condition="$2"
  
  if [ $parameter != $condition ] 
  then
    recursion $($parameter+1) $condition
  fi
  
  action $parameter
}

function action(){
  echo "$1"
}

