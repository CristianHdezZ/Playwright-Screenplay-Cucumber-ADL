import { When } from '@cucumber/cucumber';
import { Actor, actorInTheSpotlight, Wait, Duration } from '@serenity-js/core';
import { RegistrarVehiculo } from '../tasks/RegistrarVehiculo';
import { VehiculoData } from '../models/VehiculoData';
import { ExcelReader } from '../utils/ExcelReader';
import { CompletarRegistro } from "../tasks/CompletarRegistro";
import { ReviewRegistrarFamiliar } from "../questions/ReviewRegistrarFamiliar";
import { Ensure, equals } from "@serenity-js/assertions";

When('{pronombre} usuario completa el formulario de vehículo con los siguientes datos', 
{ timeout: 40000 }, 
async (actor: Actor, dataTable) => {
    const [data] = dataTable.hashes();
    await actorInTheSpotlight().attemptsTo(
        RegistrarVehiculo.withData(data)
    );
});

// ⚙️ Step para registrar múltiples vehículos desde Excel
When('{pronombre} usuario registra todos los vehículos desde el archivo {string}', 
{ timeout: 120000 },
async (actor: Actor, filePath: string) => {
    const vehiculos: VehiculoData[] = ExcelReader.readSheet<VehiculoData>(filePath, 'Vehiculos');
    console.log(`📘 Cargando ${vehiculos.length} vehículos desde ${filePath}`);

    for (const data of vehiculos) {
        console.log("🚗 Registrando vehículo:", data);       

        await actor.attemptsTo(RegistrarVehiculo.withData(data));

        console.log("🖱️ Haciendo clic en Registrar");
        await actor.attemptsTo(CompletarRegistro.conFomularioLleno());

        console.log("⏳ Esperando antes de validar mensaje de éxito");
        await actor.attemptsTo(Wait.for(Duration.ofSeconds(5)));

        console.log("✅ Validando mensaje de éxito");
        await actor.attemptsTo(
            Ensure.that(ReviewRegistrarFamiliar.isVisibleSuccessMessage, equals(true))
        );
    }
});
