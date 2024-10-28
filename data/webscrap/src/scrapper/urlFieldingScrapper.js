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

const url = process.argv[2];
const fileName = process.argv[3] || 'fielding.csv';

urlFieldingDataProcessor(url).then((data) => {
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
})
