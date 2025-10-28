import { PageElement, By } from '@serenity-js/web';

export class RegistrarFamiliarPage {

    static BUTTON_MI_FAMILIA(nombreSesion: string) {
        return PageElement.located(
            By.xpath(`//button[text()='${nombreSesion}']`)
        ).describedAs(`botón de la sesion ${nombreSesion}`);
    }   

    static readonly BUTTON_ADD_FAMILIA = PageElement.located(
        By.xpath("//button[text()=' Añadir familiar ']")
    ).describedAs('botón Añadir familiar');

    static readonly PRIMER_NOMBRE = PageElement.located(
        By.xpath("//input[@formcontrolname='firstName']")
    ).describedAs('campo Primer Nombre');

    static readonly SEGUNDO_NOMBRE = PageElement.located(
        By.xpath("//input[@formcontrolname='middleName']")
    ).describedAs('campo Segundo Nombre');

    static readonly PRIMER_APELLIDO = PageElement.located(
        By.xpath("//input[@formcontrolname='firstSurname']")
    ).describedAs('campo Primer Apellido');

    static readonly SEGUNDO_APELLIDO = PageElement.located(
        By.xpath("//input[@formcontrolname='secondLastName']")
    ).describedAs('campo Segundo Apellido');

    static readonly TIPO_DOCUMENTO = PageElement.located(
        By.xpath("//select[@formcontrolname='typeDocument']")
    ).describedAs('selector Tipo de Documento');

    static readonly NUMERO_DOCUMENTO = PageElement.located(
        By.xpath("//input[@formcontrolname='documentNumber']")
    ).describedAs('campo Número de Documento');

    static readonly FECHA_NACIMIENTO = PageElement.located(
        By.xpath("//input[@formcontrolname='birthdate']")
    ).describedAs('campo Fecha de Nacimiento');

    static readonly GENERO = PageElement.located(
        By.xpath("//select[@formcontrolname='gender']")
    ).describedAs('selector Género');

    static readonly PARENTESCO = PageElement.located(
        By.xpath("//select[@formcontrolname='relationship']")
    ).describedAs('selector Parentesco');

    static readonly EPS = PageElement.located(
        By.xpath("//select[@formcontrolname='eps']")
    ).describedAs('selector EPS');

    static readonly DEPARTAMENTO = PageElement.located(
        By.xpath("//select[@formcontrolname='departmentCode']")
    ).describedAs('selector Departamento');

    static readonly CIUDAD = PageElement.located(
        By.xpath("//select[@formcontrolname='cityCode']")
    ).describedAs('selector Ciudad');

    static readonly BTN_REGISTRAR = PageElement.located(
        By.xpath("//button[span[text()='Registrar']]")
    ).describedAs('botón Registrar');

    static readonly BTN_REGRESAR = PageElement.located(
        By.xpath("//button[text()='Regresar']")
    ).describedAs('botón Regresar');

    static readonly BTN_ACEPTAR = PageElement.located(
        By.xpath("*//button[contains(.,'Aceptar')]")
    ).describedAs('botón Aceptar');

    static readonly MSG_EXITO = PageElement.located(
        By.xpath("//div[contains(@class,'text-center')]/h5[contains(text(),'¡Los datos fueron guardados con éxito!')]")
    ).describedAs('mensaje de éxito "¡Los datos fueron guardados con éxito!"');


     // --- Tabla de familiares ---
    static readonly LISTA_FAMILIARES = PageElement.located(By.css('tbody tr'))
        .describedAs('Lista de familiares');

    static BTN_EDITAR(numeroDocumento: string){
        return PageElement.located(By.xpath(`(*//td[contains(.,"${numeroDocumento}")]/..//div/button/img[@alt="edit"])[1]`))
        .describedAs(`botón editar familiar con documento ${numeroDocumento}`);
    }       

    static readonly BTN_ACTUALIZAR = PageElement.located(By.xpath('*//button[@class="btn-form-aval"]//span[contains(text(),"Actualizar")]'))
    .describedAs('Botón actualizar familiar');

  // --- Mensaje de éxito ---
  static readonly MENSAJE_EXITO = PageElement.located(
    By.xpath("//div[contains(@class,'text-center')]/h5[contains(text(),'¡Los datos fueron actualizados con éxito!')]")
    ).describedAs('Mensaje de éxito al actualizar');    
}
