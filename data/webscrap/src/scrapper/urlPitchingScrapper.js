const { get } = require('axios');
const { JSDOM } = require('jsdom');
const fs = require('fs');
const { stringify } = require('csv-stringify');

const { extractPitchingData } = require('./PitchingDataExtractor');

async function urlPitchingDataProcessor(url) {
	return get(url)
			.then(function (response) {
				const dom = new JSDOM(response.data);
				return extractPitchingData(dom);
			});
}

const url = process.argv[2];
const fileName = process.argv[3] || 'pitching.csv';

urlPitchingDataProcessor(url).then((data) => {
	const csv = data.join('\n');
	console.log('Writing data.csv');
	fs.writeFileSync(fileName, csv);
	console.log('Data written');
})
