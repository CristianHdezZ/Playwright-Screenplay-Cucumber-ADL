import { BeforeAll, AfterAll, Before, After, setDefaultTimeout } from '@cucumber/cucumber';
import { configure, Cast } from '@serenity-js/core';
import { BrowseTheWebWithPlaywright } from '@serenity-js/playwright';
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

    const headless = process.env.HEADLESS === 'true';

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

Before(async function () {
    // Crear un nuevo contexto y página por escenario para aislamiento
    const context = await browser.newContext();
    const page = await context.newPage();

    // Guardar en CustomWorld (this) para acceder en los steps
    this.context = context;
    this.page = page;

    // Configurar actor de Serenity/JS usando la página de este escenario
    this.actor = configure({
    actors: Cast.where(actor =>
        actor.whoCan(
            BrowseTheWebWithPlaywright.usingPage(page)   // ✅ acepta un Page directamente
        )
    )
   });

    console.log('🎭 Actor configurado para el escenario');
});

After(async function () {
    // Cerrar contexto de este escenario para liberar recursos
    await this.context?.close().catch(() => {});
    console.log('🧹 Contexto cerrado del escenario');
});

