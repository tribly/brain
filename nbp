#!/bin/bash

if [[ "$#" == 0 ]]; then
    echo 'Name needed'
    exit
fi

date=$(date +%Y-%m-%d)
drafts_dir=/home/$(whoami)/blog/_drafts/
name="$@"
name_no_space=$(echo "$name" | sed 's/ /-/g')
filename="$date-$name_no_space.md"
text="---
layout: post
title: \""$name"\"
tags:
---
"

touch "$drafts_dir$filename"

echo "$text" > "$drafts_dir$filename"

vim "$drafts_dir$filename"

