import fs from 'fs';
import path from 'path';
import Papa from 'papaparse';

export class CsvReader {
    static readCsv(filePath: string): any[] {
        const csvFile = fs.readFileSync(path.resolve(filePath), 'utf-8');
        const result = Papa.parse(csvFile, { header: true, skipEmptyLines: true });
        return result.data;
    }
}