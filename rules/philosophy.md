---
purpose: Core engineering principles
---

- **Architecture** - Class responsibilities defined in [Architecture Map](docs/architecture.md)
- **KISS** - Simple solutions over complex ones.
- **YAGNI** - Build only what's needed now. Less code is better.
- **DRY** - Single source of truth. Never Copy-paste
- **OOP** - Follow OOP approach and best practices
- **SOLID** - Enforce Single responsibility principle, keep in mind others when possible
- **No Magic** - Make everything explicit, no hidden behavior or implicit transformations
- **Small Steps** - Minimal changes, commit often
- **Use Libraries** - Prefer established libraries (ORMs, validators, parsers) over reimplementing features; check ecosystem before writing custom code
- **Backwards Compatibility** - Don't keep code for backwards compatibility purposes
- **CI** - Automate all possible quality checks
- **Investigate, Don't Mask** - When a check fails or unexpected behavior occurs, investigate the root cause instead of adding defensive code to mask the symptom
