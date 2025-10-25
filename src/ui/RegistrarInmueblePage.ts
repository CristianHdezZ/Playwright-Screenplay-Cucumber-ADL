import { PageElement, By } from '@serenity-js/web';

export class RegistrarInmueblePage {

    static readonly BTN_MIS_INMUEBLES = PageElement.located(
        By.xpath("//button[normalize-space()='Mis inmuebles']")
    ).describedAs('botón Mis inmuebles');

    static readonly BTN_ADD_INMUEBLE = PageElement.located(
        By.xpath("//button[contains(.,'Añadir inmueble')]")
    ).describedAs('botón Añadir inmueble');

    static readonly INPUT_DIRECCION = PageElement.located(
        By.xpath("//input[@formcontrolname='address']")
    ).describedAs('campo Dirección');

    static readonly SELECT_DEPARTAMENTO = PageElement.located(
        By.xpath("//select[@formcontrolname='idDepartment']")
    ).describedAs('selector Departamento');

    static readonly SELECT_CIUDAD = PageElement.located(
        By.xpath("//select[@formcontrolname='idCity']")
    ).describedAs('selector Ciudad');

    static readonly SELECT_TIPO_INMUEBLE = PageElement.located(
        By.xpath("//select[@formcontrolname='idRealStateType']")
    ).describedAs('selector Tipo de inmueble');

    static readonly INPUT_NOMBRE_CONJUNTO = PageElement.located(
        By.xpath("//input[@formcontrolname='buildName']")
    ).describedAs('campo Nombre del conjunto');

    static readonly INPUT_INTERIOR = PageElement.located(
        By.xpath("//input[@formcontrolname='interior']")
    ).describedAs('campo Interior');

    static readonly INPUT_TORRE = PageElement.located(
        By.xpath("//input[@formcontrolname='tower']")
    ).describedAs('campo Torre');

    static readonly INPUT_APARTAMENTO = PageElement.located(
        By.xpath("//input[@formcontrolname='aparment']")
    ).describedAs('campo Apartamento');

    static readonly SELECT_CONJUNTO = PageElement.located(
        By.xpath("//select[@formcontrolname='idHomeType']")
    ).describedAs('selector Tipo de conjunto');

    static readonly INPUT_ANIOS_CONSTRUCCION = PageElement.located(
        By.xpath("//input[@formcontrolname='year']")
    ).describedAs('campo Años de construcción');

    static readonly INPUT_PISOS = PageElement.located(
        By.xpath("//input[@formcontrolname='floors']")
    ).describedAs('campo Número de pisos');

    static readonly BTN_REGISTRAR = PageElement.located(
        By.xpath("//button[span[normalize-space()='Registrar']]")
    ).describedAs('botón Registrar');

    static readonly MSG_EXITO = PageElement.located(
        By.xpath("//h5[contains(text(),'¡Los datos fueron guardados con éxito!')]")
    ).describedAs('mensaje de éxito');
    
}
