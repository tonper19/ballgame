import { PitchingPlayerInterpreter } from '../interpreter/PitchingPlayerInterpreter.js';
import { TenerifePitchingPlayerInterpreter } from '../interpreter/tenerife/TenerifePitchingPlayerInterpreter.js';

const HEADER = 'Surname,First Name,Team,W,L,ERA,APP,GS,SV,CG,SHO,IP,H,R,ER,BB,SO,H2,H3,HR,AB,BAVG,WP,HBP,BK,SFA,SHA,GO,FO';

function extractPlayerData(playerInterpreter) {
	const playerSurName = playerInterpreter.getPlayerSurName();
	const playerFirstName = playerInterpreter.getPlayerFirstName();

	if (!playerSurName || !playerFirstName || playerSurName==='-' || playerFirstName==='-') {
		return null;
	}

	return [
		playerSurName,
		playerFirstName,
		playerInterpreter.getTeam(),
		playerInterpreter.getW(),
		playerInterpreter.getL(),
		playerInterpreter.getERA(),
		playerInterpreter.getAPP(),
		playerInterpreter.getGS(),
		playerInterpreter.getSV(),
		playerInterpreter.getCG(),
		playerInterpreter.getSHO(),
		playerInterpreter.getIP(),
		playerInterpreter.getH(),
		playerInterpreter.getR(),
		playerInterpreter.getER(),
		playerInterpreter.getBB(),
		playerInterpreter.getSO(),
		playerInterpreter.get2B(),
		playerInterpreter.get3B(),
		playerInterpreter.getHR(),
		playerInterpreter.getAB(),
		playerInterpreter.getBAVG(),
		playerInterpreter.getWP(),
		playerInterpreter.getHB(),
		playerInterpreter.getBK(),
		playerInterpreter.getSFA(),
		playerInterpreter.getSHA(),
		playerInterpreter.getGO(),
		playerInterpreter.getFO()
	].join(',');
}

function extractPitchingDataFromTable(document, tableSelector, InterpreterClass) {
	return Array.from(document.querySelectorAll(tableSelector))
			.filter(row => !(row.textContent.includes('Player') && row.textContent.includes('w-l')))
			.filter(row => !row.textContent.includes('----------'))
			.map(row => new InterpreterClass(row))
			.map(extractPlayerData)
			.filter(Boolean) // Filters out `null` values
			.map(data => data);
}

function createPlayerDataExtractor(document) {
	return document.body.textContent.includes('(All games Sorted by Batting avg)')
			? extractTenerifePitchingData
			:extractWBSCData;
}

function extractWBSCData(document) {
	return [
		HEADER,
		...extractPitchingDataFromTable(document, '.stats-content tbody tr', PitchingPlayerInterpreter)
	];
}

function extractTenerifePitchingData(document) {
	const targetTable = Array.from(document.querySelectorAll('table'))
			.find(table => {
				const headers = Array.from(table.querySelectorAll('tr td')).map(td =>
						td.textContent.trim().toLowerCase()
				);

				return headers.includes('player') && headers.includes('w-l') && headers.includes('app-gs');
			});

	if (!targetTable) {
		console.error('Target table not found.');
		return [HEADER];
	}

	return [
		HEADER,
		...extractPitchingDataFromTable(targetTable, 'tr', TenerifePitchingPlayerInterpreter)
	];
}

export function extractPitchingData(dom) {
	return createPlayerDataExtractor(dom.window.document)(dom.window.document).filter(Boolean);
}