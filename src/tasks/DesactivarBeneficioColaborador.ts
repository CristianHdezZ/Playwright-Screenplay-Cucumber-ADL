import { Task, Wait, Duration } from '@serenity-js/core';
import { Click, Select, Scroll } from '@serenity-js/web';
import { VerificarTarifasPage } from '../ui/VerificarTarifasPage';

export class DesactivarBeneficioColaborador {
  static with(producto: string, metodoPago: string) {
    return Task.where(
      "#actor desactiva el beneficio del colaborador",
        // 1️⃣ Desactivar beneficio del colaborador
        Wait.for(Duration.ofSeconds(3)), // espera general para asegurar renderizado
        Scroll.to(VerificarTarifasPage.CARD_PRODUCTO(producto)),
        Click.on(VerificarTarifasPage.CARD_PRODUCTO(producto)),
        Wait.for(Duration.ofSeconds(2)),
        Click.on(VerificarTarifasPage.BTN_ELIMINAR_BENEFICIO),
        Wait.for(Duration.ofSeconds(2)),        
        Click.on(VerificarTarifasPage.BTN_ACEPTAR_MODAL),        
        Wait.for(Duration.ofSeconds(6)),        
        Click.on(VerificarTarifasPage.BTN_ACEPTAR_MODAL),
        Wait.for(Duration.ofSeconds(3)),        
    ); 
 }
    static forFamilyWith(producto: string, metodoPago: string, nombreFamiliar: string) {
        return Task.where(
            "#actor desactiva el beneficio del colaborador para el familiar",
                // 1️⃣ Desactivar beneficio del colaborador para el familiar
                Wait.for(Duration.ofSeconds(3)), // espera general para asegurar renderizado
                Scroll.to(VerificarTarifasPage.BTN_ADD_BENEFICIARIO),
                Click.on(VerificarTarifasPage.BTN_ADD_BENEFICIARIO),
                Wait.for(Duration.ofSeconds(2)),
                Click.on(VerificarTarifasPage.CHECKBOX_SELECT_BENEFITS_FAMILIAR(nombreFamiliar)),
                Wait.for(Duration.ofSeconds(5)),
                //Click.on(VerificarTarifasPage.BTN_ACEPTAR_MODAL),        
  
                
        ); 
     }
}
