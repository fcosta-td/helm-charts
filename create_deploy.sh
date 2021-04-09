#!/bin/bash

#$list=$(ls ./charts | grep -v / | xargs echo | sed 's/ /,/g')

for chart in $(ls -d charts/*); do
 helm package $chart --destination .deploy
done

cr upload -o fcosta-td -r kubernetes -p .deploy --config ~/.cr.yaml
