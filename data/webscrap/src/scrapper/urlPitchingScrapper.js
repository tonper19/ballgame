import fs from 'fs';
import { JSDOM } from 'jsdom';
import { extractPitchingData } from '../data-extractor/PitchingDataExtractor.js';
import { getWebPage } from '../tools/request.js';

async function urlPitchingDataProcessor(url) {
	return getWebPage(url)
			.then(function (response) {
				const dom = new JSDOM(response.data);
				return extractPitchingData(dom);
			});
}

const url = process.argv[2];
const fileName = process.argv[3] || 'pitching.csv';

urlPitchingDataProcessor(url).then((data) => {
	const csv = data.join('\n');
	console.log(`Writing ${fileName}`);
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
})
