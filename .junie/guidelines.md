# Project Guidelines

## Project Overview

### Project: Combda
A B2B website for an IT services company hosted on domain: `combda.site`. It provides the following services:

- IT infrastructure setup and management
- Cloud migration and hosting solutions
- Cybersecurity services and compliance audits
- Network architecture and monitoring
- DevOps consulting and automation
- Disaster recovery and business continuity planning
- Legacy system modernization

### Stack
- Astro.js v5
- TailwindCSS
- Terraform
- Ansible

## Design Instructions

**Theme**

- Persistent light theme with `teal-100` background across all pages.

**Color Palette**

- Primary: Tailwind `teal` palette for brand consistency.
- Accent: Darker teal shades (`teal-600` to `teal-800`) for interactive elements.
- Neutral: Gray scale (`gray-100` to `gray-700`) for text, dividers, and backgrounds within content areas.

**Layout & Spacing**

- Grid-based layout for content sections, maintaining consistent spacing (`p-6` to `p-12` for section padding).
- Maximum content width: `max-w-7xl`.
- Use consistent vertical rhythm with `space-y-8` for stacking content blocks.

**Typography**

- Font: Sans-serif system font stack for readability.
- Headings: Bold with slight tracking-tight.
- Body: Normal weight, comfortable line height (`leading-relaxed`).
- Hierarchy: Distinct size scaling (`text-4xl`, `text-2xl`, `text-lg`, `text-base`).

**Components**

- Rounded corners: `rounded-xl` for containers, cards, buttons and badges.
- Buttons: Solid teal background, white text, hover with darker teal shade.
- Links: Teal underline on hover.
- Cards: White background, subtle shadow (`shadow-md`), rounded edges, internal padding.

**Icons**

- Use SVG icons with teal accents.
- Use `simple-icons-astro` package and `@lucide/astro` package for Astro.

For performance optimization import icons like this:

```ts
// lucide icons from @lucide/astro/icons/[name]
import ExternalLink from "@lucide/astro/icons/external-link";
import EyeOff from "@lucide/astro/icons/eye-off";
// simple icons from simple-icons-astro/[name]
import Postgresql from "simple-icons-astro/Postgresql";
import Stripe from "simple-icons-astro/Stripe";

// NEVER DO THIS
import { Link } from "@lucide/astro" // this will cause vite to bundle all icons and slow down dev
import { Mongodb } from "simple-icons-astro"; // this will cause vite to bundle all icons and slow down dev
```

**Imagery**

- Images should maintain aspect ratio, rounded corners, and subtle border (`border-teal-200`).

**Interactivity**

- Hover and focus states with clear color shifts or shadow emphasis.
- Smooth transitions (`transition-all duration-300 ease-in-out`).

**Accessibility**

- Sufficient color contrast for text and interactive elements.
- Focus outlines using `ring-teal-400`.

**Class names**

Use `tailwind-merge`, `class-variance-authority` or `clsx` to handle complex rules.

## Development Guidelines

### Philosophy

#### Core Beliefs

- Incremental progress over big bangs - Small changes that compile
- Learning from existing code - Study and plan before implementing
- Pragmatic over dogmatic - Adapt to project reality
- Clear intent over clever code - Be boring and obvious

#### Simplicity Means

- Single responsibility per .astro file
- Avoid premature abstractions
- No clever tricks - choose the boring solution
- If you need to explain it, it's too complex

### Process

#### 1. Planning & Staging

Break complex work into 3-5 stages. Document in `PLAN_AND_STAGE.md`:

```markdown
## Stage N: [Name]
**Goal**: [Specific deliverable]
**Success Criteria**: [Testable outcomes]
**Status**: [Not Started|In Progress|Complete]
```
- Update `PLAN_AND_STAGE.md` as you progress

#### 2. Implementation Flow

1. Understand - Study existing patterns in codebase
2. Implement - Minimal code to MVP
3. Refactor - Clean up

#### 3. When Unclear

1. Research alternatives:
   - Find 2-3 similar implementations
   - Note different approaches used

2. Question fundamentals:
   - Is this the right abstraction level?
   - Can this be split into smaller problems?
   - Is there a simpler approach entirely?

3. Try different angle:
   - Different library/framework feature?
   - Different architectural pattern?
   - Remove abstraction instead of adding?

### Technical Standards

#### Architecture Principles

- Explicit over implicit - Clear data flow and dependencies

#### Code Quality

- Every action must:
  - Compile successfully
  - Follow project formatting/linting

### Decision Framework

When multiple valid approaches exist, choose based on:

1. Readability - Will someone understand this in 6 months?
2. Consistency - Does this match project patterns?
3. Simplicity - Is this the simplest solution that works?
4. Reversibility - How hard to change later?

### Project Integration

#### Learning the Codebase

- Find 3 similar features/components
- Identify common patterns and conventions
- Use same libraries/utilities when possible

#### Tooling

- Use project's existing build system
- Use project's formatter/linter settings
- Don't introduce new tools without strong justification

### Quality Gates

#### Definition of Done

- [ ] Code follows project conventions
- [ ] No linter/formatter warnings
- [ ] Implementation matches plan

### Important Reminders

Never:
- Make assumptions - verify with existing code

Always:
- Update plan documentation as you go
- Learn from existing implementations
- Stop after 3 failed attempts and reassess
