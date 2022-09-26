% Authentification / autorisation :<br>le cookie et ses rejetons
% Geoffroy Couprie &<br>Clément Delafargue
% DevFest Nantes 2022-10-21

---

## Let’s talk auth

<details role="note">
this is a note
</details>

---

## Authn / Authz

---

## I want to log in and stay connected

---

## Sessions + 🍪 cookie 🍪

<details role="note">
State stored on the server + a cookie to link requests to said state
</details>

---

## Sessions + 🍪 cookie 🍪

<details role="note">
Limitations
</details>

---

## 🔏🍪 Signed cookie

<details role="note">
Instead of storing state on the server, it's directly part of the cookie.
It's signed to avoid tampering
</details>

---

## JWT, PASETO

<details role="note">
Signed cookies originated in full-stack web frameworks, with ad-hoc implementations.  
The same mechanism can be used as a general-purpose API token. JWT are a common choice for  
that, they allow to sign a JSON payload with various algorithms. They have a number of  
shortcomings that make them very easy to misuse. PASETO has been developed as a safer alternative.  
</details>

---

## What do we put in this cookie anyway?

---

## Just authentification data

<details role="note">
for simple architectures with a full-stack monolith, the user id is a common choice
</details>

---

## Self-contained authorization rules

<details role="note">
in a service-oriented architecture with API-to-API calls, identity information alone is not enough
</details>

---

## Authorization rules

<details role="note">
In any case, authentification (when it makes sense) is just the first step. We need to actually talk about authorization at some point
</details>

---

## RBAC / ABAC

<details role="note">
</details>

---

## Homegrown solutions

<details role="note">
</details>

---

## Off the shelf solutions

<details role="note">
Zanzibar & copycats: work well (if you're google). Quite restrictive, both in terms of
architecture, and expressivity
</details>

---

## I want to log in with google. That's oauth, right?

<details role="note">
</details>

---

## oauth is about authorization

---

## OIDC

---

## Authorization rules

<details role="note">
In the case of access delegation, fine-grained access control is even more important:
one rarely wants to delegate full control to a third-party tool
</details>

---

## Attenuation

<details role="note">
Given an initial scope, we want to restrict it so that an actor can perform a limited set of operations
while staying within the initial scope
</details>

---

## _regular_ attenuation

<details role="note">
All the attenuation logic is handled server-side, the token contains a reference to the initial scope  
and to the allowed subset of rights. Creating a token with attenuated rights requires talking to the  
token generation service
</details>

---

## eg: IAM roles

---

## _offline_ attenuation

<details role="note">
Existing credentials can be _attenuated_ by appending restrictions, without having to talk to the token  
generation service.
</details>

---

## Macaroons

<details role="note">
Macaroons provide offline attenuation, through the use of _caveats_. It even allows 3rd-party attenuation:  
the token holder has to provide a proof, from an external service, that the token can be used in a specific context
</details>

---

# Why biscuits?

- rights management over a polyglot architecture
- cross-language authorization logic
- no ties to specific authorization patterns
- offline attenuation
- asymmetric cryptography

---

## Datalog for authorization logic

<details role="note">
Easy to review in a cross-language setup (no language-specific implementation of rights management)  
Easy encoding of nesting / hierarchical roles  
Expressive, not tied to specific patterns and encodings
</details>

---

## Offline attenuation

<details role="note">
Checks can be added to an existing token
</details>

---

## Asymmetric cryptography

<details role="note">
Only the token emitter needs to know secrets, the rest of the services use public keys
</details>

---

- many different tools
- most of them are either super complex or super rigid
- mostly identity and delegation
- ad-hoc solutions for actual authorization
- hard to audit code, often duplicated

---

- biscuit is a platform
- particularly suited to distributed architectures
- datalog for rights management
- offline attenuation
