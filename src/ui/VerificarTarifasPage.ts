import { By, PageElement } from '@serenity-js/web';

export class VerificarTarifasPage {

    static CARD_SERVICIO(nombre: string) {
        return PageElement.located(
            By.xpath(`*//p[@class="card-title"][contains(.,'${nombre}')]`)            
        ).describedAs(`tarjeta del servicio ${nombre}`);
    }   

    static CARD_CATEGORIA(nombre: string) {
        return PageElement.located(
            By.xpath(`*//p[@class="card-title"][contains(.,'${nombre}')]`)
        ).describedAs(`tarjeta de la categoría ${nombre}`);
    }

    static CARD_ENTIDAD(nombre: string) {
        return PageElement.located(
            By.xpath(`*//p[@class="card-title"][contains(.,'${nombre}')]`)
        ).describedAs(`tarjeta de la entidad ${nombre}`);
    }

    static CARD_PRODUCTO(nombre: string) {
        return PageElement.located(
            By.xpath(`*//p[@class="card-title"][contains(.,'${nombre}')]`)
        ).describedAs(`tarjeta del producto ${nombre}`);
    }

    static readonly SELECT_METODO_PAGO = PageElement.located(
            By.xpath(`//select[@id="paymentMethod"]`)
        ).describedAs('selector del método de pago');

    static TARIFA_PRODUCTO(nombreProducto: string) {
        return PageElement.located(
            By.xpath(`*//div[@class="text-center"]//p[contains(.,'${nombreProducto}')]`)            
        ).describedAs(`tarifa del producto ${nombreProducto}`);
    }

   static readonly MODAL_CONFIRMACION = PageElement.located(
        By.css('app-modals .modal-body')
    ).describedAs('modal de confirmación de tarifa');

    static readonly MODAL_TEXTO_TARIFA = PageElement.located(
        By.xpath(`//app-modals//p[contains(.,'Has seleccionado')]`)
    ).describedAs('texto del modal con el valor de la tarifa');

    static readonly BTN_ACTIVAR_BENEFICIO = PageElement.located(
        By.css('button.btn.btn-lg.btn-primary.rounded-pill.w-100')
    ).describedAs('botón Activar beneficio');

    static readonly BTN_ACEPTAR_MODAL = PageElement.located(
        By.xpath(`//app-modals//button[contains(.,'Aceptar')]`)
    ).describedAs('botón Aceptar del modal de confirmación');
}
