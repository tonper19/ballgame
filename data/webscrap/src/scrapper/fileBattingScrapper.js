import fs from 'fs';
import { JSDOM } from 'jsdom';
import { extractBattingData } from '../data-extractor/BattingDataExtractor.js';

const file = process.argv[2];
const fileName = process.argv[3] || 'batting.csv';

JSDOM.fromFile(file, { contentType: 'text/html; charset=utf-8' }).then((dom) => {
	console.log(`Processing ${file}`);
	const data = extractBattingData(dom);
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
}).catch((error) => {
	console.error(error);
});
