# AGENTS.md - Combda Development Guide

## Build/Test Commands
- `npm run dev` - Start development server
- `npm run build` - Build for production  
- `npm run preview` - Preview production build
- `npm run check` - Run Astro type checking

## Code Style & Conventions

### Imports
- Use specific icon imports: `import ChevronRight from "@lucide/astro/icons/chevron-right"`
- NEVER import all icons: `import { ChevronRight } from "@lucide/astro"` (causes performance issues)

### TypeScript
- Uses strict TypeScript config (`astro/tsconfigs/strict`)
- All code must be type-safe

### TailwindCSS
- Primary color: `teal` palette (`teal-600`, `teal-700`, etc.)
- Background: `teal-100` for pages
- Rounded corners: `rounded-xl` for components
- Use `cn()` utility from `src/utils/cn.ts` for complex class combinations

### File Structure
- Components in `src/components/` as `.astro` files
- Single responsibility per component
- Use Astro frontmatter for imports and logic

### Error Handling
- Follow existing patterns in codebase
- Prefer explicit over implicit behavior