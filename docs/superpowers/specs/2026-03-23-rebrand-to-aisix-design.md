# NexusGateway → AISIX Rebrand — Design Spec

**Date:** 2026-03-23  
**Project:** HTTP & CSS Demo  
**Goal:** Replace all "NexusGateway" brand references with "AISIX" and update GitHub links

---

## Summary

Full brand rename from NexusGateway to AISIX across the entire project, including the main landing page, documentation files, and historical design/plan documents. Pure text replacement — no structural or CSS changes required.

**Key constraints:**
- New brand name uses all-caps: `AISIX`
- GitHub repo link updated to: `https://github.com/membphis/http_css_demo`
- All historical docs (`docs/superpowers/`) included in scope

---

## Replacement Rules

| Find | Replace |
|------|---------|
| `NexusGateway` | `AISIX` |
| `https://github.com/nexusgateway/nexusgateway` | `https://github.com/membphis/http_css_demo` |
| `https://github.com/nexusgateway/nexusgateway#readme` | `https://github.com/membphis/http_css_demo#readme` |
| `https://github.com/nexusgateway/nexusgateway/blob/main/LICENSE` | `https://github.com/membphis/http_css_demo/blob/main/LICENSE` |

---

## File Scope (10 files)

**Primary files:**
- `index.html`
- `README.md`
- `AGENTS.md`

**Historical docs:**
- `docs/superpowers/specs/2026-03-22-nexusgateway-landing-page-design.md`
- `docs/superpowers/specs/2026-03-23-hierarchical-readme-design.md`
- `docs/superpowers/specs/2026-03-23-hierarchical-readme-design-zh.md`
- `docs/superpowers/specs/2026-03-23-feature-card-glow-effect-design.md`
- `docs/superpowers/plans/2026-03-22-nexusgateway-landing-page.md`
- `docs/superpowers/plans/2026-03-23-hierarchical-readme-implementation.md`
- `docs/superpowers/plans/2026-03-23-hierarchical-readme-implementation-zh.md`

---

## Verification

- [ ] `grep -r "NexusGateway" .` returns no results
- [ ] `grep -r "nexusgateway" .` returns no results
- [ ] `index.html` renders "AISIX" in browser
- [ ] All GitHub links point to `https://github.com/membphis/http_css_demo`
