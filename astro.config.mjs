// @ts-check
import { defineConfig } from 'astro/config';
import { typst } from 'astro-typst';
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  site: "https://solitairemiya.cn",
  vite: {
    ssr:{
      external: ["@myriaddreamin/typst-ts-node-compiler"],
    },
  },
  integrations: [typst({
    options: {
      remPx: 14,
    },
    target: (id) => {
      console.debug(`Detecting ${id}`);
      if (id.endsWith('.html.typ') || id.includes('/html/'))
        return "html";
      else if (id.endsWith(".svg.typ") || id.includes("/svg/"))
        return "svg";
      else
        return "html";
    },
  }), sitemap()],
});
