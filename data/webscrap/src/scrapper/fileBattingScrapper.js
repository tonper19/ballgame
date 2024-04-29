const { get } = require('axios');
const { JSDOM } = require('jsdom');
const { extractBattingData } = require('./BattingDataExtractor');

async function urlBattingDataProcessor(url) {
	return get(url)
			.then(function (response) {
				const dom = new JSDOM(response.data);
				return extractBattingData(dom);
			});
}

async function fileBattingDataProcessor(file) {
	const dom = await JSDOM.fromFile(file);
	return extractBattingData(dom);
}

const file = process.argv[2];

fileBattingDataProcessor(file).then((data) => {
	console.log(data);
	console.log('Finish');
});
