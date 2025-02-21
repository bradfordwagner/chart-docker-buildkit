{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "fullname" -}}
{{ .Release.Name }}
{{- end }}

{{- define "chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "selector_labels" -}}
app: {{ .Release.Name }}
{{- end }}

{{- define "dns.in_cluster" }}
{{- .Release.Name }}-%d.{{ .Release.Name }}.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.driver.port }}
{{- end }}

{{- define "dns.api_gateway" -}}
tcp://{{ .Values.driver.api_gateway.hostname_format }}:443
{{- end }}
