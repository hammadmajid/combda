---
applyTo: '**'
---
# Development Guidelines

## Philosophy

### Core Beliefs

- **Incremental progress over big bangs** - Small changes that compile
- **Learning from existing code** - Study and plan before implementing
- **Pragmatic over dogmatic** - Adapt to project reality
- **Clear intent over clever code** - Be boring and obvious

### Simplicity Means

- Single responsibility per .astro file
- Avoid premature abstractions
- No clever tricks - choose the boring solution
- If you need to explain it, it's too complex

## Process

### 1. Planning & Staging

Break complex work into 3-5 stages. Document in `PLAN_AND_STAGE.md`:

```markdown
## Stage N: [Name]
**Goal**: [Specific deliverable]
**Success Criteria**: [Testable outcomes]
**Status**: [Not Started|In Progress|Complete]
```
- Update `PLAN_AND_STAGE.md` as you progress

### 2. Implementation Flow

1. **Understand** - Study existing patterns in codebase
3. **Implement** - Minimal code to MVP
4. **Refactor** - Clean up

### 3. When Unclear

1. **Research alternatives**:
   - Find 2-3 similar implementations
   - Note different approaches used

2. **Question fundamentals**:
   - Is this the right abstraction level?
   - Can this be split into smaller problems?
   - Is there a simpler approach entirely?

3.. **Try different angle**:
   - Different library/framework feature?
   - Different architectural pattern?
   - Remove abstraction instead of adding?

## Technical Standards

### Architecture Principles

- **Explicit over implicit** - Clear data flow and dependencies

### Code Quality

- **Every action must**:
  - Compile successfully
  - Follow project formatting/linting

## Decision Framework

When multiple valid approaches exist, choose based on:

1. **Readability** - Will someone understand this in 6 months?
2. **Consistency** - Does this match project patterns?
3. **Simplicity** - Is this the simplest solution that works?
4. **Reversibility** - How hard to change later?

## Project Integration

### Learning the Codebase

- Find 3 similar features/components
- Identify common patterns and conventions
- Use same libraries/utilities when possible

### Tooling

- Use project's existing build system
- Use project's formatter/linter settings
- Don't introduce new tools without strong justification

## Quality Gates

### Definition of Done

- [ ] Code follows project conventions
- [ ] No linter/formatter warnings
- [ ] Implementation matches plan

## Important Reminders

**NEVER**:
- Make assumptions - verify with existing code

**ALWAYS**:
- Update plan documentation as you go
- Learn from existing implementations
- Stop after 3 failed attempts and reassess
