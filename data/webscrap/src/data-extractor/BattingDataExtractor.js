import { BattingPlayerInterpreter } from '../interpreter/BattingPlayerInterpreter.js';
import { TenerifeBattingPlayerInterpreter } from '../interpreter/tenerife/TenerifeBattingPlayerInterpreter.js';

// Player,Team,AB,R,H,H2,H3,HR,RBI,TB,AVG,SLG,OBP,OPS,BB,HBP,SO,GDP,SF,SH,SB,CS

const HEADER = 'Surname,First Name,Team,AB,R,H,H2,H3,HR,RBI,TB,AVG,SLG,OBP,OPS,BB,HBP,SO,GDP,SF,SH,SB,CS';

function extractPlayerData(playerInterpreter) {
	const playerSurName = playerInterpreter.getPlayerSurName();
	const playerFirstName = playerInterpreter.getPlayerFirstName();

	if (!playerSurName || !playerFirstName || playerSurName === '-' || playerFirstName === '-') {
		return null;
	}

	return [
		playerSurName,
		playerFirstName,
		playerInterpreter.getTeam(),
		playerInterpreter.getAB(),
		playerInterpreter.getR(),
		playerInterpreter.getH(),
		playerInterpreter.getH2(),
		playerInterpreter.getH3(),
		playerInterpreter.getHR(),
		playerInterpreter.getRBI(),
		playerInterpreter.getTB(),
		playerInterpreter.getAVG(),
		playerInterpreter.getSLG(),
		playerInterpreter.getOBP(),
		playerInterpreter.getOPS(),
		playerInterpreter.getBB(),
		playerInterpreter.getHBP(),
		playerInterpreter.getSO(),
		playerInterpreter.getGDP(),
		playerInterpreter.getSF(),
		playerInterpreter.getSH(),
		playerInterpreter.getSB(),
		playerInterpreter.getCS()
	].join(',')
}

function extractBattingDataFromTable(document, tableSelector, InterpreterClass) {
	return Array.from(document.querySelectorAll(tableSelector))
			.filter(row => !(row.textContent.includes("Player") && row.textContent.includes("sb-att")))
			.filter(row => !row.textContent.includes("----------"))
			.map(row => new InterpreterClass(row))
			.map(extractPlayerData)
			.filter(Boolean) // Filters out `null` values
			.map(data => data);
}

function createPlayerDataExtractor(document) {
	return document.body.textContent.includes('(All games Sorted by Batting avg)')
			? extractTenerifeBattingData
			: extractWBSCData;
}

function extractWBSCData(document) {
	return [
		HEADER,
		...extractBattingDataFromTable(document, '.stats-content tbody tr', BattingPlayerInterpreter)
	];
}

function extractTenerifeBattingData(document) {
	const targetTable = Array.from(document.querySelectorAll("table"))
			.find(table => {
				const headers = Array.from(table.querySelectorAll("tr td")).map(td =>
						td.textContent.trim().toLowerCase()
				);
				
				return headers.includes("player") && headers.includes("avg") && headers.includes("sb-att");
			});

	if (!targetTable) {
		console.error("Target table not found.");
		return [HEADER];
	}
	
	return [
		HEADER,
		...extractBattingDataFromTable(targetTable, "tr", TenerifeBattingPlayerInterpreter)
	];
}

export function extractBattingData(dom) {
	return createPlayerDataExtractor(dom.window.document)(dom.window.document).filter(Boolean);
}
