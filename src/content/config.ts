import {defineCollection, z} from "astro:content";

const services = defineCollection({
    type: "content",
    schema: z.object({
        title: z.string(),
        description: z.string(),
        features: z.array(z.string()),
        icon: z.enum(["server", "cloud", "shield", "wifi", "cog", "database", "rotate-ccw"]),
    }),
});

export const collections = {services};
