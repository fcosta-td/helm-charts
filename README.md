# Helm-Charts
[![Release Charts](https://github.com/fcosta-td/helm-charts/workflows/Release%20Charts/badge.svg?branch=main)]

## Charts
- [TrinoDB](./charts/trinodb/README.md)


## License

Licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0), a OSI-approved license.

## DISCLAIMER

All of the source code on this repository is provided "as is", without warranty of any kind,
express or implied, including but not limited to the warranties of merchantability,
fitness for a particular purpose and noninfringement. in no event shall Barracuda be liable for any claim,
damages, or other liability, whether in an action of contract, tort or otherwise, arising from,
out of or in connection with the source code.

https://tech.paulcz.net/blog/creating-a-helm-chart-monorepo-part-1/


helm repo add trinodb https://fcosta-td.github.io/kubernetes


commands:
cr index -i ./index.yaml -p .deploy -o fcosta-td -r kubernetes -c https://github.com/fcosta-td/kubernetes
