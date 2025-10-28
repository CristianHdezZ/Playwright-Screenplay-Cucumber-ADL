import { Task, Duration, Wait } from '@serenity-js/core';
import { Enter, Click, Scroll, Select, isVisible } from '@serenity-js/web';
import { RegistrarFamiliarPage } from '../ui/RegistrarFamiliarPage';
import { tipoDocumentoMap, generoMap, parentescoMap, epsMap, departamentoMap, ciudadMap } from '../utils/maps';
import { FamiliarData } from '../models/FamiliarData';


export class RegisterFamiliar {

    static withData(data: FamiliarData) {
        console.log('📋 Filling out the familiar registration form with data:');
        console.log(`Primer Nombre: ${data.primerNombre}`);
        console.log(`Segundo Nombre: ${data.segundoNombre}`);
        console.log(`Primer Apellido: ${data.primerApellido}`);
        console.log(`Segundo Apellido: ${data.segundoApellido}`);
        console.log(`Tipo Documento: ${data.tipoDocumento}`);
        console.log(`Número Documento: ${data.numeroDocumento}`);
        console.log(`Fecha Nacimiento: ${data.fechaNacimiento}`);
        
        return Task.where('#actor completa el formulario de un familiar',
            

            Scroll.to(RegistrarFamiliarPage.BUTTON_ADD_FAMILIA),
            Click.on(RegistrarFamiliarPage.BUTTON_ADD_FAMILIA),

            Enter.theValue(data.primerNombre).into(RegistrarFamiliarPage.PRIMER_NOMBRE),
            Enter.theValue(data.segundoNombre).into(RegistrarFamiliarPage.SEGUNDO_NOMBRE),
            Enter.theValue(data.primerApellido).into(RegistrarFamiliarPage.PRIMER_APELLIDO),
            Enter.theValue(data.segundoApellido).into(RegistrarFamiliarPage.SEGUNDO_APELLIDO),
            Enter.theValue(data.numeroDocumento).into(RegistrarFamiliarPage.NUMERO_DOCUMENTO),
            Enter.theValue(data.fechaNacimiento).into(RegistrarFamiliarPage.FECHA_NACIMIENTO),

            Select.value(tipoDocumentoMap[data.tipoDocumento]).from(RegistrarFamiliarPage.TIPO_DOCUMENTO),
            Select.value(generoMap[data.genero]).from(RegistrarFamiliarPage.GENERO),
            Select.value(parentescoMap[data.parentesco]).from(RegistrarFamiliarPage.PARENTESCO),
            Select.value(epsMap[data.eps]).from(RegistrarFamiliarPage.EPS),

            // Departamento → Ciudad
            Select.value(departamentoMap[data.departamento]).from(RegistrarFamiliarPage.DEPARTAMENTO),
            Wait.upTo(Duration.ofSeconds(5)).until(RegistrarFamiliarPage.CIUDAD, isVisible()),
            Select.value(ciudadMap[data.departamento][data.ciudad]).from(RegistrarFamiliarPage.CIUDAD),                
            
        );

             
    }
}
