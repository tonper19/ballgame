import { JSDOM } from 'jsdom';
import path from 'path';

const relativeFilePath = '../examples/team/standing.html';

export async function standingTestDataDocument() {
	const filePath = path.join(__dirname, relativeFilePath);
	const dom = await JSDOM.fromFile(filePath);
	return dom.window.document;
}

export async function standingTestData() {
	const filePath = path.join(__dirname, relativeFilePath);
	return await JSDOM.fromFile(filePath);
}