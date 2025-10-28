import { Task } from '@serenity-js/core';
import { Click } from '@serenity-js/web';
import { RegistrarFamiliarPage } from '../ui/RegistrarFamiliarPage';

export class SeleccionarFamiliar{
    static with(numeroDocumento: string){
        return Task.where(`#actor selecciona el familiar con documento ${numeroDocumento}`,
            Click.on(RegistrarFamiliarPage.BTN_EDITAR(numeroDocumento))
        );
    }
} 
