import { defineCollection, z } from "astro:content";
import { glob, file } from 'astro/loaders';

const typCollection = defineCollection({
    loader: glob({ pattern: "**/*.typ", base: "./src/content/typ" }),
    schema: z.object({
        title: z.string(),
        pub_date: z.string(),
        upd_date: z.string(),
        pub_time_key: z.number(),
        tags: z.array(z.string()).optional(),
        description: z.string().optional(),
    })
});

export const collections = {
    "typ": typCollection,
};
