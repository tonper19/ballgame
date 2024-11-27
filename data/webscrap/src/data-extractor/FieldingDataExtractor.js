import { FieldingPlayerInterpreter } from '../interpreter/FieldingPlayerInterpreter.js';
import { TenerifeFieldingPlayerInterpreter } from '../interpreter/tenerife/TenerifeFieldingPlayerInterpreter.js';

const HEADER = 'Surname,First Name,Team,G,C,PO,A,E,FLDP,DP,SBA,CSB,SBAP,PB,CI';

function extractPlayerData(playerInterpreter) {
	const playerSurName = playerInterpreter.getPlayerSurName();
	const playerFirstName = playerInterpreter.getPlayerFirstName();

	if (playerSurName==='-' || playerFirstName==='-') {
		return;
	}
	
	const playerData = [
		playerSurName,
		playerFirstName,
		playerInterpreter.getTeam(),
		playerInterpreter.getG(),
		playerInterpreter.getC(),
		playerInterpreter.getPO(),
		playerInterpreter.getA(),
		playerInterpreter.getE(),
		playerInterpreter.getFLDP(),
		playerInterpreter.getDP(),
		playerInterpreter.getSBA(),
		playerInterpreter.getCSB(),
		playerInterpreter.getSBAP(),
		playerInterpreter.getPB(),
		playerInterpreter.getCI()
	]
	return playerData.join(',');
}

function extractFieldingDataFromTable(document, tableSelector, InterpreterClass) {
	return Array.from(document.querySelectorAll(tableSelector))
			.filter(row => !(row.textContent.includes('Player') && row.textContent.includes("sba")))
			.filter(row => !row.textContent.includes("----------"))
			.map(row => new InterpreterClass(row))
			.map(extractPlayerData)
			.filter(Boolean) // Filters out `null` values
			.map(data => data);
}

function createPlayerDataExtractor(document) {
	return document.body.textContent.includes('(All games Sorted by Batting avg)')
			? extractTenerifeFieldingData
			: extractWBSCData;
}

function extractWBSCData(document) {
	return [
		HEADER,
		...extractFieldingDataFromTable(document, '.stats-content tbody tr', FieldingPlayerInterpreter)
	];
}

function extractTenerifeFieldingData(document) {
	const targetTable = Array.from(document.querySelectorAll('table'))
			.find(table => {
				const headers = Array.from(table.querySelectorAll('tr td')).map(td =>
						td.textContent.trim().toLowerCase()
				);

				return headers.includes('player') && headers.includes('po') && headers.includes('sba');
			});

	if (!targetTable) {
		console.error('Target table not found.');
		return [HEADER];
	}

	return [
		HEADER,
		...extractFieldingDataFromTable(targetTable, 'tr', TenerifeFieldingPlayerInterpreter)
	];
}

export function extractFieldingData(dom) {
	return createPlayerDataExtractor(dom.window.document)(dom.window.document).filter(Boolean);
}