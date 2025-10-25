import { By, PageElement } from '@serenity-js/web';

export class HomePage {
  static readonly FORM_TITLE = '(*//a[contains(text()," Tu portafolio actual ")])[2]';
  static readonly MAIN_CONTENT_PERFIL = '(*//div//img[@class="user-avatar"]//..//div/p[@class="text-footer"])[2]';
  static BUTTON_MODULO(nombreModulo: string) {
        return PageElement.located(
            By.xpath(`(//a[contains(text(),'${nombreModulo}')])[2]`)
        ).describedAs(`botón del módulo ${nombreModulo}`);

        
    }
}