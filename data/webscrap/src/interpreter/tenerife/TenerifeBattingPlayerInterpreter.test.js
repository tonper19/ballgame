import { TenerifeBattingPlayerInterpreter } from './TenerifeBattingPlayerInterpreter.js';
import { describe, expect, it } from 'vitest';
import { JSDOM } from 'jsdom';

const input = `
<!-- 0 and 1 -->
<td align=left><font face=verdana size=1 color="#000000">Mario Ismel Herrera, CARDENALES&nbsp;</td>
<!--2 avg-->
<td align=right><font face=verdana size=1 color="#000000"> .667&nbsp;</td>
<!--3 gp-gs -->
<td align=center><font face=verdana size=1 color="#000000">7-7&nbsp;</td>
<!--4 ab-->
<td align=right><font face=verdana size=1 color="#000000">21&nbsp;</td>
<!--5 r-->
<td align=right><font face=verdana size=1 color="#000000">11&nbsp;</td>
<!--6 h-->
<td align=right><font face=verdana size=1 color="#000000">14&nbsp;</td>
<!--7 2b-->
<td align=right><font face=verdana size=1 color="#000000">6&nbsp;</td>
<!--8 3b-->
<td align=right><font face=verdana size=1 color="#000000">0&nbsp;</td>
<!--9 hr-->
<td align=right><font face=verdana size=1 color="#000000">2&nbsp;</td>
<!--10 rbi-->
<td align=right><font face=verdana size=1 color="#000000">10&nbsp;</td>
<!--11 tb-->
<td align=right><font face=verdana size=1 color="#000000">26&nbsp;</td>
<!--12 slg%-->
<td align=right><font face=verdana size=1 color="#000000">1.238&nbsp;</td>
<!--13 bb-->
<td align=right><font face=verdana size=1 color="#000000">4&nbsp;</td>
<!--14 hbp-->
<td align=right><font face=verdana size=1 color="#000000">3&nbsp;</td>
<!--15 so-->
<td align=right><font face=verdana size=1 color="#000000">51&nbsp;</td>
<!--16 gdp-->
<td align=right><font face=verdana size=1 color="#000000">5&nbsp;</td>
<!--17 ob%-->
<td align=right><font face=verdana size=1 color="#000000"> .720&nbsp;</td>
<!--18 sf-->
<td align=right><font face=verdana size=1 color="#000000">8&nbsp;</td>
<!--19 sh-->
<td align=right><font face=verdana size=1 color="#000000">9&nbsp;</td>
<!--20 sb-att-->
<td align=center><font face=verdana size=1 color="#000000">25-42&nbsp;</td>
`;

describe('TenerifeBattingPlayerInterpreter with correct data', () => {
	const playerInterpreter = new TenerifeBattingPlayerInterpreter(new JSDOM(input).window.document.body);

	describe('getPlayerSurName', () => {
		it('should return the player\'s surname', () => {
			const result = playerInterpreter.getPlayerSurName();
			expect(result).toBe('Ismel Herrera');
		});
	});

	describe('getPlayerFirstName', () => {
		it('should return the player\'s first name', () => {
			const result = playerInterpreter.getPlayerFirstName();
			expect(result).toBe('Mario');
		});
	});

	describe('getTeam', () => {
		it('should return the player\'s team', () => {
			const result = playerInterpreter.getTeam();
			expect(result).toBe('CARDE');
		});
	});

	describe('getAB', () => {
		it('should return the player\'s AB', () => {
			const result = playerInterpreter.getAB();
			expect(result).toBe('21');
		});
	});

	describe('getR', () => {
		it('should return the player\'s R', () => {
			const result = playerInterpreter.getR();
			expect(result).toBe('11');
		});
	});

	describe('getH', () => {
		it('should return the player\'s H', () => {
			const result = playerInterpreter.getH();
			expect(result).toBe('14');
		});
	});

	describe('getH2', () => {
		it('should return the player\'s H2', () => {
			const result = playerInterpreter.getH2();
			expect(result).toBe('6');
		});
	});

	describe('getH3', () => {
		it('should return the player\'s H3', () => {
			const result = playerInterpreter.getH3();
			expect(result).toBe('0');
		});
	});

	describe('getHR', () => {
		it('should return the player\'s HR', () => {
			const result = playerInterpreter.getHR();
			expect(result).toBe('2');
		});
	});

	describe('getRBI', () => {
		it('should return the player\'s RBI', () => {
			const result = playerInterpreter.getRBI();
			expect(result).toBe('10');
		});
	});

	describe('getTB', () => {
		it('should return the player\'s TB', () => {
			const result = playerInterpreter.getTB();
			expect(result).toBe('26');
		});
	});

	describe('getAVG', () => {
		it('should return the player\'s AVG', () => {
			const result = playerInterpreter.getAVG();
			expect(result).toBe('');
		});
	});

	describe('getSLG', () => {
		it('should return the player\'s SLG', () => {
			const result = playerInterpreter.getSLG();
			expect(result).toBe('');
		});
	});
	
	describe('getOBP', () => {
		it('should return the player\'s OBP', () => {
			const result = playerInterpreter.getOBP();
			expect(result).toBe('');
		});
	});
	
	describe('getOPS', () => {
		it('should return the player\'s OPS', () => {
			const result = playerInterpreter.getOPS();
			expect(result).toBe('');
		});
	});
		
	describe('getBB', () => {
		it('should return the player\'s BB', () => {
			const result = playerInterpreter.getBB();
			expect(result).toBe('4');
		});
	});
			
	describe('getHBP', () => {
		it('should return the player\'s HBP', () => {
			const result = playerInterpreter.getHBP();
			expect(result).toBe('3');
		});
	});
				
	describe('getSO', () => {
		it('should return the player\'s SO', () => {
			const result = playerInterpreter.getSO();
			expect(result).toBe('51');
		});
	});
					
	describe('getGDP', () => {
		it('should return the player\'s GDP', () => {
			const result = playerInterpreter.getGDP();
			expect(result).toBe('5');
		});
	});
						
	describe('getSF', () => {
		it('should return the player\'s SF', () => {
			const result = playerInterpreter.getSF();
			expect(result).toBe('8');
		});
	});
							
	describe('getSH', () => {
		it('should return the player\'s SH', () => {
			const result = playerInterpreter.getSH();
			expect(result).toBe('9');
		});
	});
								
	describe('getSB', () => {
		it('should return the player\'s SB', () => {
			const result = playerInterpreter.getSB();
			expect(result).toBe('25');
		});
	});
									
	describe('getCS', () => {
		it('should return the player\'s CS', () => {
			const result = playerInterpreter.getCS();
			expect(result).toBe('17');
		});
	});
});