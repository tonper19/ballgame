import fs from 'fs';
import { JSDOM } from 'jsdom';
import { extractFieldingData } from '../data-extractor/FieldingDataExtractor.js';
import { getWebPage } from '../tools/request.js';

async function urlFieldingDataProcessor(url) {
	return getWebPage(url)
			.then(function (response) {
				const dom = new JSDOM(response.data);
				return extractFieldingData(dom);
			});
}

const file = process.argv[2];
const fileName = process.argv[3] || 'fielding.csv';

JSDOM.fromFile(file, { contentType: 'text/html; charset=utf-8' }).then((dom) => {
	console.log(`Processing ${file}`);
	const data = extractFieldingData(dom);
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
}).catch((error) => {
	console.error(error);
});

