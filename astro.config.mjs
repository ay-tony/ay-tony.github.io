// @ts-check
import { defineConfig } from 'astro/config';
import { typst } from 'astro-typst';

// https://astro.build/config
export default defineConfig({
  integrations: [
    typst({
      options: {
        remPx: 14,
      },
      target: (id) => {
        console.debug(`Detecting ${id}`);
        if (id.endsWith('.html.typ') || id.includes('/html/'))
          return "html";
        return "svg";
      },
    }),
  ],
});
