# Notification System

## Problem

Büyük ölçekli bir uygulama için çok kullanıcıya notification gönderme sistemi. Email, SMS, push notification kanalları üzerinden notification delivery.

## Gereksinimler

### Functional Requirements
- Multi-channel notification (email, SMS, push)
- User preference management
- Notification templates
- Scheduling and delayed delivery
- Delivery status tracking
- Rate limiting per user

### Non-Functional Requirements
- **Throughput**: 1M+ notifications/day
- **Latency**: < 1s for notification queue
- **Reliability**: No notification loss
- **Scalability**: Horizontal scaling
- **Cost**: Cost-effective delivery

## Varsayımlar

- User count: 1M+
- Daily notifications: 1M+
- Peak rate: 10K notifications/minute
- Channels: Email, SMS, Push
- Third-party providers available (SendGrid, Twilio, FCM)

## High-Level Design

```
┌─────────────┐
│ Application │
└──────┬──────┘
       │
       ▼
┌─────────────────┐
│ Notification   │
│ API            │
└──────┬──────────┘
       │
       ▼
┌─────────────────┐
│ Message Queue   │
│ (Kafka/RabbitMQ)│
└──────┬──────────┘
       │
       ├──────────────┐
       ▼              ▼
┌─────────────┐  ┌─────────────┐
│ Email       │  │ SMS         │
│ Worker      │  │ Worker      │
└──────┬──────┘  └──────┬──────┘
       │                │
       ▼                ▼
┌─────────────┐  ┌─────────────┐
│ SendGrid    │  │ Twilio      │
└─────────────┘  └─────────────┘
```

## Data Model

**PostgreSQL:**
```sql
CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    type VARCHAR(50),
    channel VARCHAR(20),
    status VARCHAR(20),
    content JSONB,
    scheduled_at TIMESTAMP,
    sent_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE user_preferences (
    user_id INTEGER PRIMARY KEY,
    email_enabled BOOLEAN DEFAULT true,
    sms_enabled BOOLEAN DEFAULT false,
    push_enabled BOOLEAN DEFAULT true
);
```

## API Tasarımı

```
POST /api/notifications - Send notification
GET /api/notifications/{id} - Get notification status
GET /api/users/{id}/preferences - Get user preferences
PUT /api/users/{id}/preferences - Update preferences
```

## Cache Stratejisi

**Redis:**
- User preferences cache
- Rate limiting (token bucket)
- Template cache

## Message Queue / Event Flow

**Kafka Topics:**
- `notifications`: Raw notification requests
- `notifications-email`: Email notifications
- `notifications-sms`: SMS notifications
- `notifications-push`: Push notifications

**Consumer Groups:**
- Email workers
- SMS workers
- Push workers

## Scalability

**Horizontal Scaling:**
- Multiple API instances
- Worker pool scaling
- Queue partitioning

**Rate Limiting:**
- Per user rate limiting
- Per channel rate limiting
- Global rate limiting

## Reliability

**Retry Mechanism:**
- Exponential backoff
- Max retry limit
- DLQ for failed notifications

**Idempotency:**
- Unique notification ID
- Deduplication logic

## Observability

**Metrics:**
- Delivery rate
- Error rate per channel
- Latency metrics
- Queue depth

**Logging:**
- Delivery status
- Error details
- Provider responses

## Trade-Offs

**Immediate vs Scheduled:**
- Scheduled adds complexity
- Immediate simpler but less flexible

**Push vs Pull:**
- Push: Real-time, complex
- Pull: Simpler, higher latency

## Mülakatta Nasıl Anlatırım?

"Multi-channel notification sistemi. Message queue ile decoupling, worker pool ile processing, rate limiting ile abuse prevention. Retry mechanism ve DLQ ile reliability."

## Kırmızı Bayrak Cevaplar

- "Her notification'ı synchronous gönderirim."
- "Rate limiting gerekmez."
- "Retry sonsuz yaparım."
- "Queue kullanmam, direkt API çağırırım."

## Tekrar Kontrol Listesi

- [ ] Bu konuyu kısa ve net anlatabiliyorum.
- [ ] Kendi projemden örnek verebiliyorum.
- [ ] Mülakatçının aslında neyi ölçtüğünü biliyorum.
- [ ] Kırmızı bayrak cevaplardan kaçınıyorum.
