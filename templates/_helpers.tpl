{{/*
* POWERDNS-TPL
*/}}

{{/*
** POWERDNS
*/}}
{{/*
*** Expand the name of the chart.
*/}}
{{- define "powerdns.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
*** Create a default fully qualified app name.
    We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
    If release name contains chart name it will be used as a full name.
*/}}
{{- define "powerdns.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
*** Create chart name and version as used by the chart label.
*/}}
{{- define "powerdns.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
*** Common labels
*/}}
{{- define "powerdns.labels" -}}
helm.sh/chart: {{ include "powerdns.chart" . }}
{{ include "powerdns.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
*** Selector labels
*/}}
{{- define "powerdns.selectorLabels" -}}
app.kubernetes.io/name: {{ include "powerdns.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
*** Create the name of the service account to use
*/}}
{{- define "powerdns.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "powerdns.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{- define "postgresql.dns" -}}
{{- printf "%s-postgresql.%s" .Release.Name .Release.Namespace -}}
{{- end -}}


{{/*
** POWERDNSADMIN
*/}}
{{/*
*** Common labels
*/}}
{{- define "powerdnsadmin.labels" -}}
helm.sh/chart: {{ include "powerdns.chart" . }}
{{ include "powerdnsadmin.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
*** Selector labels
*/}}
{{- define "powerdnsadmin.selectorLabels" -}}
app.kubernetes.io/name: {{ include "powerdns.name" . }}admin
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
*** database-url
*/}}
{{- define "powerdnsadmin.postgresql.dns" -}}
{{- printf "postgresql://%s:%s@%s-postgresql.%s:%.f/%s" .Values.postgresql.postgresqlUsername .Values.postgresql.postgresqlPassword .Release.Name .Release.Namespace .Values.postgresql.servicePort .Values.powerdnsadmin.db.name -}}
{{- end -}}


{{/*
** JOBS
*/}}
{{/*
*** Return the proper image name for the jobs
*/}}
{{- define "job.imageName" -}}
{{- $registryName := .Values.job.image.registry -}}
{{- $repositoryName := .Values.job.image.repository -}}
{{- $tag := .Values.job.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end -}}

{{/*
*** api-url
*/}}
{{- define "powerdnsadmin.api-url" -}}
{{- printf "http://%s-webserver.%s" (include "powerdns.fullname" .) .Release.Namespace -}}
{{- end -}}
