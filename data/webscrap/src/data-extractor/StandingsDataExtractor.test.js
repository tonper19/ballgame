import { describe, expect, it } from 'vitest';
import { standingTestDataDocument } from '../data.test.js';
import { extractStandingData, extractTeamStandingData, extractTeamStandingsData } from './StandingsDataExtractor.js';

describe('Given StandingsDataExtractor', () => {
	it('test extractTeamStandingData', async () => {
		const container = await standingTestDataDocument();
		const querySelectorAllElement = container.querySelectorAll('#2056 table.standings-print')[0];
		const teamStandingData = extractTeamStandingData(querySelectorAllElement);
		expect(teamStandingData).toStrictEqual('1,https://static.wbsc.org/assets/cms/teams/logo/a253f065-f476-fd22-2ea4-7cf450180fe4.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23740,MAC,HOTSAND MACERATA,9,1,0,0.900,0');
	});

	it('test extractTeamStandingsData', async () => {
		const container = await standingTestDataDocument();
		const standingTable = container.querySelectorAll('#2056 table.standings-print')[0];
		const teamStandingData = extractTeamStandingsData(standingTable);
		expect(teamStandingData).toStrictEqual([
			'Position,Image,Link,ShorName,FullName,W,L,T,PCT,GB',
			'1,https://static.wbsc.org/assets/cms/teams/logo/a253f065-f476-fd22-2ea4-7cf450180fe4.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23740,MAC,HOTSAND MACERATA,9,1,0,0.900,0',
			'1,https://static.wbsc.org/assets/cms/teams/logo/09fa8d5d-3beb-0f14-7d8e-8d48078672a2.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/24172,RSM,SAN MARINO BASEBALL,9,1,0,0.900,0',
			'3,https://static.wbsc.org/assets/cms/teams/logo/5d9a261e-f8a2-4672-e66f-8fb7a851095d.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23654,ATL,ATHLETICS BASEBALL BO,4,6,0,0.400,5',
			'3,https://static.wbsc.org/upload/15e17f14-1564-cf9d-3db7-2a502ccd9535.png,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23689,POV,PLATFORM-TMC POVIGLIO,4,6,0,0.400,5',
			'5,https://static.wbsc.org/assets/cms/teams/logo/e8c8e847-4d24-9d28-7996-c93794738555.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23724,LON,LONGBRIDGE 2000 BOLOGNA,3,7,0,0.300,6',
			'6,https://static.wbsc.org/assets/cms/teams/logo/c4bed522-05cc-8294-b525-96f7278aa24b.jpg,https://www.fibs.it/en/events/2023-serie-a-baseball/teams/23615,PAU,PADULE BASEBALL SESTO FIORENTINO,1,9,0,0.100,8',
		]);
	});

	it('test extractStandingData', async () => {
		const container = await standingTestDataDocument();
		const elements = container.querySelector('.standings-page');
		expect(extractStandingData(container)).toStrictEqual([
			{ id: '2056', name: 'Prima Fase - Qualificazione' },
			{ id: '2621', name: 'Seconda Fase' },
			{ id: '2842', name: 'Quarti di Finale' },
			{ id: '2920', name: 'Semifinali' },
			{ id: '2970', name: 'Italian Baseball Series' }
		]);
	});
})