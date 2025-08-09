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

## Design Instructions

**Theme**

* Persistent light theme with `teal-100` background across all pages.

**Color Palette**

* Primary: Tailwind `teal` palette for brand consistency.
* Accent: Darker teal shades (`teal-600` to `teal-800`) for interactive elements.
* Neutral: Gray scale (`gray-100` to `gray-700`) for text, dividers, and backgrounds within content areas.

**Layout & Spacing**

* Grid-based layout for content sections, maintaining consistent spacing (`p-6` to `p-12` for section padding).
* Maximum content width: `max-w-7xl`.
* Use consistent vertical rhythm with `space-y-8` for stacking content blocks.

**Typography**

* Font: Sans-serif system font stack for readability.
* Headings: Bold with slight tracking-tight.
* Body: Normal weight, comfortable line height (`leading-relaxed`).
* Hierarchy: Distinct size scaling (`text-4xl`, `text-2xl`, `text-lg`, `text-base`).

**Components**

* Rounded corners: `rounded-xl` for containers, cards, buttons and badges.
* Buttons: Solid teal background, white text, hover with darker teal shade.
* Links: Teal underline on hover.
* Cards: White background, subtle shadow (`shadow-md`), rounded edges, internal padding.

**Icons**

* Use SVG icons with teal accents.
* Use `simple-icons-astro` package and `@lucide/astro` package for astro

For performance optamization import icons like this

```ts
// lucide icons from @lucide/astro/icons/[name]
import ExternalLink from "@lucide/astro/icons/external-link";
import EyeOff from "@lucide/astro/icons/eye-off";
// simple icons from simple-icons-astro/[name]
import Postgresql from "simple-icons-astro/Postgresql";
import Stripe from "simple-icons-astro/Stripe";

// NEVER DO THIS
import { Link } from "@lucide/astro" // this will cause vite to bundle all icons and slow down dev
import { Mongodb } from "simple-icons-astro"; // this will cause vite to bundle all icons and dlow down dev
```

**Imagery**

* Images should maintain aspect ratio, rounded corners, and subtle border (`border-teal-200`).

**Interactivity**

* Hover and focus states with clear color shifts or shadow emphasis.
* Smooth transitions (`transition-all duration-300 ease-in-out`).

**Accessibility**

* Sufficient color contrast for text and interactive elements.
* Focus outlines using `ring-teal-400`.

**Class names**

Use `tailwind-merge`, `class-variance-authority` or `clsx` to handle complex rules.