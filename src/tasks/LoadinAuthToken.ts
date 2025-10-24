import { Task, Interaction} from "@serenity-js/core";
import { BrowseTheWebWithPlaywright } from '@serenity-js/playwright';
import type { Page as PWPage } from 'playwright';


export class LoadinAuthToken {
    static andNavigateToHomepage() {        
        return Task.where(`#load the authentication token and navigate to homepage`,
            // Aquí podrías agregar la lógica real para cargar el token y navegar
            Interaction.where(`#set localStorage tokens`, async actor => {
                // Obtenemos la página nativa de Playwright
                const serenityPage = await BrowseTheWebWithPlaywright.as(actor).currentPage();
                const page: PWPage = (serenityPage as any).page; // 🔹 casteo seguro a la página nativa

                const localStorageVars = {
                    RT: process.env.RT || '',
                    UG: process.env.UG || '',
                    entityImg: process.env.entityImg || '',
                    entityName: process.env.entityName || '',
                    eps: process.env.eps || '',
                    name: process.env.name || '',
                    rol: process.env.rol || '',
                    'tgt:tlm:lower': process.env.tgt_tlm_lower || '',
                    'tgt:tlm:upper': process.env.tgt_tlm_upper || '',
                    AT: process.env.AT || '',
                    CB: process.env.CB || '',
                    Clltr: process.env.Clltr || '',
                    EM: process.env.EM || '', 
                    IC: process.env.IC || '',  
                    IE: process.env.IE || '',               
                };

                // Usamos evaluate del Page nativo                
                 await page.addInitScript((vars) => {
                  window.localStorage.clear();
                  for (const [key, value] of Object.entries(vars)) {
                    window.localStorage.setItem(key, value as string);
                  }
                }, localStorageVars);
                console.log('✅ LocalStorage variables have been set.');
                //console.log(localStorageVars);
                //Navegamos a la URL final
                await page.goto(process.env.BASE_URL || 'https://benefits-dev.migrupoesaval.com/benefits/home', {
                    waitUntil: 'domcontentloaded',
                });
                
            }),
            // Espera opcional para asegurar carga completa
            Interaction.where(`#wait 5 seconds`, async () => {
                await new Promise(resolve => setTimeout(resolve, 5000));
            }),            
        );    
    }   
}