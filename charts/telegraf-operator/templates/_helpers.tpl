{{/* vim: set filetype=mustache: */}}

{{/*
Expand the name of the chart.
*/}}
{{- define "telegraf-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "telegraf-operator.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Generate certificates for telegraf-operator mutating webhook
*/}}
{{- define "telegraf-operator.auto_generated_certificate" -}}
{{- $altNames := list ( printf "%s.%s" (include "telegraf-operator.fullname" .) .Release.Namespace ) ( printf "%s.%s.svc" (include "telegraf-operator.fullname" .) .Release.Namespace ) -}}
{{- $ca := genCA "telegraf-operator-ca" 365 -}}
{{- $cert := genSignedCert ( include "telegraf-operator.fullname" . ) nil $altNames 365 $ca -}}
apiVersion: admissionregistration.k8s.io/v1
kind: MutatingWebhookConfiguration
metadata:
  annotations:
    cert-manager.io/inject-ca-from: "{{ .Values.namespace }}/{{ include "telegraf-operator.fullname" . }}"
  labels:
    {{ toYaml .Values.labels | indent 4 }}
  name: {{ include "telegraf-operator.fullname" . }}
webhooks:
- clientConfig:
    service:
      name: {{ include "telegraf-operator.fullname" . }}
      namespace: {{ .Release.Namespace }}
      path: /mutate-v1-pod
    caBundle: {{ $ca.Cert | b64enc }}
  failurePolicy: Ignore
  sideEffects: None
  admissionReviewVersions:
  - 'v1'
  name: telegraf.influxdata.com
  rules:
  - apiGroups:
    - '*'
    apiVersions:
    - '*'
    operations:
    - CREATE
    - DELETE
    resources:
    - pods
---
apiVersion: v1
kind: Secret
type: kubernetes.io/tls
metadata:
  name: telegraf-operator-tls
  labels:
    {{ toYaml .Values.labels | indent 4 }}
  annotations:
    "helm.sh/hook": "pre-install,pre-upgrade"
    "helm.sh/hook-delete-policy": "before-hook-creation"
data:
  tls.crt: {{ $cert.Cert | b64enc }}
  tls.key: {{ $cert.Key | b64enc }}
{{- end -}}
