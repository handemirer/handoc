# Observability

## Ne İşe Yarar?

Sistemin iç durumunu anlamak için logging, monitoring ve tracing'dir. Debugging, performance analysis ve incident response için kritik.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Logging best practices
- Metrics collection
- Distributed tracing
- Alerting strategies
- Error tracking
- Performance monitoring
- Tool selection (ELK, Prometheus, Jaeger)

## Kısa Cevap

Observability, logging, monitoring ve tracing'dir. Structured logging, metrics (Prometheus), distributed tracing (Jaeger), alerting, error tracking (Sentry) sistem health ve debugging için kritik.

## Detaylı Açıklama

### Logging

**Structured Logging:**
- JSON format
- Consistent schema
- Queryable (ELK, Splunk)

**Log Levels:**
- Trace: Detailed diagnostics
- Debug: Development information
- Information: General events
- Warning: Potential issues
- Error: Errors with recovery
- Critical: System failure

**Best Practices:**
- Correlation ID for request tracing
- No sensitive data (PII)
- Contextual information
- Log aggregation

**Tools:**
- ELK Stack (Elasticsearch, Logstash, Kibana)
- Splunk
- Graylog
- CloudWatch Logs

### Monitoring

**Metrics Types:**
- Counter: Monotonically increasing
- Gauge: Current value (up/down)
- Histogram: Distribution
- Summary: Statistics (quantiles)

**Key Metrics:**
- RED Method: Rate, Errors, Duration
- USE Method: Utilization, Saturation, Errors
- Golden Signals: Latency, Traffic, Errors, Saturation

**Tools:**
- Prometheus: Metrics collection
- Grafana: Visualization
- Datadog: SaaS monitoring
- CloudWatch: AWS monitoring

### Distributed Tracing

**Purpose:**
- Request flow across services
- Latency analysis
- Dependency mapping
- Error root cause

**Concepts:**
- Trace: Single request journey
- Span: Single operation
- Trace ID: Correlates spans
- Parent-child relationships

**Tools:**
- Jaeger: Open-source tracing
- Zipkin: Distributed tracing
- AWS X-Ray: Cloud tracing
- Datadog APM: SaaS tracing

### Alerting

**Alert Types:**
- Threshold-based: Metric crosses threshold
- Anomaly detection: Unusual pattern
- Rate of change: Sudden change
- Composite: Multiple conditions

**Best Practices:**
- Alert on symptoms, not causes
- Actionable alerts
- Avoid alert fatigue
- Severity levels (P0, P1, P2, P3)

**On-Call:**
- Runbooks
- Escalation policies
- Incident response process

### Error Tracking

**Purpose:**
- Exception aggregation
- Stack trace analysis
- User impact tracking
- Regression detection

**Tools:**
- Sentry: Error tracking
- Rollbar: Exception monitoring
- Bugsnag: Error reporting

## Kendi Projelerimden Örnek

Real-time market data sisteminde:

- Serilog ile structured logging (JSON)
- Correlation ID ile request tracing
- Prometheus metrics (rate, latency, errors)
- Grafana dashboard'lar
- Jaeger ile distributed tracing
- Sentry ile error tracking
- Alerting (P0: system down, P1: data delay)

## Sık Sorulan Sorular

**Logging / monitoring / tracing farkı nedir?**
Logging: Event records. Monitoring: Metrics over time. Tracing: Request flow across services.

**Structured logging neden önemlidir?**
Queryable, consistent schema, easy parsing, better analysis.

**Distributed tracing ne işe yarar?**
Request flow across services, latency analysis, dependency mapping, error root cause.

**Alerting best practices nelerdir?**
Alert on symptoms, actionable alerts, avoid fatigue, severity levels.

**RED method nedir?**
Rate (requests), Errors (failed requests), Duration (latency). Monitoring metrics.

## Dikkat Edilmesi Gerekenler

- Log volume management
- Sensitive data avoidance
- Alert fatigue prevention
- Sampling for high traffic
- Metric cardinality
- Trace retention

## Eksik Olduğum Noktalar

- [ ] Advanced Prometheus queries
- [ ] Log aggregation architecture
- [ ] SLI/SLO definition
- [ ] Error budget calculation
- [ ] Incident response framework

## Tekrar Notları

- Logging = Structured (JSON), levels, correlation ID
- Monitoring = Metrics (counter, gauge, histogram), RED method
- Tracing = Trace, span, trace ID, request flow
- Alerting = Threshold-based, actionable, severity levels
- Tools = ELK, Prometheus/Grafana, Jaeger, Sentry

## Tekrar Kontrol Listesi

- [ ] Logging best practices'ı anla
- [ ] Monitoring metrics'lerini bil
- [ ] Distributed tracing'ı öğren
- [ ] Alerting stratejilerini bil
- [ ] Tool ekosistemini anla
