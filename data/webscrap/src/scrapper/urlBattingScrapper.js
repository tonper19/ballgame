import fs from 'fs';
import { JSDOM } from 'jsdom';
import axios from 'axios';
import { extractBattingData } from '../data-extractor/BattingDataExtractor.js';

async function urlBattingDataProcessor(url) {
	return axios.get(url)
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
