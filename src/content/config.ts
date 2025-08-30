import { defineCollection, z } from "astro:content";

const services = defineCollection({
  type: "content",
  schema: z.object({
    title: z.string(),
    description: z.string(),
    features: z.array(z.string()),
    icon: z.enum(["server", "cloud", "shield", "wifi", "cog", "database", "rotate-ccw"]),
    order: z.number().optional().default(0),
    ctaLabel: z.string().optional().default("Learn More"),
    ctaHref: z.string().optional().default("#contact"),
  }),
});

export const collections = { services };
