import fs from 'fs';
import { JSDOM } from 'jsdom';
import { extractBattingData } from '../data-extractor/BattingDataExtractor.js';
import { getWebPage } from '../tools/request.js';

async function urlBattingDataProcessor(url) {
	return getWebPage(url)
			.then(function (response) {
				const dom = new JSDOM(response.data);
				return extractBattingData(dom);
			});
}

const url = process.argv[2];
const fileName = process.argv[3] || 'batting.csv';

urlBattingDataProcessor(url).then((data) => {
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
})
