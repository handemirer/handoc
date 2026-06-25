# Security / Auth

## Ne İşe Yarar?

Sistem güvenliği için authentication (kimlik doğrulama) ve authorization (yetkilendirme) mekanizmalarıdır.

## Mülakatçı Bu Konuda Neyi Test Eder?

- Authentication vs authorization farkı
- JWT token yapısı ve kullanımı
- OAuth2 ve OpenID Connect
- Session vs token-based auth
- Password hashing
- API security (rate limiting, input validation)
- Common vulnerabilities (OWASP Top 10)

## Kısa Cevap

Authentication kimlik doğrulama, authorization yetkilendirme. JWT token stateless auth, OAuth2 delegation, OpenID Connect identity layer. Password hashing (bcrypt), rate limiting, input validation kritik.

## Detaylı Açıklama

### Authentication vs Authorization

**Authentication (AuthN):**
- Kimlik doğrulama
- "Who are you?"
- Login, credentials

**Authorization (AuthZ):**
- Yetkilendirme
- "What can you do?"
- Permissions, roles, policies

### JWT (JSON Web Token)

**Structure:**
- Header: Algorithm, token type
- Payload: Claims (user data)
- Signature: Cryptographic signature

**Claims:**
- Registered: iss, sub, aud, exp, iat
- Public: Custom defined
- Private: Application-specific

**Benefits:**
- Stateless
- Cross-platform
- Self-contained
- No database lookup

**Security:**
- Sign with secret or private key
- Validate signature
- Check expiration
- HTTPS required

**Drawbacks:**
- Cannot revoke (without blacklist)
- Token size overhead
- Refresh token needed

### OAuth2

**Roles:**
- Resource Owner: User
- Client: Application
- Authorization Server: Issues tokens
- Resource Server: API

**Grant Types:**
- Authorization Code: Web apps
- Implicit: Legacy, not recommended
- Client Credentials: Machine-to-machine
- Resource Owner Password: Legacy, not recommended
- Refresh Token: Obtain new access token

**Flow:**
1. User redirects to auth server
2. User approves
3. Auth server returns code
4. Client exchanges code for token
5. Client uses token to access API

### OpenID Connect

**Identity Layer:**
- Built on OAuth2
- Adds authentication
- ID Token (JWT)
- UserInfo endpoint

**ID Token:**
- Contains user identity
- Signed by auth server
- Standard claims

### Session vs Token-based Auth

**Session-based:**
- Server-side session store
- Cookie with session ID
- Server controls session
- Memory overhead

**Token-based (JWT):**
- Client-side token
- Stateless
- Scalable
- Revocation challenge

### Password Hashing

**Why Hash?**
- Never store plain text
- One-way function
- Prevent rainbow table attacks

**Algorithms:**
- bcrypt: Recommended, slow, salt built-in
- Argon2: Modern, memory-hard
- PBKDF2: NIST approved
- Avoid: MD5, SHA1 (too fast)

**Salt:**
- Random data added
- Prevents rainbow tables
- Built into bcrypt

### API Security

**Rate Limiting:**
- Prevent abuse
- Token bucket algorithm
- Sliding window
- Per user/IP

**Input Validation:**
- Validate all inputs
- Type checking
- Length limits
- Whitelist approach

**HTTPS:**
- Encryption in transit
- Prevent MITM
- Required for auth

**CORS:**
- Cross-origin requests
- Whitelist origins
- Preflight requests

**OWASP Top 10:**
- Injection
- Broken authentication
- Sensitive data exposure
- XML external entities
- Broken access control
- Security misconfiguration
- XSS
- Insecure deserialization
- Using components with known vulnerabilities
- Insufficient logging

## Kendi Projelerimden Örnek

Real-time market data API'sinde:

- JWT token-based authentication
- Role-based authorization (Admin, User)
- Refresh token rotation
- Rate limiting per user
- Input validation on all endpoints
- HTTPS enforcement
- CORS configuration

## Sık Sorulan Sorular

**Authentication ve authorization farkı nedir?**
Authentication: Kimlik doğrulama (who are you). Authorization: Yetkilendirme (what can you do).

**JWT neden kullanılır?**
Stateless, cross-platform, self-contained, scalable. Drawback: Revocation challenge.

**OAuth2 ne işe yarar?**
Delegation authorization. Third-party apps access user data without sharing credentials.

**Password hashing neden önemlidir?**
Never store plain text. One-way function. Prevent rainbow table attacks. Use bcrypt.

**Rate limiting nasıl yapılır?**
Token bucket, sliding window. Per user/IP. Prevent abuse, protect resources.

## Dikkat Edilmesi Gerekenler

- Never store plain text passwords
- Always use HTTPS
- Validate all inputs
- Implement rate limiting
- Keep dependencies updated
- Log security events
- Principle of least privilege

## Eksik Olduğum Noktalar

- [ ] OAuth2 implementation details
- [ ] OpenID Connect flows
- [ ] CSRF protection
- [ ] XSS prevention
- [ ] Security headers (CSP, HSTS)

## Tekrar Notları

- AuthN = Authentication (who are you)
- AuthZ = Authorization (what can you do)
- JWT = Stateless, signed, claims-based
- OAuth2 = Delegation authorization
- Password hashing = bcrypt, never plain text
- API security = Rate limiting, input validation, HTTPS

## Tekrar Kontrol Listesi

- [ ] Authentication vs authorization farkını anla
- [ ] JWT yapısını ve kullanımını bil
- [ ] OAuth2 ve OpenID Connect'i öğren
- [ ] Password hashing önemini anla
- [ ] API security best practices'ı uygula
