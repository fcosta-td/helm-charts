# kubernetes
https://tech.paulcz.net/blog/creating-a-helm-chart-monorepo-part-1/


helm repo add trinodb https://fcosta-td.github.io/kubernetes


commands:
cr index -i ./index.yaml -p .deploy -o fcosta-td -r kubernetes -c https://github.com/fcosta-td/kubernetes
