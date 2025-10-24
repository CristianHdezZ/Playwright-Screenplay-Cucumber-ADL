import * as XLSX from 'xlsx';

export class ExcelReader {

    // static readSheet<T>(filePath: string, sheetName: string): T[] {
    //     const workbook = XLSX.readFile(filePath);
    //     const sheet = workbook.Sheets[sheetName];
    //     return XLSX.utils.sheet_to_json<T>(sheet);
    // }

    // Usamos 'any[]' para evitar el error 'unknown' sin perder flexibilidad
    static readExcel(filePath: string): any[] {
        const workbook = XLSX.readFile(filePath);
        const sheetName = workbook.SheetNames[0];
        const sheet = workbook.Sheets[sheetName];
        const data: any[] = XLSX.utils.sheet_to_json(sheet, { defval: '' }) as any[];

        return data.map((row: any) => {
            if (typeof row['fechaNacimiento'] === 'number') {
                row['fechaNacimiento'] = ExcelReader.excelDateToISO(row['fechaNacimiento']);
            }
            return row;
        });
    }

    private static excelDateToISO(serial: number): string {
        const utcDays = Math.floor(serial - 25569);
        const utcValue = utcDays * 86400; // segundos
        const dateInfo = new Date(utcValue * 1000);
        const year = dateInfo.getUTCFullYear();
        const month = String(dateInfo.getUTCMonth() + 1).padStart(2, '0');
        const day = String(dateInfo.getUTCDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }


  /**
     * 📖 Lee una hoja específica del archivo Excel y devuelve un arreglo tipado.
     * @param filePath Ruta del archivo Excel.
     * @param sheetName Nombre de la hoja a leer.
     */
    static readSheet<T>(filePath: string, sheetName: string): T[] {
        try {
            const workbook = XLSX.readFile(filePath);
            const sheet = workbook.Sheets[sheetName];

            if (!sheet) {
                throw new Error(`❌ La hoja "${sheetName}" no existe en el archivo Excel: ${filePath}`);
            }

            const data = XLSX.utils.sheet_to_json(sheet, { defval: '' });

            // 🔄 Mapeo de filas y conversión de fechas
            return data.map((row: any) => {
                // Si el campo fechaNacimiento es numérico, convertirlo a ISO
                if (typeof row['fechaNacimiento'] === 'number') {
                    row['fechaNacimiento'] = ExcelReader.excelDateToISO(row['fechaNacimiento']);
                }

                // Si el campo fechaNacimiento ya viene como string (YYYY-MM-DD o similar), normalizarlo
                if (typeof row['fechaNacimiento'] === 'string' && /^\d{2,4}[-/]\d{1,2}[-/]\d{1,2}$/.test(row['fechaNacimiento'])) {
                    row['fechaNacimiento'] = new Date(row['fechaNacimiento']).toISOString().split('T')[0];
                }

                return row as T;
            });

        } catch (error) {
            console.error(`⚠️ Error al leer la hoja Excel: ${sheetName}`, error);
            return [];
        }
    }

    /**
     * 🔢 Convierte un número de fecha de Excel a formato ISO (YYYY-MM-DD).
     * @param excelDate Número de fecha de Excel.
     */
    // static excelDateToISO(excelDate: number): string {
    //     const jsDate = new Date(Math.round((excelDate - 25569) * 86400 * 1000)); // 25569 = días entre 1900 y 1970
    //     return jsDate.toISOString().split('T')[0]; // formato: YYYY-MM-DD
    // }  
}