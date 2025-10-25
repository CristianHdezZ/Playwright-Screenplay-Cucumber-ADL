import { PageElement, By } from '@serenity-js/web';

export class RegistrarVehiculoPage {

    static readonly BTN_MIS_VEHICULOS = PageElement.located(
        By.xpath("//button[normalize-space()='Mis vehículos']")
    ).describedAs('botón Mis vehículos');

    static readonly BTN_ADD_VEHICULO = PageElement.located(
        By.xpath("//button[contains(.,'Añadir vehículo')]")
    ).describedAs('botón Añadir vehículo');

    static readonly TITLE_REGISTRO_VEHICULO = PageElement.located(
        By.xpath("//h4[normalize-space()='Registrar vehículo']")
    ).describedAs('título del modal Registrar vehículo');

    static readonly RADIO_PROPIETARIO_SI = PageElement.located(
        By.xpath("//label[contains(.,'Sí')]")
    ).describedAs('radio Sí en Eres propietario del vehículo');

    static RADIO_PROPIETARIO(valor: string){
        return PageElement.located(
            By.xpath(`//div//label[contains(.,'Eres propietario del vehículo')]/../div/label[contains(.,'${valor}')]/../input`)
        ).describedAs(`radio ${valor} de propietario del vehículo`);
    } 

    static readonly SELECT_PROPIETARIO = PageElement.located(
        By.xpath("//select[@formcontrolname='familyCode']")
    ).describedAs('selector Propietario');

    static readonly INPUT_PLACA = PageElement.located(
        By.xpath("//input[@formcontrolname='plate']")
    ).describedAs('campo Placa');

    static readonly INPUT_MODELO = PageElement.located(
        By.xpath("//input[@formcontrolname='model']")
    ).describedAs('campo Modelo');

    static readonly SELECT_TIPO_VEHICULO = PageElement.located(
        By.xpath("//select[@formcontrolname='idVehicleType']")
    ).describedAs('selector Tipo de vehículo');

    static readonly SELECT_MARCA = PageElement.located(
        By.xpath("//select[@formcontrolname='idBrandCode']")
    ).describedAs('selector Marca');

     static readonly SELECT_DEPARTAMENTO = PageElement.located(
        By.xpath("//select[@formcontrolname='idDeparmentCirculation']")
    ).describedAs('select Departamento');

    static readonly SELECT_CIUDAD = PageElement.located(
        By.xpath("//select[@formcontrolname='idCityCirculation']")
    ).describedAs('select Ciudad');

    static readonly SELECT_TIPO_SERVICIO = PageElement.located(
        By.xpath("//select[@formcontrolname='idServiceType']")
    ).describedAs('select Tipo de servicio');

    static readonly BTN_REGISTRAR = PageElement.located(
        By.xpath("//button[span[text()='Registrar']]")
    ).describedAs('botón Registrar');

    static readonly MSG_EXITO = PageElement.located(
        By.xpath("//h5[contains(text(),'¡Los datos fueron guardados con éxito!')]")
    ).describedAs('mensaje de éxito');
}
