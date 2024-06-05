{{/*
Return the fully qualified app name.
*/}}
{{- define "ob.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the name of the service account.
*/}}
{{- define "ob.serviceAccountName" -}}
{{- if .Values.serviceAccount.name }}
{{- printf "%s" .Values.serviceAccount.name }}
{{- else }}
{{ include "ob.fullname" . }}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "ob.labels" -}}
helm.sh/chart: {{ include "ob.chart" . }}
{{ include "ob.selectorLabels" . | nindent 4 }}
{{- end -}}

{{/*
Return the chart name.
*/}}
{{- define "ob.chart" -}}
{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "ob.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ob.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Return the chart name as a string.
*/}}
{{- define "ob.name" -}}
{{ .Chart.Name }}
{{- end -}}
