import fs from 'fs';
import { JSDOM } from 'jsdom';
import { extractPitchingData } from '../data-extractor/PitchingDataExtractor.js';

const file = process.argv[2];
const fileName = process.argv[3] || 'pitching.csv';

JSDOM.fromFile(file).then((dom) => {
	console.log(`Processing ${file}`);
	const data = extractPitchingData(dom);
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
}).catch((error) => {
	console.error(error);
});