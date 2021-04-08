#!/bin/bash

$list=$(ls ./charts | grep -v / | xargs echo | sed 's/ /,/g')
echo $list

helm package charts/$list --destination .deploy
cr upload -o fcosta-td -r kubernetes -p .deploy
