import { defineCollection, z } from "astro:content";

const typCollection = defineCollection({
    type: "content",
    schema: z.object({
        title: z.string(),
        pub_date: z.string(),
        upd_date: z.string(),
        pub_date_key: z.number(),
        tags: z.array(z.string()).optional(),
        description: z.string().optional(),
    })
});

export const collections = {
    "typ": typCollection,
};
