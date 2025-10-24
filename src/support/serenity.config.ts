// import { configure, ArtifactArchiver } from '@serenity-js/core';
// import { ConsoleReporter } from '@serenity-js/console-reporter';
// import { Photographer, TakePhotosOfFailures, TakePhotosOfInteractions, TakePhotosBeforeAndAfterInteractions } from '@serenity-js/web';

// import path from 'path';

// // Carpeta donde se guardan los reportes
// const serenityOutputDir = path.resolve(process.cwd(), 'target/site/serenity');
// const requirementsDir = path.resolve(__dirname, '../src/features');
// const specDir = path.resolve(__dirname, '../src/features');


// configure({
//     crew: [
//         //ConsoleReporter.forDarkTerminals(),         // Reporte por consola        
//         //new SerenityBDDReporter(),  
//         ['@serenity-js/console-reporter', { 
//             showLineNumbers: true, 
//             showSummary: true,
//          }],                 // Reportes JSON para Serenity BDD
//          ['@serenity-js/serenity-bdd', {
           
//             // Ruta a la carpeta donde están tus features
//             specDirectory: specDir, 
//             reporter: { 
//                 includeAbilityDetails: true,
//                  requirementsDirectory: requirementsDir,
//                  requirementTypes: [
//                     { name: 'feature', icon: '🌟' },
//                     { name: 'capability', icon: '🎯' },
//                     { name: 'feature', icon: '📖' },
//                 ],
//              },
//         }],                       
//         ArtifactArchiver.storingArtifactsAt(serenityOutputDir),   // Archivos y evidencias
//         //Photographer.whoWill(TakePhotosOfFailures), // 📸 Fotos solo cuando falle
//         // También puedes usar:
//         Photographer.whoWill(TakePhotosOfInteractions),
//         //Photographer.whoWill(TakePhotosBeforeAndAfterInteractions),
//     ],
// });



import { configure, ArtifactArchiver } from '@serenity-js/core';
import { Photographer, TakePhotosOfFailures, TakePhotosOfInteractions, TakePhotosBeforeAndAfterInteractions } from '@serenity-js/web';
import path from 'path';

// 📁 Rutas principales
// //const featuresDir = path.resolve(process.cwd(), 'src/features');

configure({
//     crew: [
//         // 🎨 Reporte en consola con detalle
//         ['@serenity-js/console-reporter', { 
//             showLineNumbers: true, 
//             showSummary: true,
//         }],

//         // 📊 Generación del reporte Serenity BDD
//          ['@serenity-js/serenity-bdd', {
//             requirementsDirectory: featuresDir,   // ✅ Fuera del bloque "reporter"
//             specDirectory: featuresDir,            // ✅ Fuera también

//             reporter: {
//                 includeAbilityDetails: true,
//                 showStepDetails: true,
//             },

//             requirementTypes: [
//                 { name: 'capability', icon: '🎯' }, // primer nivel
//                 { name: 'feature', icon: '📘' },     // segundo nivel
//             ],
//         }],

//         // 📸 Captura de pantallas solo cuando falle algo
//         //Photographer.whoWill(TakePhotosOfFailures),
        
//         // También puedes usar:
//         Photographer.whoWill(TakePhotosOfInteractions),
// //         //Photographer.whoWill(TakePhotosBeforeAndAfterInteractions),

//         // 📁 Evidencias y artefactos
//         ArtifactArchiver.storingArtifactsAt(serenityOutputDir),

        
//     ],

        // // Configure reporting services
        // // see: https://serenity-js.org/handbook/reporting/
        // crew: [
        //     '@serenity-js/console-reporter',
        //     [ '@serenity-js/serenity-bdd', { specDirectory: 'src/features' } ],
        //     [ '@serenity-js/web:Photographer',      { strategy: 'TakePhotosOfInteractions'    } ],  // slower execution, more comprehensive reports
        //     // [ '@serenity-js/web:Photographer',   { strategy: 'TakePhotosOfFailures'        } ],  // fast execution, screenshots only when tests fail
        //     [ '@serenity-js/core:ArtifactArchiver', { outputDirectory: 'target/site/serenity' } ],
        // ]

   

       crew: [
            '@serenity-js/console-reporter',  
            ['@serenity-js/serenity-bdd',
                {
                    // 🔧 Ajuste correcto de rutas
                    requirementsDirectory: path.resolve(__dirname, '../features'),
                    specDirectory: path.resolve(__dirname, '../features'),
                    // 🔧 Jerarquía de requerimientos
                   //requirementTypes: ['capability', 'feature'],
                   reporter: {
                        includeAbilityDetails: true,
                        showStepDetails: true,
                    },
                },
            ],
            [ '@serenity-js/core:ArtifactArchiver', { outputDirectory: 'target/site/serenity' } ],
            [ '@serenity-js/web:Photographer', { strategy: 'TakePhotosOfInteractions' } ],
        ],


});




// export default {
//     serenity: {
//         project: 'Seguros ADL',
//     },
//     crew: [
//         '@serenity-js/console-reporter',
//         '@serenity-js/core:ArtifactArchiver',
//         '@serenity-js/cucumber',
//         '@serenity-js/playwright',
//         '@serenity-js/serenity-bdd',
//         [ '@serenity-js/web:Photographer', { strategy: 'TakePhotosOfInteractions' } ],
//     ],
//     serenityBDD: {
//         // 🟢 Aquí indicamos dónde están los features
//         specDirectory: path.resolve(__dirname, '../features'),
//         requirementsDirectory: path.resolve(__dirname, '../features'),
//         outputDirectory: path.resolve(__dirname, 'target/site/serenity'),        
//         requirementTypes: ['capability', 'feature'],
//     },
//     cucumber: {
//         require: ['src/steps/**/*.ts'],
//         paths: ['src/features/**/*.feature'],
//         publishQuiet: true,
//     },
// };
