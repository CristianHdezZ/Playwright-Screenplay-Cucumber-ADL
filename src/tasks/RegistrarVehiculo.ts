import { Task } from '@serenity-js/core';
import { Enter, Click, Select, Scroll } from '@serenity-js/web';
import { RegistrarVehiculoPage } from '../ui/RegistrarVehiculoPage';
import { VehiculoData } from '../models/VehiculoData';

export class RegistrarVehiculo {

    static withData(data: VehiculoData) {
        console.log('🚗 Llenando formulario de registro de vehículo con los siguientes datos:');
        console.log(`Placa: ${data.placa}`);
        console.log(`Modelo: ${data.modelo}`);
        console.log(`Es Propietario: ${data.esPropietario}`);
        console.log(`Propietario: ${data.propietario}`);
        console.log(`Tipo: ${data.tipoVehiculo}`);
        console.log(`Marca: ${data.marca}`);
        console.log(`Departamento: ${data.departamento}`);
        console.log(`Ciudad: ${data.ciudad}`);
        console.log(`Tipo de Servicio: ${data.tipoServicio}`);
        

        // Determinar si es propietario
        const esPropietario = (data.esPropietario || '').trim().toLowerCase().startsWith('s') ? 'Sí' : 'No';

        return Task.where(`#actor completa el formulario de registro de vehículo`,

            // Scroll y abrir formulario
            Scroll.to(RegistrarVehiculoPage.BTN_ADD_VEHICULO),
            Click.on(RegistrarVehiculoPage.BTN_ADD_VEHICULO),

            // Seleccionar radio dinámico de propietario
            Click.on(RegistrarVehiculoPage.RADIO_PROPIETARIO(esPropietario)),

            // Solo seleccionar propietario en el select si NO es 'Sí'
            ...(esPropietario !== 'Sí' ? [
                Select.option(data.propietario).from(RegistrarVehiculoPage.SELECT_PROPIETARIO)
            ] : []),

            // Completar otros campos
            Enter.theValue(data.placa).into(RegistrarVehiculoPage.INPUT_PLACA),
            Enter.theValue(data.modelo).into(RegistrarVehiculoPage.INPUT_MODELO),
            Select.option(data.tipoVehiculo).from(RegistrarVehiculoPage.SELECT_TIPO_VEHICULO),
            Select.option(data.marca).from(RegistrarVehiculoPage.SELECT_MARCA),
            Select.option(data.departamento).from(RegistrarVehiculoPage.SELECT_DEPARTAMENTO),
            Select.option(data.ciudad).from(RegistrarVehiculoPage.SELECT_CIUDAD),
            Select.option(data.tipoServicio).from(RegistrarVehiculoPage.SELECT_TIPO_SERVICIO),
        );
    }
}
