---
applyTo: '**'
---
# Project: Combda

A B2B webstie for IT service company hosted on domain: `combda.site`. that provides the following services:

* IT infrastructure setup and management
* Cloud migration and hosting solutions
* Cybersecurity services and compliance audits
* Network architecture and monitoring
* DevOps consulting and automation
* Disaster recovery and business continuity planning
* Legacy system modernization

## Stack

- Astro.js v5
- TailwindCSS
- Terrform
- Ansible

## Design Instructions (Dark + Orange Edition)

**Theme**

* Dark mode only. No light fallback.
* Background: pure black `#000` or Tailwind `gray-950`.
* No gradients, no rounded corners, no shadows. Flat, hard-edged grid.

**Color Palette**

* Primary: Tailwind `orange` palette (main highlight).
* Accent: `orange-600` and `orange-800` for active states and borders.
* Neutral: Gray scale (`gray-200` to `gray-900`) for text, dividers, fills.
* Orange is a highlight only. Avoid flooding with it.

**Layout & Spacing**

* Strict grid, hard alignment.
* Padding scale: `p-4`, `p-6`, `p-8`. No excess whitespace.
* Max width: `max-w-screen-xl`.
* Vertical spacing: `space-y-6`.

**Typography**

* Font: Monospace stack (`ui-monospace, SFMono-Regular, Menlo, monospace`).
* Headings: Uppercase, bold, tight letter spacing.
* Body: Normal weight monospace, `leading-snug`.
* Size hierarchy: sharp increments (`text-4xl`, `text-2xl`, `text-lg`, `text-sm`).

**Components**

* All edges: `rounded-none`.
* Borders replace shadows (`border border-gray-700`).
* Buttons:

  * Default: `bg-orange-700 text-black border border-orange-800`
  * Hover: `bg-orange-800 text-white`
  * Always rectangular, never pill.
* Links: Permanent underline, orange on hover.
* Cards: `bg-gray-900 border border-gray-700 p-4`. No shadows.

**Icons**

* SVG-only.
* Colors: `orange-600` or neutral gray. No multi-color.
* Direct path imports only.

```ts
import Terminal from "@lucide/astro/icons/terminal";
import Rust from "simple-icons-astro/Rust";
```

**Imagery**

* Rectangular only.
* Border: `border border-gray-700`.
* Strict aspect ratio, no decorative cropping.

**Interactivity**

* Hover: Hard color shift (e.g., gray → orange).
* Focus: `outline-none ring-2 ring-orange-500`.
* Transitions: `transition-colors duration-150`.

**Accessibility**

* High-contrast text (`text-gray-100` on black).
* Orange used sparingly for focus, highlight, and CTAs only.
* No hidden states — every interactive element must have a visible state change.

**Class Names**

* Utility-first only.
* Use `clsx` or `tailwind-merge` for conditional class logic.
* No custom CSS unless impossible with utilities.


**Class Names**

* Utility-first, atomic. Use `clsx` or `tailwind-merge` for complex cases.
* No custom CSS unless absolutely necessary. Keep it declarative with Tailwind utilities only.
