import { BeforeAll, AfterAll, Before, After, setDefaultTimeout } from '@cucumber/cucumber';
import { configure, Cast } from '@serenity-js/core';
import { BrowseTheWebWithPlaywright } from '@serenity-js/playwright';
import { CallAnApi } from '@serenity-js/rest';
import * as playwright from 'playwright';
import fs from 'fs';
import path from 'path';
import * as dotenv from 'dotenv';
dotenv.config();

setDefaultTimeout(60 * 1000); // Timeout global para todos los escenarios

const serenityOutputDir = path.resolve(process.cwd(), 'target/site/serenity');
let browser: playwright.Browser;

BeforeAll(async () => {
    // Limpiar reportes previos de Serenity
    if (fs.existsSync(serenityOutputDir)) {
        fs.rmSync(serenityOutputDir, { recursive: true, force: true });
        console.log('✅ Se limpiaron los reportes de Serenity');
    }

    const headless = process.env.HEADLESS !== 'true';

    // Lanzar Chrome real (no Chromium) una sola vez para todos los escenarios
    browser = await playwright.chromium.launch({
        channel: 'chrome',
        headless,
    });

    console.log('✅ Navegador lanzado globalmente');
});

AfterAll(async () => {
    await browser?.close();
    console.log('✅ Navegador cerrado globalmente');
});

// 

Before(async function () {
    // Crear un nuevo contexto y página por escenario para aislamiento
    const context = await browser.newContext();
    const page = await context.newPage();

    // Guardar en CustomWorld (this) para acceder en los steps
    this.context = context;
    this.page = page;

    // Variables del entorno
    //const apiUrl = 'https://benefits-dev-api.migrupoesaval.com';
    const apiUrl = 'https://benefits-api.migrupoesaval.com';
    const token = process.env.AT || '';

    // Configurar actor con habilidades tanto de front (Playwright) como de API (CallAnApi)
    this.actor = configure({
        actors: Cast.where(actor =>
            actor.whoCan(
                BrowseTheWebWithPlaywright.usingPage(page),
                CallAnApi.using({
                    baseURL: apiUrl,
                    headers: {
                        Authorization: `Bearer ${token}`,
                        'Content-Type': 'application/json',
                    },
                })
            )
        )
    });

    console.log('🎭 Actor configurado con habilidades de Playwright y API');
});

After(async function () {
    // Cerrar contexto de este escenario para liberar recursos
    await this.context?.close().catch(() => {});
    console.log('🧹 Contexto cerrado del escenario');
});


