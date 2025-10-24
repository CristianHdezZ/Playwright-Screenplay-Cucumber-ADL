import { Task } from '@serenity-js/core';
import { Enter, Click, Scroll, Select } from '@serenity-js/web';
import { RegistrarMascotaPage } from '../ui/RegistrarMascotaPage';
import { tipoMascotaMap, razaGatoMap, razaPerroMap, generoMascotaMap } from '../utils/mapsMascotas';
import { MascotaData } from '../models/MascotaData';

export class RegistrarMascota {

    static withData(data: any) {
        console.log('📋 Filling out the pet registration form with data:');
        console.log(`Nombre: ${data.nombreMascota}`);
        console.log(`Tipo: ${data.tipoMascota}`);
        console.log(`Raza: ${data.raza}`);
        console.log(`Fecha de Nacimiento: ${data.fechaNacimiento}`);
        console.log(`Género: ${data.genero}`);
        
        // Selección de raza dependiendo del tipo de mascota
        const razaMap = data.tipoMascota === 'Gato' ? razaGatoMap : razaPerroMap;

        return Task.where('#actor completa el formulario de una mascota',

            Scroll.to(RegistrarMascotaPage.BTN_ADD_MASCOTA),
            Click.on(RegistrarMascotaPage.BTN_ADD_MASCOTA),

            Enter.theValue(data.nombreMascota).into(RegistrarMascotaPage.INPUT_NOMBRE_MASCOTA),
            Select.value(tipoMascotaMap[data.tipoMascota]).from(RegistrarMascotaPage.SELECT_TIPO_MASCOTA),
            Select.value(razaMap[data.raza]).from(RegistrarMascotaPage.SELECT_RAZA),
            Enter.theValue(data.fechaNacimiento).into(RegistrarMascotaPage.INPUT_FECHA_NACIMIENTO),
            Select.value(generoMascotaMap[data.genero]).from(RegistrarMascotaPage.SELECT_GENERO)
        );
    }
}

