import { JSDOM } from 'jsdom';
import { extractPitchingData } from '../data-extractor/PitchingDataExtractor.js';

async function filePitchingDataProcessor(file) {
	const dom = await JSDOM.fromFile(file);
	return extractPitchingData(dom);
}

const file = process.argv[2];

filePitchingDataProcessor(file).then((data) => {
	console.log(data);
	console.log('Finish');
});
